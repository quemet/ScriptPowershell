<#
ETML
Auteur : Quentin Métroz
Date : 24.11.2023
Description : Script qui crée 4 groupe en local, crée une arborescence dans un fichier qui est passé par l'utilisateur, 
              crée 6 utilisateurs locals et les ajoute dans leur groupe défini.
#>

$path = $args[0];
if(Test-Path -Path $path) {
    $groupName = @("Management", "Marketing", "Production");
    $directoryName = @("Management", "Marketing", "Production", "Utilisateurs");
    $userName = @("Legrand", "Paignesec", "Pepette", "Carpette", "Taff", "Turbin");
    $dirName = @("2010", "2011");

    foreach ($g in $groupName) {
        &".\Exercice1\Create-Group.ps1" $g;
    }
    
    foreach ($d in $directoryName) {
        &".\Create-Directory.ps1" $path "Directory" $d;
    }
    
    foreach ($u in $userName) {
        &".\Create-Directory.ps1" "$path\Utilisateurs" "Directory" $u;
    }

    for($i=0;$i -lt 2;$i++) {
        foreach ($dn in $dirName) {
            if($i == 0) {&".\Create-Directory.ps1" "$path\Managment" "Directory" $dn;} else {&".\Create-Directory.ps1" "$path\Marketing" "Directory" $dn;}
        }
    }

    foreach ($us in $userName) {
        &".\Create-User.ps1" $us $us;
    }

    foreach ($use in $userName) {
        if($use -eq "Legrand" -or $use -eq "Paignesec") {
            &".\Add-UserGroup" $use "Management";
        } elseif($use -eq "Pepette" -or $use -eq "Carpette") {
            &".\Add-UserGroup" $use "Marketing" ;
        } else {
            &".\Add-UserGroup" $use "production";
        }
    }
} else {Write-Host "This path doesen't exist";Exit;}