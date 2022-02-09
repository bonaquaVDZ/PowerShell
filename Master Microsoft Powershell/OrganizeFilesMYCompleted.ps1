#udemy doesn't allow .ps1 extensions so I saved this as a .txt file. Make sure you save it as a ps1

#Parameters
#The script should take 2 arguments $source and $destination (for the source and destination folders).
param([string]$source = "c:\Users\VadzimRamaniuk\Document\source",[string]$destination = "c:\Users\VadzimRamaniuk\Document\destination")

#Functions
#2)	Functions

#Create a function named CheckFolder that checks for the existence of a specific directory/folder that is passed 
#to it as a parameter. Also, include a switch parameter named create. If the directory/folder does not exist and 
#the create switch is specified, a new folder should be created using the name of the folder/directory that was 
#passed to the function.

# Function Option 1: If this function exists or not, Output will be as boolean. 
# function Check-Folder ([string]$path, [switch]$create){
    # $exists = Test-Path $path
    # return $exists
# }

# Check-folder "c:\Users\VadzimRamaniuk"
# Check-Folder "c:\Users\VadzimRamaniuk\Roro"

# $exs1 = Test-Path "c:\Users\VadzimRamaniuk"
# $exs1
# $exs2 = Test-Path "c:\Users\Julia"
# $exs2


# Function MAIN: If the path exists or not, there is a notion -> if didn't already create.
function Check-Folder ([string]$path, [switch]$create){
    $exists = Test-Path $path
    if($exists){
        # Note that this path exists.
        Write-Host "This path exists. All right."
    }

    if(!$exists -and $create){                                                 # ! - Excalmation mark means doesnt exist.
        # create the directory because it doesn't exist.
        Write-Host "Doesn't exist but should be created."
        mkdir $path | out-null                                                  # Out-null - don't write it to the console
        $exists = Test-Path $path
    }
    return $exists
}

# Test-Path C:\Users\VadzimRamaniuk\.ipython
# Check-Folder "c:\Users\VadzimRamaniuk" -create
# Check-Folder "c:\Users\VadzimRamaniuk\ForDeleting" -create

#Create a function named DisplayFolderStatistics to display folder statistics for a directory/path that is passed 
#to it. Output should include the name of the folder, number of files in the folder, and total size of all files in 
#that directory.

# Option 1: It will show us Count and Sum in that specific path. 
# function Display-FolderStats1([string]$path){

    # $files = dir $path -recurse | where {!$_.PSIsContainer}
    # return $files | Measure-Object -Property length -sum

# }

# Display-FolderStats1 "C:\Users\VadzimRamaniuk\Download"
# Display-FolderStats1 "C:\Users\VadzimRamaniuk\Downloads\Arbeit"

# MAIN: Show: path, count and size of all objects.
function Display-FoldersStats([string]$path){
    $files = dir $path -recurse | where {!$_.PSIsContainer}
    $totals =  $files | measure -Property length -sum
    $stats = "" | select path, count, size
    $stats.path = $path
    $stats.count = $totals.count
    $stats.size = [math]::round(($totals).sum / 1GB, 4)                  # $stats.size = $totals.sum / 1GB 
                                                                         # [math]::round(($results).sum/1GB, 5)
    return $stats
}


# $stats.size = $totals.sum / 1GB
# [math]::round(($results).sum/1GB, 5)
# Display-FoldersStats "C:\Users\VadzimRamaniuk\Downloads\Arbeit"
# Display-FoldersStats "C:\Users\VadzimRamaniuk"
# help Measure-Object

#3)	Main processing
#a) Test for existence of the source folder (using the CheckFolder function).
$sourceexists = Check-Folder $source

if (!$sourceexists){
    Write-Host "The source directory is not found. Script can not continue."
    Exit
}

#b) Test for the existence of the destination folder; create it if it is not found (using the CheckFolder function 
#with the –create switch).Write-Host "Testing Destination Directory - $destination"
$destinationexists = Check-Folder $destination -create

if (!$destinationexists){
    Write-Host "The destination directory is not found. Script can not continue."
    Exit
}


#c) Copy each file to the appropriate destination.
#get all the files that need to be copied
$files = dir $source -Recurse | where {!$_.PSisContainer}
# $files




#c-i) Display a message when copying a file. The message should list where the file is being
#moved from and where it is being moved to.


foreach ($file in $files){
    $ext = $file.Extension.Replace(".", "")
    $extdestdir = "$destination\$ext"
    
    # Check to see if the folder exists, if not create it. 
    $extdestdirexists = Check-Folder $extdestdir -create
    
    if (!$extdestdirexists){
        Write-Host "The destination directory ($extdestdir) can't be created"
        Exit
}

    # Copy file
    copy $file.fullname $extdestdir

}


#d) Display each target folder name with the file count and byte count for each folder.
$dirs = dir $destination | where {$_.PSIsContainer}

$allstats =@()
foreach($dir in $dirs){
    $allstats += Display-FoldersStats $dir.FullName
}

$allstats | sort size -Descending




#### Error Message ####

## Running scripts is disabled on this system.
# File C:\Temp\FirstScript.ps1 cannot be loaded because running scripts is disabled on this system. 
# For more information, see about_Execution_Policies at --
# So I got this message after trying to run FirstScript.ps1. If you get this message, 
# try executing Set-ExecutionPolicy RemoteSigned and after running it (in shell for example) 
# answer the popup box with Yes to All. Or just Yes.
# Don't know if anyone got this, but just for the one who get stuck at this, I thought I'd share this info.
# Set-ExecutionPolicy RemoteSigned





##############################################################
##############################################################
##############################################################
##############################################################
################# How to Run This Script #####################
# First of all to open directory where this script locates and then proceed with following script ##################
# & '.\Organize Files Main.ps1' c:\Users\VadzimRamaniuk\Document\source c:\Users\VadzimRamaniuk\Document\destination