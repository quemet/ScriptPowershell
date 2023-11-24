<#
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Description : Ce Script ajoute à un groupe local un utilisateur, le nom de l'utilisateur et le nom du groupe sont passé en paramètres
#>
$userName = $args[0];
$groupName = $args[1];
$hn = hostname;
$user = Get-LocalGroupMember -Name $groupName;
$user = $user.Name;
if($user.Contains("$hn/$userName")) {
    Write-Host "This user can't be added to the Group beacause he exists in the group";
} else {
    Add-LocalGroupMember -Group $args[1] -Member $args[0];
}