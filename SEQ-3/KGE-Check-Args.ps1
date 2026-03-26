<#
.NOTES
    *****************************************************************************
    ETML
    Script's name:	KGE-Check-Args.ps1
    Author:	Kyllian Gregoire
    Date:	26.03.2026
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reasons: -
 	*****************************************************************************
.SYNOPSIS
	Give all your parameters
 	
.DESCRIPTION
    You can put anything and he will give you exactly what you have write

.EXAMPLE
	.\KGE-Give-Name.ps1 aaa aaa aaa

.OUTPUTS
    > aaa aaa aaa
#>

if (!$args) {
    Get-Help $MyInvocation.MyCommand.Path
        exit
}

Write-Host $args