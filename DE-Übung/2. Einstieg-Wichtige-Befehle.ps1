## Alle Befehle eines Modules anzeigen

# bereits importierten PowerShell Module.
Get-Module -all

# alle PowerShell Befehle aller Module, die momentan in Ihrem Systen verfügbar sind. 
Get-Command

# Anzahl der Befehle
(Get-Command).Count

# Die PowerShell Befehle eines bestimmten Modules.
Get-Command -Module NetTCPIP
Get-Command -Module Microsoft.PowerShell.Management



## PowerShell Befehle ausführen

Get-Command -Name "*Get-NetIP"
get-command | where Name -like "Add*"
get-command | where Name -cmatch "Add"

# Netzwerkadapter anzeigen. 
Get-NetIPInterface
Get-NetIPInterface | sort -Property DHCP
Get-NetIPInterface | sort -Property ConnectionState


# Nutzliche PowerShell Befehle
# Dateien und Ordner
CMDLET	       # Beispiel	Beschreibung
New-Item	   # Neue Datei erstellen
New-Item	   # Neuen Ordner erstellen
Get-Item	   # Datei oder Ordner anzeigen
Get-ChildItem		#Alle Dateien und Ordner anzeigen
Remove-Item		        # Datei löschen
Copy-Item		        # Datei kopieren
Export-CSV		        # Ausgabe in CSV Exportieren
Move-Item		        # Datei oder Ordner verschieben
Compress-Archive		# ZIP Archiv

# Lokale Benutzer und Gruppen
Get-LocalUser		     # Lokale Benutzer anzeigen
Get-LocalGroup		     # Lokale Gruppen anzeigen
Add-LocalGroupMember		# Lokalen Benutzer zu Administratoren Gruppen hinzufügen

https://www.linetwork.de/powershell-befehle/

ping -t 192.168.0.80
tracert -4 192.168.0.80


