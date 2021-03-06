#example 1:

New-InboxRule -Name Sales -Mailbox dave `
-From sales@contoso.com `
-MarkImportance High

Set-InboxRule -Identity Sales -MarkImportance Low

Disable-InboxRule -Identity Sales -Mailbox dave

Remove-InboxRule -Identity Sales -Mailbox dave -Confirm:$false


#example 2:

New-InboxRule -Name "Delete Rule" `
-Mailbox dave -SubjectOrBodyContainsWords "Delete Me" `
-DeleteMessage $true


#example 3:

New-InboxRule -Name "Redirect to Andrew" `
-Mailbox dave `
-MyNameInToOrCcBox $true `
-RedirectTo "Andrew Castaneda" `
-ExceptIfFrom "Alfonso Mcgowan" `
-StopProcessingRules $true


#example 4:

$sales = Get-Mailbox -OrganizationalUnit contoso.com/sales
$sales | %{
  New-InboxRule -Name Junk `
  -Mailbox $_.alias `
  -SubjectContainsWords "[Spam]" `
  -MoveToFolder "$($_.alias):\Junk Email"
}
