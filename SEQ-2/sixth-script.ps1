<#
.NOTES
    ***************************************************************************************************************
    Nom du script : sixth-script.ps1
    Auteur : Kyllian Gregoire
    Date : Mars 2026
    ***************************************************************************************************************
    Modifications
    Date : ─ 
    Auteur : ─ 
    Raisons : ─ 
    ***************************************************************************************************************
.SYNOPSIS
    Écrit la date actuelle + fais l'arrondi de 1 + 4,5
.PARAMETER Math
    Calcule de l'arrondi voulu
.EXAMPLE 
    4.3 = 5
#>
param([Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$True)]$Math)
[datetime]::Now
[Math]::Ceiling($Math)