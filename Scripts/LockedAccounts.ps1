Import-Module ActiveDirectory

Search-ADAccount -LockedOut -UsersOnly |
Select Name, SamAccountName |
Export-Csv C:\IAM-Audit-Lab\Reports\LockedAccounts.csv -NoTypeInformation