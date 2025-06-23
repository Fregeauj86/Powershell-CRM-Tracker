Write-Host "==================== ALL CASES ====================" -ForegroundColor Cyan
Import-Csv "C:\JOHNSKI\CRM\crm_log.csv" | Format-Table -AutoSize

Write-Host "`n================ UNRESOLVED CASES ================" -ForegroundColor Yellow
Import-Csv "C:\JOHNSKI\CRM\crm_log.csv" | Where-Object { $_.ResolutionStatus -ne "Resolved" } | Format-Table -AutoSize

Write-Host "`n============ COUNT OF UNRESOLVED CASES ============" -ForegroundColor Green
$unresolvedCount = (Import-Csv "C:\JOHNSKI\CRM\crm_log.csv" | Where-Object { $_.ResolutionStatus -ne "Resolved" }).Count
Write-Host "Total unresolved cases: $unresolvedCount" -ForegroundColor Green
