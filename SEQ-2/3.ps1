# $p1 = "gps"

# Write-Output $p1


Get-Disk | Get-Partition | where {$_.DriveLetter} | Format-List