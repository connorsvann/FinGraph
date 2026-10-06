function Write-Info { 
    param([string]$Message) 
    Write-Host "[INFO] $Message" -ForegroundColor Cyan 
}

function Write-Success { 
    param([string]$Message) 
    Write-Host "[ OK ] $Message" -ForegroundColor Green 
}

function Write-WarningLog { 
    param([string]$Message) 
    Write-Host "[WARN] $Message" -ForegroundColor Yellow 
}

function Write-ErrorLog { 
    param([string]$Message) 
    Write-Host "[FAIL] $Message" -ForegroundColor Red 
}

Export-ModuleMember -Function Write-Info, Write-Success, Write-WarningLog, Write-ErrorLog