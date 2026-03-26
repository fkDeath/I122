Get-Help Get-Process
Get-Help Get-Service -Examples
Get-Command *Service*
Get-Service | Where-Object { $_.Status -eq "Running" }