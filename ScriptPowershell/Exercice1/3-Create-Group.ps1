<#
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Descritpion : Ce script permet de créer un groupe local avec son nom donné en paramètres
#>
New-LocalGroup -Name $args[0];