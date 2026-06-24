Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties LastLogonDate |
Where-Object {
    $_.Enabled -eq $true -and
    $_.SamAccountName -notin @(
        "Guest",
        "krbtgt",
        "svc_backup",
        "svc_splunk",
        "svc_sql",
        "ITAdmin",
        "iam"
    ) -and
    (
        $_.LastLogonDate -lt (Get-Date).AddDays(-90) -or
        $_.LastLogonDate -eq $null
    )
} |
Select Name, SamAccountName, LastLogonDate |
Export-Csv C:\IAM-Audit-Lab\Reports\InactiveUsers.csv -NoTypeInformation