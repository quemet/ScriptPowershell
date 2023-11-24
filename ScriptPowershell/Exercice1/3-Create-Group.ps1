<#
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Descritpion : Ce script permet de créer un groupe local avec son nom donné en paramètres
#>
$g = Get-LocalGroup;
$group = $args[0];
if($g.Contains($group)) {
    Write-Host "The local group $group can't be create because he exists";
}
else {
    New-LocalGroup -Name $args[0];
}