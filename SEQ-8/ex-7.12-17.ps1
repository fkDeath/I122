# $tab = (1,2,3,4)
# $tabLength = $tab.Length
# Write-Output "la longueur du tableau est de $tabLength"

# $tab = (1,2,3,300)
# $tab[$tab.Length -1]
# Write-Output $tab.Last


# $tab = (200,300,200,300)
# $counter = 1
# for([int]$i = 0; $i -lt $tab.Length; $i++) {
#     for([int]$x = 1; $x -lt $tab.Length; $x++){
#         if ($i -ne $x){
#             if($tab[$i] -eq $tab[$x]){
#             $tab[$x] = $null
#             }
#         }
#     }
# }
# foreach($items in $tab){
#     Write-Output "$items $counter"
#     $counter++
# }

# $a = @(1,2,3,4,5,5,6,7,8,9,0,0)
# $a = $a | select -Unique
# Write-Output $a

# $age = @{tutu=12; tata=8}
# $age+= @{tete=13; tata=16}

# $age = @{tutu=12; tata=8}
# foreach ($key in $age.Keys) {
#     if ($key -eq "tata"){
#         "The value of '$key' is: $($age[$key])"
#     }
# }

# $age = @{tutu=12; tata=8}
# foreach ($items in $age){
#     if ($items.Keys -eq "tata"){
#         $age.Remove("tata")
#     }
# }