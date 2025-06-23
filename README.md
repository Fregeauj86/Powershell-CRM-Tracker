# PowerShell CRM Tracker

A lightweight PowerShell-based CRM-style tracker for logging and managing support or student issues.

## Files

- `crm_logger.ps1`: Logs a new case (name, issue type, description, resolution status) to a CSV file.
- `view_crm.ps1`: Displays all cases, filters unresolved, and shows a total count.

## How to Use

1. Run `crm_logger.ps1` to log a new issue.
2. Run `view_crm.ps1` to view your full case list and pending items.

> Default log file location: `C:\CRM\crm_log.csv`

## Setup

If PowerShell blocks scripts, run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser