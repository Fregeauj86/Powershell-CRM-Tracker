# Set path to CRM log CSV file
$logFile = "C:\JOHNSKI\CRM\crm_log.csv"

# Create log file with headers if it doesn't exist
if (-not (Test-Path $logFile)) {
    "CaseID,Timestamp,ClientName,IssueType,IssueDescription,ResolutionStatus" | Out-File -FilePath $logFile
}

# Generate unique case ID
# Path to store the last case number
$counterFile = "C:\JOHNSKI\CRM\case_counter.txt"

# Create file if it doesn't exist
if (-not (Test-Path $counterFile)) {
    Set-Content -Path $counterFile -Value 0
}

# Read and increment the last case number
$lastNumber = Get-Content $counterFile
$caseID = "{0:D4}" -f ([int]$lastNumber + 1)

# Save the new number back to the file
Set-Content -Path $counterFile -Value $caseID

# Prompt for case details
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$clientName = Read-Host "Enter Client or Student Name"
$issueType = Read-Host "Enter Issue Type (Tech, Scheduling, Curriculum, Other)"
$issueDescription = Read-Host "Enter Issue Description"
$resolutionStatus = Read-Host "Enter Resolution Status (Open, Resolved, Pending)"

# Format log entry (escaped quotes for text fields)
$logEntry = "$caseID,$timestamp,$clientName,$issueType,""$issueDescription"",""$resolutionStatus"""

# Append to log file
Add-Content -Path $logFile -Value $logEntry

Write-Host "`nCase logged successfully!" -ForegroundColor Green