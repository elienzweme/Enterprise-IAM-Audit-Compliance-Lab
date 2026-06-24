Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties DisplayName, SamAccountName, PasswordLastSet, PasswordNeverExpires, Enabled |
Where-Object {$_.Enabled -eq $true} |
Select Name, SamAccountName, PasswordLastSet, PasswordNeverExpires |
Export-Csv C:\IAM-Audit-Lab\Reports\PasswordExpirationReport.csv -NoTypeInformation