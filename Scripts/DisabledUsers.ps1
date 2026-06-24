Import-Module ActiveDirectory

Search-ADAccount -AccountDisabled -UsersOnly |
Where-Object {$_.SamAccountName -notin @("Guest","krbtgt")} |
Select Name, SamAccountName |
Export-Csv C:\IAM-Audit-Lab\Reports\DisabledUsers.csv -NoTypeInformation