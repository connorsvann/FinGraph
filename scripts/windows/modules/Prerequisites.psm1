function Test-Prerequisites {
    Write-Info "Verifying host prerequisites..."
    $tools = @("dotnet", "node", "docker")
    foreach ($tool in $tools) {
        if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
            Write-ErrorLog "Missing required CLI tool: $tool"
            exit 1
        }
        Write-Success "Found tool: $tool"
    }
}

Export-ModuleMember -Function Test-Prerequisites