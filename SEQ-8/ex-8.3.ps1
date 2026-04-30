[CmdletBinding()] 
param ([Parameter(Mandatory=$true)][ValidateRange(0, 100)] [double]$FreeSpaceThreshold, [switch]$IncludeUsbDrives )

if ($null -eq $FreeSpaceThreshold -or $FreeSpaceThreshold -lt 0 -or $FreeSpaceThreshold -gt 100) { 
    throw [System.ArgumentException]::new("La valeur du paramètre 'FreeSpaceThreshold' doit être comprise entre 0 et 100.") 
} 

$partitions = Get-CimInstance -Class Win32_LogicalDisk 

foreach ($partition in $partitions) { 
    if (-Not $IncludeUsbDrives -and $partition.Description -match 'USB') { 
        continue 
    } 

    $driveLetter = $partition.DeviceID 
    $freeSpaceGB = [math]::Round($partition.FreeSpace / 1GB, 2) 
    $totalSpaceGB = [math]::Round($partition.Size / 1GB, 2) 
    $freeSpacePercent = [math]::Round(($freeSpaceGB / $totalSpaceGB) * 100, 2) 

    if ($freeSpacePercent -ge $FreeSpaceThreshold) { 
        if ($freeSpacePercent -le 20) {
           Write-Host "Partition : $driveLetter"
            Write-Host "Espace libre : $freeSpaceGB Go" -ForegroundColor red
            Write-Host "Espace total : $totalSpaceGB Go" -ForegroundColor red
            Write-Host "Taux d'espace libre : $freeSpacePercent %" -ForegroundColor red
            Write-Host "---------------------------------------" 
        }
        elseif ($freeSpacePercent -le 40) {
            Write-Host "Partition : $driveLetter"
            Write-Host "Espace libre : $freeSpaceGB Go" -ForegroundColor DarkYellow
            Write-Host "Espace total : $totalSpaceGB Go" -ForegroundColor DarkYellow
            Write-Host "Taux d'espace libre : $freeSpacePercent %" -ForegroundColor DarkYellow
            Write-Host "---------------------------------------" 
        }
        else {
            Write-Host "Partition : $driveLetter"
            Write-Host "Espace libre : $freeSpaceGB Go" -ForegroundColor Green
            Write-Host "Espace total : $totalSpaceGB Go" -ForegroundColor Green
            Write-Host "Taux d'espace libre : $freeSpacePercent %" -ForegroundColor Green
            Write-Host "---------------------------------------" 
        }
        
    }
}