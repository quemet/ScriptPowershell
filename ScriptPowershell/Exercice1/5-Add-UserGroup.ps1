<#
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Description : Ce Script ajoute à un groupe local un utilisateur, le nom de l'utilisateur et le nom du groupe sont passé en paramètres
#>
Add-LocalGroupMember -Group $args[1] -Member $args[0];