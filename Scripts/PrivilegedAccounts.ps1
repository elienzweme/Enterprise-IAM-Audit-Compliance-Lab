Import-Module ActiveDirectory

Get-ADGroupMember "Domain Admins" |
Select Name, SamAccountName, ObjectClass |
Export-Csv C:\IAM-Audit-Lab\Reports\PrivilegedAccounts.csv -NoTypeInformation