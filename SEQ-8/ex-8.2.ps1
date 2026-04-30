<#
.NOTES
    *****************************************************************************
    ETML
    Script's name:	ex-8.2.ps1
    Author:	KGE
    Date:	23.04.2026
 	*****************************************************************************
.SYNOPSIS
	Light information with first name and some numbers
 	
.DESCRIPTION
    Return a array with even numbers between min and max
  	
.PARAMETER groupeName
    Required : Insert the minimum

.OUTPUTS
	Even numbers list : x x x x x x x
    odd numbers list : x x x x x x x 

.EXAMPLE
	.\ex-8.1.ps1 -min 1 -max 10
	Result : Even numbers list : 2 4 6 8 10
          odd numbers list : 1 3 5 7 9
#>

param([parameter(Mandatory=$true)][string]$groupeName)

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

$today = [datetime]::Now

if ($groupeName.Length -lt 63){
    Write-Host "$groupeName est plus cours que 63 charactères"
    if (!$groupeName.StartsWith(" ")){
        if (!$groupeName.EndsWith(" ")){
            if (!$groupeName.Contains("*" -or "*#*" -or "*,*" -or "*+*" -or '*"*' -or "*<*" -or "*>*" -or "*@*" -or "*|*" -or ";" -or ":" -or "?")) {
                Write-Host "$groupeName ne contient pas de charactère interdit"
                if ($groupeName -as [int16]){
                    Write-Host "Vous devez fournir un nom de groupe ne pouvant être que des chiffres"
                }
                else {
                    Write-Host "$groupeName n'est pas convertible en INT"
                    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){
                        Write-Host "Vous êtes administrateur"
                        [bool]$groupeBool = $false
                        foreach($items in get-localgroup){
                            if ($groupeName -eq $items) {
                                $groupeBool = $true
                                break
                            }
                        }
                        $groupeBool
                        if ($groupeBool) {
                            Write-Host "$groupeName éxiste déjà"
                            Write-Output >> .\export.log "$groupeName n'as pas pu être créer car déjà éxistant le $today"
                        }
                        else {
                            New-LocalGroup $groupeName

                            foreach($items in get-localgroup){
                                if ($groupeName -eq $items) {
                                    $groupeBool = $true
                                    break
                                }
                                else {
                                    $groupeBool = $false
                                }
                            }
                            if ($groupeBool){
                                Write-Host "$groupeName a été créer avec succès"
                                Write-Output >> .\export.log "$(glg $groupeName) a été créer le $today"
                            } 
                            else {
                                Write-Output >> .\export.log "$groupeName n'as pas pu être créer le $today"
                            }                           
                        }
                    }
                    else {
                        Write-Host "Se script requière une permission élèvation de privilèges."
                    }
                }
            } 
        }
        else {
            Write-Host "Nous ne pouvez pas commencer ou finir votre nom de groupe par un espace"
        }
    } 
    else {
        Write-Host "Nous ne pouvez pas commencer ou finir votre nom de groupe par un espace"
    }
} 
else {
    Write-Host "$groupeName est plus grand ou égale à 63"
}

Get-Content .\export.log