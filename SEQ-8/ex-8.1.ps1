<#
.NOTES
    *****************************************************************************
    ETML
    Script's name:	ex-8.1.ps1
    Author:	KGE
    Date:	23.04.2026
 	*****************************************************************************
.SYNOPSIS
	Light information with first name and some numbers
 	
.DESCRIPTION
    Return a array with even numbers between min and max
  	
.PARAMETER Min
    Required : Insert the minimum
	
.PARAMETER Max
    Required : Insert the maximum

.OUTPUTS
	Even numbers list : x x x x x x x
    odd numbers list : x x x x x x x 

.EXAMPLE
	.\ex-8.1.ps1 -min 1 -max 10
	Result : Even numbers list : 2 4 6 8 10
          odd numbers list : 1 3 5 7 9
#>

param( [Parameter(Mandatory=$true, HelpMessage="'Min' Need to be a number")]$min, [Parameter(Mandatory=$true)]$max)

$evenNumbers = @()
$oddNumbers = @()

do
{
    $minGetTypeName = $min.GetType().Name

    if ($minGetTypeName -like "*Int*") {
        do {
            $maxGetTypeName = $max.GetType().Name
            if ($maxGetTypeName -like "*Int*")
            {
                while ($min -gt $max) {
                    if ($min -gt $max) {
                        $min = Read-Host "Min "
                        $max = Read-Host "Max "
                    }
                }
                if ($min -le $max){
                    $array = $min..$max
                    foreach ($items in $array) {
                        $evenCalulate = $items % 2
                        if ($evenCalulate -eq 0) {
                            $evenNumbers+=$items
                            
                        }
                        else {
                            $oddNumbers+=$items
                            
                        }
                    }
                    Write-Output "Even numbers list : $evenNumbers"
                    Write-Output "odd numbers list : $oddNumbers"
                }
            }
            else {
                try {
                    $max = [convert]::ToInt32($max)
                }
                catch {
                    $max = Read-Host "Veuillez réentrez le paramètre max s'il vous plaît "
                }
            }
        } while ($maxGetTypeName -notlike "*Int*")
    }
    else {
        try {
            $min = [convert]::ToInt32($min)
        }
        catch {
            $min = Read-Host "Veuillez réentrez le paramètre min s'il vous plaît "
        }
    }
}
while ($minGetTypeName -notlike "*Int*")