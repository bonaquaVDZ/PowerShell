# 10. Objects
# 11. Sorting
# 12. Filtering Using the Where Cmdlet
# 13. Filtering Using Loops
# 14. Foreach Loop
# 15. Arrays
# 16. Hash Tables


##########################################################################
########################## 10. Objects ###################################
##########################################################################

dir | Get-Member
$files = dir
$files
$files | gm
$files[1]
$files[0..5]
$files[1, 5]
$files[0..3] | Get-Member
$files[0..2].name
$files[0..2].fullname
$files[0..2].LastAccessTime
$files[0..2].LastWriteTimeUtc
$files[0..2].LastWriteTime
$files[0..2].length

### LEARNING
# UTC - Universal Time Coordinated
# CET - Central European Time (Poland, Germany) (UTC +01.00)
# EET - Eastern European Time (Ukraine, Latvia) (UTC +02.00)
# Moscow Time/ Turkey Time (Russia, Belarus, Turkey) (UTC +03.00)
### LEARNING


##########################################################################
########################## 11. Sorting ###################################
##########################################################################


Get-Help sort

dir
dir | sort
ls | sort -descending
ls | sort -Property Name
ls | sort -Property LastWriteTime
ls | sort -Property LastAccessTime

$files | sort -Property Length




##########################################################################
###################### 12. Filtering Using the Where Cmdlet ##############
##########################################################################


help where
cd .\Downloads
$docs = dir
dir
$docs | where length -gt 20000
$docs | where Name -eq "Arbeit"
$docs | where Name -match "VS"
$docs | where Name -cmatch "exe"
$docs | where Name -like "*lat*"


##########################################################################
###################### 13. Filtering Using Loops #########################
##########################################################################


cd .\Downloads
$docs = dir

$docs | where {$_.length -gt 90000000}
$docs | where {($_.length -gt 90000000) -and ($_.Name -cmatch "Ana")}




##########################################################################
######################### 14. Foreach Loop ###############################
##########################################################################

$var = 1..10

$var1 = 1.10 | foreach {$_ *2}
$var1


$var2 = 1..10 |foreach {$_ *3}
$var2

$var3 = 1..5 | foreach {"This is a loop numer: $_ "}
$var3


$var4 = 1..5 | foreach {$_ *3} | foreach {"This is a loop numer: $_ "}
$var4


$var5 = "blah" * 4
$var5

$var6 = 1..10 | foreach {"*"*$_}
$var6

$var7 = 1..20 | foreach {if($_%2){"$_ is odd"}}
$var7

### Learning
# {} - Curly Brackets
# [] - Square Brackets
# () - Brackets
# "" - Quotation marks
# ~ - Tilde
# _ - underscore
# | - Vertical Line
### Learning





##########################################################################
############################ 15. Arrays ##################################
##########################################################################


$strComputers = @("Computer1", "Computer2", "Computer3", "Computer4")
$strComputers
$strComputers[0..1]

$strComputers[3] = "Laptop4"
$strComputers

$strComputers + ("Laptop5")
$strComputers_m = $strComputers + ("Laptop6")
$strComputers_m


$strComputers_m | gm
$strComputers_m.Length
$strComputers_m.Length
$strComputers_m.Length


$strComputers_m | foreach {if($_ -match "Lap"){"Found: $_"}}
$strComputers_m | foreach {$_ + ": length is " + $_.length}




##########################################################################
############ 16. Hash Tables, Dictionory, HashMap ########################
##########################################################################


$HashTable = @{"Server1" = "100 mbt"; "Server2" = "300 mbt";}
$HashTable

$HashTable["Server1"] = "333 mbt"
$HashTable


$HashTable["BigData"] = "1000 mbt"
$HashTable

$HashTable.Remove("BigData")
$HashTable



