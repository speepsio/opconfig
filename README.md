# OPCONFIG 0.9.0 Beta
OPCONFIG is a command line utility that builds valid Tactrix Openport 2.0 stand alone log configurations. It can parse a specially formated CSVs, then generate a valid logcfg.txt for placement on the OP2 SD card.

**How to use:**
* Load master PIDs CSV in an editor/spreadsheet of your choice (e.g, Google Sheets).
* Place an 'x' in the select column of PIDs to export for logging.
* Export the entire sheet including your new selections to CSV.
* Run opconfig, include the filepath to the source csv, from the command line (terminal)
* A correctly formated logcfg.txt file will be created in the same directory as the source csv.

Additional Notes:
It could be useful to export selection variations of the master as it would permit custom logging configurations based on your needs. For mac users, OSX's automator could be utilized to switch log configurations with a simple drag and drop. I'm sure something similar exists in for windows as well.