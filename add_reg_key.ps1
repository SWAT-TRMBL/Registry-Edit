# Must be run as Administrator
$registryPath1 = "HKLM:\Software\Microsoft\Wcmsvc"
$registryPath2 = "HKLM:\Software\Microsoft\Wcmsvc\Local"

# Set our registry key name and values here
$name1 = "IgnoreNonRoutableEthernet"
$name2 = "fMinimizeConnections"

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath1 -Force | Out-Null
    New-Item -Path $registryPath2 -Force | Out-Null
}

# Set the values
New-ItemProperty -Path $registryPath1 -Name $name1 -Value 1 -PropertyType DWord -Force | Out-Null
New-ItemProperty -Path $registryPath2 -Name @name2 -Value 0 -PropertyType DWord -Force | Out-Null

Write-Host "Registry keys added successfully."
