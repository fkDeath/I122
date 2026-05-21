<#
.NOTES
    *****************************************************************************
    ETML
    Script's name:	KGE-Ex3.ps1
    Author:	KGE
    Date:	07.05.2026
 	*****************************************************************************
.SYNOPSIS
	Can filter your args
 	
.DESCRIPTION
    Can filter if your args are a numeric, if your number ar positive or negative and count how much args have you write and do the sum and the product of all your args

.PARAMETER Args
    Do not put -Args before your arguments just put it directly after the path of the script

.OUTPUTS
	Do the sum and tell if its a numeric or not and if its positive or negative
	
.EXAMPLE
	q        is not numeric
    1       is positive
    2       is positive
    -3       is negative
    ──────────────────────────────────────────────
    Count :          4
    Sum :    6
    Product :       6
	
.EXAMPLE
	Faites Get-Help suivi de l'emplacement du fichier pour savoir comment l'utiliser
#>

$ArgsCount = $Args.Count
$ArgsSum = 0
$ArgsProduct = 1

if ($Args){
    ForEach ($arg in $Args){
        if ($arg -as "int32" -or $arg -as "double"){
            $ArgsSum += $arg
            $ArgsProduct *= $arg
        }    
    }

    foreach ($preciseArgs in $Args){
        if ($preciseArgs -as "int32" -and $preciseArgs -as "double"){
            if ($preciseArgs -lt 0){
                Write-Output "$preciseArgs `tis negative"
            }
            elseif ($preciseArgs -eq 0) {
                Write-Output "$preciseArgs `t is a zero"
            }
            else {
                Write-Output "$preciseArgs `tis positive"
            }
        }
        else {
            Write-Output "$preciseArgs `t is not numeric"
        }
    }
    Write-Output "──────────────────────────────────────────────"
    Write-Output "Count : `t $ArgsCount`nSum : `t $ArgsSum`nProduct : `t$ArgsProduct"
}
else {
    Write-Output "Faites Get-Help suivi de l'emplacement du fichier pour savoir comment l'utiliser"
}