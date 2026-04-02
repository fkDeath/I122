ni -Path .\SEQ-3\ -ItemType Directory -Name "REP1"
ni -Path .\SEQ-3\ -ItemType Directory -Name "REP2"
ni -Path .\SEQ-3\ -ItemType Directory -Name "REP3"

ni -Path .\SEQ-3\REP1 -ItemType Directory -Name "sousREP1Avec"
ni -Path .\SEQ-3\REP1 -ItemType Directory -Name "sousREP1Sans"

ni -Path .\SEQ-3\REP1\sousREP1Avec -ItemType File -Name "toto.txt"
ni -Path .\SEQ-3\REP1\sousREP1Avec -ItemType File -Name "titi.rtf"

ni -Path .\SEQ-3\REP1\sousREP1Sans -ItemType File -Name "tata.bmp"

ni -Path .\SEQ-3\REP2 -ItemType Directory -Name "sousREP2Avec"
ni -Path .\SEQ-3\REP2 -ItemType Directory -Name "sousREP2Sans"

ni -Path .\SEQ-3\REP3 -ItemType Directory -Name "sousREP1Avec"
ni -Path .\SEQ-3\REP3 -ItemType Directory -Name "sousREP1Sans"