## Allgemeine PowerShell-Befehle
# Navigation durch die Windows Registry wie durch ein Dateisystem:
cd hkcu:

# Ausgabe der fünf speicherhungrigsten Prozesse:
ps -r | sort -p ws | select -last 5

# Neustart eines Dienstes (stoppen und wieder starten) am Beispiel DHCP:
# DHCP - Dynamic Host Configration Protocol - is a client/server protocol that automatically provides an Internet Protocol (IP) host with its IP
# and other related configuration information such as the subnet mask and default gateway. 
Restart-Service DHCP

# Alle Elemente eines Ordners ausgeben:
Get-ChildItem – Force
ls - Force
dir - Force

# Elemente aus Verzeichnissen oder Ordnern rekursiv ausgeben:
Get-ChildItem –Force c:\directory –Recurse
Get-ChildItem –Force C:\Users\VadzimRamaniuk\Downloads\"Data Scientist" –Recurse

# Alle Dateien in einem Verzeichnis ohne einzelne Rückfragen löschen:
Remove-Item C:\tobedeleted –Recurse
ri C:\tobedeleted –Recurse
rm C:\tobedeleted –Recurse


# Per PowerShell Informationen sammeln
# Informationen über Hersteller und Modell des Computers ausgeben:
Get-WmiObject -Class Win32_ComputerSystem
gwmi -Class Win32_ComputerSystem


## Informationen über das BIOS des aktuellen Computers ausgeben:
# BIOS - Basic Input / Output System /  a set of computer instructions in firmware which control input and output operations. 
Get-WmiObject -Class Win32_BIOS -ComputerName
gwmi -Class Win32_BIOS -ComputerName

# Installierte Hotfixes (QFEs, Windows Updates) ausgeben:
# hotfix - a small piece of code developed to correct a major software bug or fault and released as quickly as possible.
Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName 

# Benutzernamen des aktuell angemeldeten Benutzers ausgeben:
Get-WmiObject -Class Win32_ComputerSystem -Property UserName -ComputerName 

# Alle Namen der installierten Anwendungen auf dem aktuellen Computer ausgeben:
Get-WmiObject -Class Win32_Product -ComputerName . | Format-Wide -Column 1

# Alle IP-Adressen des aktuellen Computers ausgeben:
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Format-Table -Property IPAddress
gwmi -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Format-List


# Umfassenderen Bericht über die IP-Konfiguration des aktuellen Computers ausgeben:
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . | Select-Object -Property [a-z]* -ExcludeProperty IPX*,WINS*


# Netzwerkadapter des vorliegenden Computers mit aktiviertem DHCP ausgeben:
Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=true" -ComputerName .


## PowerShell-Befehle zur VM-Verwaltung
# Einen anderen Computer nach einer Minute herunterfahren:
Start-Sleep 60; Restart-Computer –Force –ComputerName TARGETMACHINE

# Einen Drucker hinzufügen:
(New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\printerserver\hplaser3")

# Einen Drucker entfernen:
(New-Object -ComObject WScript.Network).RemovePrinterConnection("\\printerserver\hplaser3 ")

# Eine Remote-Sitzung starten (Remote-Verwaltung muss aktiviert sein):
enter-pssession TARGETMACHINE

# PowerShell verwenden, um ein Script auf einem anderen Server auszuführen:
invoke-command -computername machine1, machine2 -filepath c:\Script\script.ps1

