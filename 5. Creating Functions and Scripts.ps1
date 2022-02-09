# 21. Integrated Scripting Environment
# 22. Creating Your First Function
# 23. Another Functions - Parameters, CmdLets, and NET. Functions
# 24. Creating Your First Script



##########################################################################
############## 21. Integrated Scripting Environment ######################
##########################################################################


$names = import-csv C:\Users\VadzimRamaniuk\Documents\"Learning Path"\PowerShell\"Master Microsoft Powershell"\Census1000.csv
$names

$names | sort -Property pcthispanic -descending | select -first 5
($names | sort -Property pcthispanic -descending)[0].name


##########################################################################
################### 22. Creating your first function.  ###################
##########################################################################


# Function without return
function Add-Numbers
{
    param([int]$num1, [int]$num2)

    $num1 + $num2
}

Add-Numbers 130 20
Add-Numbers -num1 100 -num2 300

$result = Add-Numbers -num1 45 -num2 30
$result += Add-Numbers 3 4
$result


# Function with return
function Dividing-Numbers
{
    param([int]$num1, [int]$num2)
    return $num1 / $num2
}

$res = Dividing-Numbers -num1 300 -num2 3
$res



# Function with included info and return
function Dividing-Numbers
{
    param([int]$num1 = 300, [int]$num2 = 4)
    return $num1 / $num2
}

Dividing-Numbers


##########################################################################
### 23. Another Functions - Parameters, CmdLets, and NET. Functions  #####
##########################################################################


# Function with summation of all objects. 
function Get-DirInfo($dir)
{

    Get-ChildItem $dir -Recurse | Measure-Object -property length -Sum
}

# Function without common summation of all objects. 
function Get-DirInfoNew($dir)
{

    Get-ChildItem $dir -Recurse | Measure-Object
}

# Function with common summation of all objects. 
# It shows rounded summation in MB of specific object. 
function Get-DirInfoM($dir)
{

    $results = Get-ChildItem $dir -Recurse | Measure-Object -property length -Sum
    return [math]::round(($results).sum/1GB, 5)
}



Get-DirInfo
Get-DirInfoNew C:\Users\VadzimRamaniuk\Documents\Porsche
Get-DirInfoM
Get-DirInfoM C:\Users\VadzimRamaniuk

Get-DirInfo C:\Users\VadzimRamaniuk\Downloads
Get-DirInfo C:\Users\VadzimRamaniuk\Documents\Porsche
(Get-DirInfo C:\Users\VadzimRamaniuk\Documents\Porsche).sum
(Get-DirInfo C:\Users\VadzimRamaniuk\Documents\Porsche).count
(Get-DirInfo C:\Users\VadzimRamaniuk\Documents).sum/1GB
(Get-DirInfo C:\Users\VadzimRamaniuk\Documents).sum/1MB
(Get-DirInfo C:\Users\VadzimRamaniuk).sum/1GB
(Get-DirInfo C:).sum/1TB

# Libraries
[math]::round((Get-DirInfo C:\Users\VadzimRamaniuk\Documents).sum/1MB)
[math]::round((Get-DirInfo C:).sum/1TB, 5)
[math]::round((Get-DirInfo C:\Users\VadzimRamaniuk\Documents).sum/1KB)

help Measure-Object

### Learning
# Recurse - To carry out a recursive procedure; to perform the same sequence of operations on successive results; 
# Recurse - To repeat (an operation) recursively.
# libraries will be in []::





##########################################################################
################# 24. Creating Your First Script  ########################
##########################################################################

#parameters 
param([string]$dir="c:\Users\VadzimRamaniuk\")

#functions
function Get-DirInfoScript($dir)
{

    $results = Get-ChildItem $dir -Recurse | Measure-Object -property length -Sum
    return [math]::round(($results).sum/1GB, 5)
}

# Main processing
Get-DirInfoScript $dir

Get-DirInfoScript C:\Users\VadzimRamaniuk
Get-DirInfoScript C:\Users\VadzimRamaniuk\Downloads

# For script Running.
# Impermissible due to policy. 
C:\Users\VadzimRamaniuk\Documents\LearningPath\PowerShell\MasterMicrosoftPowershell\5.CreatingFunctionsAndScripts.ps1












