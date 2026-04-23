# $PWD
# $_
# $$
# [Math]::Pow(2, 0)
# [Math]::Round(3.14159, 2)
# 10%100
# "hello world" -replace "w", "W" -replace "h", "H"
# "hello world" -like "*o wo*"
# $i = 1
# write-host ($i += 2)
# write-host ($i =+ 2)
# "TOTOTOTO" -replace "O", "A"
# Get-Location
# Get-Service | Where-Object { $_.name -like "W*" }
# $tab = 'toto', 3.25, 3469, "HELLO WORLD"
# $tab[2] = $null
# $tab[2
# $tab | gm
# $tab += "u"
# $tab += "t"
# foreach ($item in $tab) {
#     write-host $item
# }
# $tabLength = $tab.Length
# for ($i = 0; $i -lt $tabLength; $i++) {
#     if ($tab[$i] -eq 13 -or $tab[$i] -eq 22) {
#         Write-Host $tab[$i]
#     }
# }
# foreach ($item in $tab) {
#     Write-Host "la ligne est : $item"
# }
# foreach ($item in $tab){
#     $tabLength = $tab.Length
#     for ($i = 0; $i -lt $tabLength; $i++){
#         if ($tab[$i] -eq $tab[$i + 1]){
#             $tab[$i] = $null
#             Write-Host "Element $item removed from the array."
#         }
#     }
# }
# $tab