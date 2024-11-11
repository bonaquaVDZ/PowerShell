# This PowerShell script automates the import of the Sakila database into the MySQL Docker container.
# It sets up necessary variables, creates the database if it doesn't exist, imports the schema and data from SQL files,
# and confirms the successful import with a message.

# Define variables
$container = "mycontainer"
$password = "mypassword"
$schemaPath = "C:\Users\vadzi\Downloads\world-db\sakila-schema.sql"
$dataPath = "C:\Users\vadzi\Downloads\world-db\sakila-data.sql"
$database = "sakila"

# Create the database if not exists
docker exec -it $container mysql -u root -p$password -e "CREATE DATABASE IF NOT EXISTS $database;"

# Import schema
Get-Content -Path $schemaPath | docker exec -i $container mysql -u root -p$password $database

# Import data
Get-Content -Path $dataPath | docker exec -i $container mysql -u root -p$password $database

Write-Host "Sakila database imported successfully."
