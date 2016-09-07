# OPCONFIG 0.9.0 Beta
OPCONFIG is a command line utility that builds valid Tactrix Openport 2.0 stand alone log configurations. It can parse specially formated CSVs, then generate valid logcfgs for placement on the OP2's SD card.

**How to use:**
* Load master CSV in an editor/spreadsheet of your choice (e.g, Google Sheets).
* Place an 'x' in the select column of PIDs to be logged.
* Export the entire sheet with selections to new sub-master CSV.
* Run opconfig, including the filepath to sub-master, from command line.
* Logcfg.txt will be created in the same directory as sub-master.
* Place logcfg.txt on the SD card of your OP2, then proceed with logging.

**Notes:**
* Do not rename column headers in the master CSV, as they are critical to this applications function.

**Tips:**
* Create custom log configurations by exporting sub-masters with desired selections. Switch configurations by running them thru opconfig. For mac users, OSX's automator can be utilized to switch log configurations with a simple drag and drop.
* Bleeding edge OBD PIDs Master can be downloaded [here](https://docs.google.com/spreadsheets/d/1ch2tyRrUQ67ai9sxeU1pBr5s8Qz32EOzjVaoeCC4ZqE/edit?usp=sharing). Once all PIDs are confirmed and formulas verified, there will be little need for this to change in the future.



