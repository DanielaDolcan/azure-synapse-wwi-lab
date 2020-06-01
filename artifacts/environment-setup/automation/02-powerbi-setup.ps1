Remove-Module solliance-synapse-automation
Import-Module ".\artifacts\environment-setup\solliance-synapse-automation"

$InformationPreference = "Continue"

# TODO: Keep all required configuration in C:\LabFiles\AzureCreds.ps1 file
. C:\LabFiles\AzureCreds.ps1

Install-Module -Name MicrosoftPowerBIMgmt
Install-Module -Name MicrosoftPowerBIMgmt.Profile

Import-Module MicrosoftPowerBIMgmt
Import-Module MicrosoftPowerBIMgmt.Profile

$userName = $AzureUserName                                              # READ FROM FILE
$password = $AzurePassword | ConvertTo-SecureString -asPlainText -Force # READ FROM FILE
$credential = New-Object System.Management.Automation.PSCredential($userName, $password)

Connect-PowerBIServiceAccount -Credential $credential

Write-Information "Uploading PowerBI Reports"

New-PowerBIReport -Path ".\artifacts\exports\powerbi\1. CDP Vision Demo.pbix" -Name "1. CDP Vision Demo" -ConflictAction CreateOrOverwrite

# Invoke-PowerBIRestMethod -Url 'groups/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/datasets/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/tables/xxxxxx/rows' -Method Delete

Disconnect-PowerBIServiceAccount