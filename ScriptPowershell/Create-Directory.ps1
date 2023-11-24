<#
ETML
Auteur : Quentin Métroz
Date : 24.11.2023
Description : Ce Script crée un item qui est passé en paramètres de même que le chemin et le nom
#>

New-Item -Path $args[0] -ItemType $args[1] -Name $args[2];