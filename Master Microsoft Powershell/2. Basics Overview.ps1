# 4. PowerShell Console Basics
# 5. Basic Data Types
# 6. Comparison Operators
# 7. Cmdlet Basics
# 8. Aliases
# 9. Getting Help

##########################################################################
###################### 4. Powershell Console Basics ######################
##########################################################################

ipconfig
ipconfig /all

dir # Look at your files

$PSVersionTable
$PSVersionTable | Get-Member # this command shows all methods and properties that this object include. 
dir | Get-Member

##########################################################################
######################## 5. Basic Data Types #############################
##########################################################################
1 + 2
$var = 30
$var | gm

$string = "It is a new string. "
$string.Length
$string.substring(0, 5)
$new_string = $string.substring(0, 5)
$new_string

$sentence = "$new_string great to create so strings. "
$sentence

$array = @(1, "Wow", 30)
$array

$HashTable = @{"Server1" = 1; "Server2" = 2}
$HashTable

##########################################################################
###################### 6. Comparison Operators ###########################
##########################################################################


12 -eq 12
12 -eq 30
12 -ne 30
30 -gt 2
2 -lt 10

"a" -eq "A"
"a" -ceq "A" # Compare with cases. Is the Case equivalent? - No!

"Apple" -eq "A*"
"Apple" -like "A*"
"Apple" -like "*p*"
"Apple" -like "Ap??e"
"Admirable" -like "A??le"
"Admirable" -like "A*le"
"My Name is Julia" -match "Julia"
"My Name is Julia" -match "julia"
"My Name is Julia" -cmatch "julia" # Is the Case equivalent? - No!
"My Name is Julia" -match "ju"
"My Name is Julia" -match "Vadzim"




##########################################################################
###################### 7. Cmdlets Basics #################################
##########################################################################



Get-Process
Get-Service
Write-Host "Hello Host. I am here from this side. "

write "Hello"
write ("Hello")



##########################################################################
########################## 8. Aliases ####################################
##########################################################################

cls

Get-Alias ls
Get-Alias dir

Set-Alias

Set-Alias blah Get-Process 
Get-Alias blah
Set-Alias blah dir
blah



##########################################################################
########################## 9. Getting Help ###############################
##########################################################################



help dir
help dir -online
help Get-ChildItem -online



































