# OPCONFIG 0.9.0 Beta
OPCONFIG is a command line utility that builds valid Tactrix Openport 2.0 stand alone log configurations. It can parse specially formated CSVs, then generate valid logcfgs for placement on the OP2's SD card. 

**How to use:**
* Load master CSV in an editor/spreadsheet of your choice (e.g, Google Sheets).
* Place an 'x' in the select column of PIDs to be logged.
* Export the entire sheet, including now marked selections, to a new sub-master CSV.
* Run opconfig from terminal (or command line) with 'opconfig <filepath>', where filepath is the directory path, filename, and extension, of the sub-master CSV.
* Logcfg.txt will be created in the same directory as sub-master.
* Copy logcfg.txt to OP2 SD card, then proceed with logging.

**Notes:**
* Do not rename column headers in the master CSV. They are named in accordance to the property requirements of the OP2 (unless preceeded by a semicolon).

**Tips:**
* Create custom log configurations by exporting sub-masters with desired selections. Switch configurations by running them thru opconfig.
* The bleeding edge OBD PIDs Master can be downloaded [here](https://docs.google.com/spreadsheets/d/1ch2tyRrUQ67ai9sxeU1pBr5s8Qz32EOzjVaoeCC4ZqE/edit?usp=sharing). Once all PIDs are confirmed and scaling formulas verified, there will be little need for this to change in the future.



