<# 
ETML
Auteur : Quentin Métroz
Date : 22.11.2023
Description : Ce Script permet à l'utilisateur de voir le nom du répertoire actuel, la liste des fichiers, 
              une information sur le fichier, de changer de répertoire et de voir les première lignes d'un répertoire
#>
if(-not(Test-Path -Path $args[0])) {Write-Host "This Path doesen't exist"; Exit;}
$a = 0;
while ($a -eq 0) {
    $userResponse = Read-Host @'
        Que voulez-vous faire ? 
        1 Afficher le nom du répertoire
        2 Lister les fichiers du répertoire
        3 Informations sur un fichier
        4 Changement de répertoires
        5 Première lignes d'un fichier
        0 Sortie
        Votre choix 
'@
    try{
        if($userResponse -eq "") { 
            "Veuillez entrer une valeur numérique entre 1 et 5";
        } else {
            $userResponse = [Int32]$userResponse;
            if($userResponse -ge 0 -and $userResponse -le 5) {
                break;
            } else {
                Write-Host "Veuillez entrer un int entre 1 et 5";
            }
        }
    }
    catch {Write-Host $_}
}

switch($userResponse) {
    1 {
        $a = $args[0].split("\"); $a[$a.Length - 1]
    }
    2 {
        Get-ChildItem -Path $args[0] -recurse;
    }
    3 {
        $file = Read-Host 'Quel est le nom du fichier en question '; 
        $filePath = $args[0] + "\" + $file; 
        if(Test-Path -Path $filePath) {
            Get-ItemProperty -Path $filePath;
        } else {
            Write-Host "This File doesen't exist"; Exit;
        }
    }
    4 {
        $path = Read-Host 'Quel est le chemin souhaité '; 
        if(Test-Path -Path $path) {
            Set-Location $path
        } else{ 
            Write-Host "This Path doesen't exist"; Exit;
        }
    }
    5 {
        $file = Read-Host 'Quel est le nom du fichier '; 
        $nmbLine = Read-Host 'Combien de ligne souhaitez-vous lire '; 
        $path = $args[0] + "\" + $file;
        if(Test-Path -Path $path) {
            if((Get-Content $path).Length -le $nmbLine) {
                Get-Content -Path $path -Tail $nmbLine
            } else {
                Write-Host "Vous avez demandé trop de ligne"; Exit;
            }
        } else {
            Write-Host "This File doesen't exist"; Exit;
        } 
    }
    0 {Exit;}
}