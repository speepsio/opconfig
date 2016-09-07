{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE CPP #-}



module Main where
import qualified System.Environment as SE
import qualified Data.Maybe as DM 
import Text.ParseCSV as TP
import qualified Data.Text as DT
import qualified Data.Text.IO as DTIO
import qualified Data.Either as DE



appName :: String
appName  = "OPCONFIG"

appVers :: String
appVers = "0.9.0"

appDate :: String
appDate = "[Compiled " ++ __DATE__ ++ " " ++ __TIME__ ++ "]"

appDesc :: String
appDesc  = "Openport Standalone Configurator"

appCopy :: String
appCopy  = "Copyright (C) 2016 by Sean Person"

appUsage :: String
appUsage = "Usage: opconfig <filepath>"



outputFilename :: String 
outputFilename = "logcfg.txt"



stringToMaybe :: String -> Maybe String
stringToMaybe s
    | s == "" = Nothing
    | otherwise = Just s


tupleToMaybe :: ([a], Maybe [a]) -> Maybe [a]
tupleToMaybe (a,b) 
    | DM.isNothing b == True = Nothing
    | otherwise = Just $ a ++ DM.fromJust b


listToMaybe :: [Maybe a] -> Maybe [Maybe a]
listToMaybe xs
    | DM.isNothing (head xs) == True = Nothing
    | otherwise = Just xs



formatTologcfg :: [[String]] -> String
formatTologcfg xs = channel ++ uds ++ params ++ triggers
    where
        channel  = ";-----[ channel setup   ]-----\n\ntype = obd\nprotocolid = 6 ; ISO15765\n\n\n"
        uds      = ";-----[ uds setup (rom patch REQUIRED for mode 0x23 functionality) ]-----\n\nmode23txaddrwidth = 4\nmode23txlenwidth = 2\nmode23rxaddrwidth = 0\n\n\n"
        params   = ";-----[ logable parameters ]-----\n\n" ++
                   ( unlines                                     -- list to single string 
                   . map unlines                                 -- nested lists to strings with '\n' 
                   . map DM.catMaybes                            -- drop nothings, concat justs
                   . DM.catMaybes                                -- drop nested nothings, concat nested justs
                   . map listToMaybe                             -- map list of maybes to maybe list of maybes
                   . (map . map) tupleToMaybe                    -- map tuples to maybes
                   . map (zip (map ((\ a b -> b ++ a) " = ") . head $ xs)) -- map header properties to values as tuple (prop,value)  
                   $ (map . map) stringToMaybe . tail $ xs )
        triggers = "\n\n;-----[ triggers ]-----\n\nconditionrpn = SCCS_V,4.0,>,SCCS_V,4.25,<,&&\naction = start\n\nconditionrpn = SCCS_V,3.0,>,SCCS_V,3.25,<,&&\naction = stop\n\n\n"



main :: IO()
main = do 

    putStrLn $ appName ++ " " ++ appVers ++ " " ++ appDate ++ "\n" ++ appDesc ++ "\n" ++ appCopy ++ "\n"
    
    args <- SE.getArgs
    
    if (length args /= 1)
        then do
            putStrLn appUsage
        else do
            csvText <- DTIO.readFile $ head args
            DE.either (\err -> putStrLn err) 
                      (\csv -> do 
                                writeFile (outputFilename) . formatTologcfg . (map . map) DT.unpack $ csv
                                putStrLn $ "Output: " ++ outputFilename)
                      $ parseCSV csvText

