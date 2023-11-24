<#
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Description : Crée un nouvelle utilisateur en local avec son nom et son mot de passe passé en paramètres
#>
Import-Module microsoft.powershell.localaccounts -UseWindowsPowerShell;
$userName = $args[0];
$password = $args[1] | ConvertTo-SecureString -AsPlainText -Force;
$user = Get-LocalUser;
if($user.Contains($userName)) {
    Write-Host "The creation of the user $userName has failed because he exists";
} else {
    New-LocalUser -Name $userName -Password $s;
}