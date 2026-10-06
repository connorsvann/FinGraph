function Get-ScriptConfig {
    $configDir = Join-Path $PSScriptRoot "..\..\config"
    return @{
        Settings = Get-Content (Join-Path $configDir "settings.json") -Raw | ConvertFrom-Json
        Ports    = Get-Content (Join-Path $configDir "ports.json") -Raw | ConvertFrom-Json
        Paths    = Get-Content (Join-Path $configDir "paths.json") -Raw | ConvertFrom-Json
    }
}

Export-ModuleMember -Function Get-ScriptConfig