<#
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Description : Crée un nouvelle utilisateur en local avec son nom et son mot de passe passé en paramètres
#>
Import-Module microsoft.powershell.localaccounts -UseWindowsPowerShell;
$s= $args[1] | ConvertTo-SecureString -AsPlainText -Force;
New-LocalUser -Name $args[0] -Password $s;