# $getFile = Get-Content .\SEQ-9\fable-corbeau-renard.txt
# foreach($line in $getFile) {
#     if($line -like "*renard*"){
#         Write-Host $content
#     }
# }


# $getContentFileOnePath = Get-Content .\SEQ-9\fable-cigale-fourni.txt
# $getContentFileTwoPath = Get-Content .\SEQ-9\fable-colombe-fourmi.txt
# Write-Host "Fable Cigale Foumi :"
# foreach($line in $getContentFileOnePath){
#     if($line -like "*fourmi*"){
#         Write-Host $line
#     }
# }
# Write-Host "`nFable Colombe Foumi :"
# foreach($line in $getContentFileTwoPath){
#     if($line -like "*fourmi*"){
#         Write-Host $line
#     }
# }


# $getFileOnePath = ".\SEQ-9\fable-cigale-fourni.txt"
# $getFileTwoPath = ".\SEQ-9\fable-colombe-fourmi.txt"
# Select-String -Path $getFileOnePath -Pattern "fourmi" -Encoding "utf7"
# Select-String -Path $getFileTwoPath -Pattern "fourmi" -Encoding "utf7"

param([Parameter(Mandatory=$true)][string]$import, [Parameter(Mandatory=$true)][string]$export)

$csv = Import-CSV $import
$exportData = "PRENOM,NOM,DIVERS,EMAIL`n"

foreach ($item in $csv){
    $email = "$($item.PRENOM).$($item.NOM)@etml.ch"
    $exportData += "$($item.PRENOM),$($item.NOM),$($item.Divers),$($email)`n"
    $exportData | Out-File $export
}


# $csv = Import-Csv $import
 
# # Ajouter la propriété EMAIL à chaque objet
# foreach ($item in $csv) {
#     $item | Add-Member -MemberType NoteProperty -Name EMAIL -Value "$($item.PRENOM).$($item.NOM)@etml.ch"
# }
 
# # Exporter une seule fois
# $csv | Export-Csv -Path $export -Encoding UTF8 -NoTypeInformation