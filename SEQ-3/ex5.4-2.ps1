New-item D:\EMTL\etml\PS1\I122\SEQ-3\new-5-4\chap5 -ItemType Directory

for ($i = 1; $i -lt 4; $i++) {
    $nav1 = ".\SEQ-3\new-5-4\chap5\rep" + $i
    $nav2 = ".\SEQ-3\new-5-4\chap5\rep" + $i + "\sousREP" + $i + "Avec"
    $nav2bis = ".\SEQ-3\new-5-4\chap5\rep" + $i + "\sousREP" + $i + "Sans"

    New-Item -Path $nav1 -ItemType Directory
    New-Item -Path $nav2 -ItemType Directory
    New-Item -Path $nav2bis -ItemType Directory

    New-Item -Path $nav2 -Name "toto.rtf" -ItemType File -Value "text $i"
    New-Item -Path $nav2 -Name "titi.txt" -ItemType File -Value "text $i"
    New-Item -Path $nav2bis -Name "toto.bmp" -ItemType File -Value "0x11BBCC"
}