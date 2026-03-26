<#
.NOTES
    *****************************************************************************
    ETML
    Script's name:	Seventh-script.ps1
    Author:	Kyllian Gregoire
    Date:	26.03.2026
 	*****************************************************************************
    Modifications
 	Date  : -
 	Author: -
 	Reasons: -
 	*****************************************************************************
.SYNOPSIS
	Say hello with your name
 	
.DESCRIPTION
    Give to the script your first name and last name and he will give you an amazing output in the console
  	
.PARAMETER Name
    Put your Last Name
	
.PARAMETER Firstname
    Put your First Name

.OUTPUTS
	> "Bonjour $Firstname $Name en paramètre"
	
.EXAMPLE
	.\KGE-Give-Name.ps1 -Name "Gregeoire" -Firstname "Kyllian"
#>


param([Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$True)]$Name, $Firstname)

if (!$Name -or !$Firstname){
    Get-Help $MyInvocation.MyCommand.Path
        exit
}

Write-Host "Bonjour $Firstname $Name en paramètre"

