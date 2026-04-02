# Get-ChildItem -Path .\SEQ-3\ -Name *.txt -Recurse

# Get-ChildItem -Path .\SEQ-3 -Recurse | Where {$_.Extension -eq ".*", $_.Extension -notcontains ".rtf"} | Format-List Name, File

# move-item -Path .\SEQ-3\caca.txt -Destination .\SEQ-3\REP3\sousREP1Avec -Force

# New-Item -Path HKLM:\SOFTWARE -Name ETML -ItemType Directory

# New-ItemProperty -Path HKLM:\SOFTWARE\ETML -Name "tata" -Value "tatadata" -PropertyType String

# Get-ItemProperty -Path HKLM:\SOFTWARE\ETML -Name "tata" | Format-List tata