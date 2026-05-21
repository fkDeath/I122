param([Parameter(Mandatory=$true)][string]$import, [Parameter(Mandatory=$true)][string]$export)

$csv = Import-CSV $import
$exportData = "PRENOM,NOM,DIVERS,EMAIL`n"

foreach ($item in $csv){
    $email = "$($item.PRENOM).$($item.NOM)@etml.ch"
    $exportData += "$($item.PRENOM),$($item.NOM),$($item.Divers),$($email)`n"
    $exportData | Out-File $export
}