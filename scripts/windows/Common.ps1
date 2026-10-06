$ErrorActionPreference = "Stop"
$WindowsScriptsDir = $PSScriptRoot
$ModulesDir        = Join-Path $WindowsScriptsDir "modules"
$RepoRoot          = Resolve-Path (Join-Path $WindowsScriptsDir "..\..")

Get-ChildItem -Path $ModulesDir -Filter "*.psm1" -Recurse | ForEach-Object {
    Import-Module $_.FullName -Force
}

$Global:Config   = Get-ScriptConfig
$Global:RepoRoot = $RepoRoot

Write-Info "FinGraph PowerShell environment initialized."