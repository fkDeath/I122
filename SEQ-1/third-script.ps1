$monDossier = "Courrier"

$monDossier | gm

ni $monDossier -ItemType "Directory" | gm

Get-ChildItem .\$monDossier