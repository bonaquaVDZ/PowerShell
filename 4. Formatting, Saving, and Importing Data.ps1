# 17. Formatting Output
# 18. Saving Output
# 19. Importing Data
# 20. Practice Problem


##########################################################################
######################### 17. Formatting Output ##########################
##########################################################################

cd .\Downloads

$files = dir
$files | Format-Wide
$files | Format-list
$files | format-list -Property Name, Length, LastAccessTime
$files | format-table -Property Name, Length, LastAccessTime
$files | sort -Pr Length | format-table -Pr Name, Length, LastAccessTime


Get-Process |format-table
Get-Process |sort ProcessName | format-table

Get-Process |format-table -Pr Path, Name, Id, Company

Get-Process |format-table -Pr Path, Name, Id, Company -AutoSize
Get-Process |sort -Pr Company|format-table -Pr Path, Name, Id -groupby Company




##########################################################################
######################### 18. Saving Output ##############################
##########################################################################

# Text File - TXT
Get-Process | Out-File C:\Users\VadzimRamaniuk\Documents\Getprocess.txt
dir C:\Users\VadzimRamaniuk\Documents\Getpr*.t*
notepad C:\Users\VadzimRamaniuk\Documents\Getprocess.txt

# HTML File - HTML
Get-Process | ConvertTo-Html | Out-File C:\Users\VadzimRamaniuk\Documents\GetProcess.htm
dir C:\Users\VadzimRamaniuk\Documents\GetPr*.h*
Invoke-Expression C:\Users\VadzimRamaniuk\Documents\GetPr*.htm

# Excel File - CSV
Get-Process | Export-Csv C:\Users\VadzimRamaniuk\Documents\GP.csv
dir C:\Users\VadzimRamaniuk\Documents\GP.csv
Invoke-Expression C:\Users\VadzimRamaniuk\Documents\GP.csv



##########################################################################
######################### 19. Importing Data #############################
##########################################################################

# How to Open a Path with SPACE character.
# Option 1: "&" - escape SPACE character
"&'C:\Users\VadzimRamaniuk\Documents\Learning Path\PowerShell\Master Microsoft Powershell\Census1000.csv'" | Invoke-Expression


# Option 2: The Grave Accent (`) - escape SPACE character.
invoke-expression 'C:\Users\VadzimRamaniuk\Documents\Learning` Path\PowerShell\Master` Microsoft` Powershell\Census1000.csv'


# option 3: Enclose the Path in Quotation Mark (") - escape SPACE Character.
invoke-expression 'C:\Users\VadzimRamaniuk\Documents\"Learning Path"\PowerShell\"Master Microsoft Powershell"\Census1000.csv'

# Option 2
$names = Import-Csv C:\Users\VadzimRamaniuk\Documents\Learning` Path\PowerShell\Master` Microsoft` Powershell\Census1000.csv

# Option 3
$names = Import-Csv C:\Users\VadzimRamaniuk\Documents\"Learning Path"\PowerShell\"Master Microsoft Powershell"\Census1000.csv

$names
$names | format-table
$names | gm



##########################################################################
######################### # 20. Practice Problem #########################
##########################################################################

# Which Surnaname has the Highest Percentage of People with that Surname that a Hispanic

$names = Import-Csv C:\Users\VadzimRamaniuk\Documents\Learning` Path\PowerShell\Master` Microsoft` Powershell\Census1000.csv
$names | Get-Member

# Result 1:
$names | sort -Property pcthispanic -Descending | select -Pr Name, pcthispanic -first 5 | format-table

# Result 2:
$names | sort -Pr pcthispanic -Descending | select -first 3 |format-table -Pr Name, pcthispanic

# Result 3:
($names | sort -Pr pcthispanic -Descending)[0..2]

# Result 4:
($names | sort -Pr pcthispanic -Descending)[0..2].name

# Result 5:
$names | sort -Property pcthispanic -Descending | select -Pr Name, pcthispanic -first 5 | format-table -Pr Name

# Result 5:
$names | foreach {if ($_.pcthispanic -gt $highest.pcthispanic){$highest=$_}}
$highest
$highest.name












