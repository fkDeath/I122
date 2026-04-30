if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { Write-Host "Ce script doit être exécuté avec des droits d'administration."  Exit 1  } 

$NewUserName = Read-Host "Entrez le nom d'utilisateur du nouvel utilisateur :" 

if ([string]::IsNullOrWhiteSpace($NewUserName)) { 
    Write-Host "Le nom d'utilisateur ne peut pas être vide. Veuillez entrer un nom d'utilisateur valide." 
    Exit 1 
} 

if (Get-LocalUser -Name $NewUserName -ErrorAction SilentlyContinue) { 
    Write-Host "Le nom d'utilisateur '$NewUserName' existe déjà. Veuillez choisir un autre nom d'utilisateur." 
    Exit 1 
} 

$NewUserPassword = Read-Host "Entrez le mot de passe du nouvel utilisateur :" 
$SecureNewUserPassword = ConvertTo-SecureString $NewUserPassword -AsPlainText -Force 

try { 
    New-LocalUser -Name $NewUserName -Password $SecureNewUserPassword -ErrorAction Stop 
} 
catch { 
    Write-Host "Une erreur s'est produite lors de la création du nouvel utilisateur '$NewUserName'." 
    Write-Host "Erreur : $_" 
    Exit 1 
} 

Write-Host "Le nouvel utilisateur '$NewUserName' a été créé avec succès !" 

$GroupName = Read-Host "Entrez le nom du groupe où ajouter l'utilisateur '$NewUserName' :" 

if (-Not (Get-LocalGroup -Name $GroupName -ErrorAction SilentlyContinue)) { 
    Write-Host "Le groupe '$GroupName' n'existe pas. Veuillez vérifier le nom du groupe et réessayez." 
    Exit 1 
} 

try { 
    Add-LocalGroupMember -Group $GroupName -Member $NewUserName -ErrorAction Stop 
} 
catch { 
    Write-Host "Une erreur s'est produite lors de l'ajout de l'utilisateur '$NewUserName' au groupe '$GroupName'." 
    Write-Host "Erreur : $_" 
    Exit 1 
} 

Write-Host "L'utilisateur '$NewUserName' a été ajouté au groupe '$GroupName' avec succès !"