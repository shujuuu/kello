      $IF SYS-CONSTANTS NOT DEFINED
       01  SYS-CONSTANTS.
           03  SYS-NULL       PIC 9(8) COMP-X VALUE H"01000000".
           03  SYS-CONTROL    PIC 9(8) COMP-X VALUE H"02000000".
           03  SYS-WINDOW     PIC 9(8) COMP-X VALUE H"03000000".
      $END

       01  filler.

       03  PRINCIPAL                       PIC 9(8) COMP-X VALUE 1.
       03  TAB1                            PIC 9(8) COMP-X VALUE 2.
       03  MBOX6                           PIC 9(8) COMP-X VALUE 3.
       03  MBOX-ERROS                      PIC 9(8) COMP-X VALUE 4.
       03  MBOX1                           PIC 9(8) COMP-X VALUE 5.
       03  AJUDA                           PIC 9(8) COMP-X VALUE 6.
       03  PB9                             PIC 9(8) COMP-X VALUE 7.
       03  WIN1                            PIC 9(8) COMP-X VALUE 8.
       03  RB3                             PIC 9(8) COMP-X VALUE 9.
       03  RB4                             PIC 9(8) COMP-X VALUE 10.
       03  RB1                             PIC 9(8) COMP-X VALUE 11.
       03  SB1                             PIC 9(8) COMP-X VALUE 12.
       03  EF5                             PIC 9(8) COMP-X VALUE 13.
       03  EF-CODIGO                       PIC 9(8) COMP-X VALUE 14.
       03  EF21                            PIC 9(8) COMP-X VALUE 15.
       03  PB16                            PIC 9(8) COMP-X VALUE 16.
       03  PB10                            PIC 9(8) COMP-X VALUE 17.
       03  PB11                            PIC 9(8) COMP-X VALUE 18.
       03  GBOX6                           PIC 9(8) COMP-X VALUE 19.
       03  PB12                            PIC 9(8) COMP-X VALUE 20.
       03  LB2                             PIC 9(8) COMP-X VALUE 21.
       03  GBOX7                           PIC 9(8) COMP-X VALUE 22.
       03  RB2                             PIC 9(8) COMP-X VALUE 23.
       03  RB5                             PIC 9(8) COMP-X VALUE 24.
       03  CB1                             PIC 9(8) COMP-X VALUE 25.
       03  EF6                             PIC 9(8) COMP-X VALUE 26.
       03  GBOX4                           PIC 9(8) COMP-X VALUE 27.
       03  RB6                             PIC 9(8) COMP-X VALUE 28.
       03  RB7                             PIC 9(8) COMP-X VALUE 29.
       03  RB11                            PIC 9(8) COMP-X VALUE 30.
       03  GBOX8                           PIC 9(8) COMP-X VALUE 31.
       03  RB8                             PIC 9(8) COMP-X VALUE 32.
       03  RB9                             PIC 9(8) COMP-X VALUE 33.
       03  RB10                            PIC 9(8) COMP-X VALUE 34.
       03  CB2                             PIC 9(8) COMP-X VALUE 35.
       03  EF13                            PIC 9(8) COMP-X VALUE 36.
       03  EF14                            PIC 9(8) COMP-X VALUE 37.
       03  PB23                            PIC 9(8) COMP-X VALUE 38.
       03  TABP1                           PIC 9(8) COMP-X VALUE 39.
       03  GBOX1                           PIC 9(8) COMP-X VALUE 40.
       03  SB2                             PIC 9(8) COMP-X VALUE 41.
       03  D-CODIGO                        PIC 9(8) COMP-X VALUE 42.
       03  D-NOME                          PIC 9(8) COMP-X VALUE 43.
       03  GBOX3                           PIC 9(8) COMP-X VALUE 44.
       03  PB1                             PIC 9(8) COMP-X VALUE 45.
       03  PB2                             PIC 9(8) COMP-X VALUE 46.
       03  PB3                             PIC 9(8) COMP-X VALUE 47.
       03  PB6                             PIC 9(8) COMP-X VALUE 48.
       03  PB4                             PIC 9(8) COMP-X VALUE 49.
       03  PB5                             PIC 9(8) COMP-X VALUE 50.
       03  LB1                             PIC 9(8) COMP-X VALUE 51.
       03  EF1                             PIC 9(8) COMP-X VALUE 52.
       03  EF4                             PIC 9(8) COMP-X VALUE 53.
       03  TABP2                           PIC 9(8) COMP-X VALUE 54.
       03  EF-ENDERECO1                    PIC 9(8) COMP-X VALUE 55.
       03  EF-BAIRRO1                      PIC 9(8) COMP-X VALUE 56.
       03  EF-CIDADE1                      PIC 9(8) COMP-X VALUE 57.
       03  EF-NOME-CID1                    PIC 9(8) COMP-X VALUE 58.
       03  EF-CEP1                         PIC 9(8) COMP-X VALUE 59.
       03  EF-DDD1                         PIC 9(8) COMP-X VALUE 60.
       03  EF-COMP-TEL1                    PIC 9(8) COMP-X VALUE 61.
       03  EF-FONE1                        PIC 9(8) COMP-X VALUE 62.
       03  EF-CX-POSTAL1                   PIC 9(8) COMP-X VALUE 63.
       03  EF-COMPLEMENTO1                 PIC 9(8) COMP-X VALUE 64.
       03  EF-E-MAIL1                      PIC 9(8) COMP-X VALUE 65.
       03  EF-PONTO-REFERENCIA1            PIC 9(8) COMP-X VALUE 66.
       03  EF-REG-IDENTID1                 PIC 9(8) COMP-X VALUE 67.
       03  SB3                             PIC 9(8) COMP-X VALUE 68.
       03  EF-CPF1                         PIC 9(8) COMP-X VALUE 69.
       03  EF-DT-EXPEDICAO1                PIC 9(8) COMP-X VALUE 70.
       03  EF-ORGAO-EXPEDICAO1             PIC 9(8) COMP-X VALUE 71.
       03  EF-COMP-FAX1                    PIC 9(8) COMP-X VALUE 72.
       03  EF-FAX1                         PIC 9(8) COMP-X VALUE 73.
       03  EF-DDD-CELULAR1                 PIC 9(8) COMP-X VALUE 74.
       03  EF-COMP-CEL1                    PIC 9(8) COMP-X VALUE 75.
       03  EF-CELULAR1                     PIC 9(8) COMP-X VALUE 76.
       03  SB-SEXO1                        PIC 9(8) COMP-X VALUE 77.
       03  EF-DATA-NASC1                   PIC 9(8) COMP-X VALUE 78.
       03  SB-SITUACAO-CLIENTE             PIC 9(8) COMP-X VALUE 79.
       03  EF-ENDERECO2                    PIC 9(8) COMP-X VALUE 80.
       03  EF-BAIRRO2                      PIC 9(8) COMP-X VALUE 81.
       03  EF-CIDADE2                      PIC 9(8) COMP-X VALUE 82.
       03  EF-NOME-CID2                    PIC 9(8) COMP-X VALUE 83.
       03  EF-CEP2                         PIC 9(8) COMP-X VALUE 84.
       03  EF-DDD-CID2                     PIC 9(8) COMP-X VALUE 85.
       03  EF-COMP-FONE2                   PIC 9(8) COMP-X VALUE 86.
       03  EF-FONE2                        PIC 9(8) COMP-X VALUE 87.
       03  EF-RAMAL2                       PIC 9(8) COMP-X VALUE 88.
       03  EF-COMPLEMENTO2                 PIC 9(8) COMP-X VALUE 89.
       03  EF-CX-POSTAL2                   PIC 9(8) COMP-X VALUE 90.
       03  EF-PONTO-REFERENCIA2            PIC 9(8) COMP-X VALUE 91.
       03  GBOX5                           PIC 9(8) COMP-X VALUE 92.
       03  EF3                             PIC 9(8) COMP-X VALUE 93.
       03  EF-CPF2                         PIC 9(8) COMP-X VALUE 94.
       03  EF-REG-IDENTID2                 PIC 9(8) COMP-X VALUE 95.
       03  EF-ORGAO-EXPEDICAO2             PIC 9(8) COMP-X VALUE 96.
       03  EF-DT-EXPEDICAO2                PIC 9(8) COMP-X VALUE 97.
       03  EF-DDD-CELULAR2                 PIC 9(8) COMP-X VALUE 98.
       03  EF-COMP-CEL2                    PIC 9(8) COMP-X VALUE 99.
       03  EF-CELULAR2                     PIC 9(8) COMP-X VALUE 100.
       03  EF-COMP-FAX2                    PIC 9(8) COMP-X VALUE 101.
       03  EF-FAX2                         PIC 9(8) COMP-X VALUE 102.
       03  EF-DATA-NASC2                   PIC 9(8) COMP-X VALUE 103.
       03  SB-SEXO2                        PIC 9(8) COMP-X VALUE 104.
       03  PB7                             PIC 9(8) COMP-X VALUE 105.
       03  PB13                            PIC 9(8) COMP-X VALUE 106.
       03  GBOX13                          PIC 9(8) COMP-X VALUE 107.
       03  TABP3                           PIC 9(8) COMP-X VALUE 108.
       03  D-CURSO                         PIC 9(8) COMP-X VALUE 109.
       03  SB4                             PIC 9(8) COMP-X VALUE 112.
       03  SB5                             PIC 9(8) COMP-X VALUE 113.
       03  PB8                             PIC 9(8) COMP-X VALUE 114.
       03  EF2                             PIC 9(8) COMP-X VALUE 115.
       03  GBOX2                           PIC 9(8) COMP-X VALUE 116.
       03  TABP4                           PIC 9(8) COMP-X VALUE 117.
       03  GBOX9                           PIC 9(8) COMP-X VALUE 118.
       03  EF7                             PIC 9(8) COMP-X VALUE 119.
       03  EF8                             PIC 9(8) COMP-X VALUE 120.
       03  EF9                             PIC 9(8) COMP-X VALUE 121.
       03  EF10                            PIC 9(8) COMP-X VALUE 122.
       03  EF11                            PIC 9(8) COMP-X VALUE 123.
       03  EF12                            PIC 9(8) COMP-X VALUE 124.
       03  PB14                            PIC 9(8) COMP-X VALUE 125.
       03  TABP5                           PIC 9(8) COMP-X VALUE 126.
       03  GBOX10                          PIC 9(8) COMP-X VALUE 127.
       03  EF22                            PIC 9(8) COMP-X VALUE 128.
       03  EF20                            PIC 9(8) COMP-X VALUE 129.
       03  EF18                            PIC 9(8) COMP-X VALUE 130.
       03  EF19                            PIC 9(8) COMP-X VALUE 131.
       03  EF15                            PIC 9(8) COMP-X VALUE 132.
       03  EF16                            PIC 9(8) COMP-X VALUE 133.
       03  EF-COMP-TEL-AVAL                PIC 9(8) COMP-X VALUE 134.
       03  EF23                            PIC 9(8) COMP-X VALUE 135.
       03  EF24                            PIC 9(8) COMP-X VALUE 136.
       03  EF25                            PIC 9(8) COMP-X VALUE 137.
       03  PB15                            PIC 9(8) COMP-X VALUE 138.
       03  TABP6                           PIC 9(8) COMP-X VALUE 139.
       03  EF31                            PIC 9(8) COMP-X VALUE 140.
       03  EF32                            PIC 9(8) COMP-X VALUE 141.
       03  EF33                            PIC 9(8) COMP-X VALUE 142.
       03  EF34                            PIC 9(8) COMP-X VALUE 143.
       03  EF35                            PIC 9(8) COMP-X VALUE 144.
       03  EF36                            PIC 9(8) COMP-X VALUE 145.
       03  EF37                            PIC 9(8) COMP-X VALUE 146.
       03  EF50                            PIC 9(8) COMP-X VALUE 147.
       03  PB17                            PIC 9(8) COMP-X VALUE 148.
       03  LB4                             PIC 9(8) COMP-X VALUE 149.
       03  PB20                            PIC 9(8) COMP-X VALUE 150.
       03  TABP7                           PIC 9(8) COMP-X VALUE 151.
       03  EF100                           PIC 9(8) COMP-X VALUE 152.
       03  EF89                            PIC 9(8) COMP-X VALUE 153.
       03  EF101                           PIC 9(8) COMP-X VALUE 154.
       03  EF104                           PIC 9(8) COMP-X VALUE 155.
       03  EF103                           PIC 9(8) COMP-X VALUE 156.
       03  EF102                           PIC 9(8) COMP-X VALUE 157.
       03  EF30                            PIC 9(8) COMP-X VALUE 158.
       03  EF38                            PIC 9(8) COMP-X VALUE 159.
       03  PB18                            PIC 9(8) COMP-X VALUE 160.
       03  LB3                             PIC 9(8) COMP-X VALUE 161.
       03  PB19                            PIC 9(8) COMP-X VALUE 162.
       03  RB12                            PIC 9(8) COMP-X VALUE 163.
       03  RB13                            PIC 9(8) COMP-X VALUE 164.
       03  TABP8                           PIC 9(8) COMP-X VALUE 165.
       03  EF96                            PIC 9(8) COMP-X VALUE 167.
       03  GBOX11                          PIC 9(8) COMP-X VALUE 168.
       03  EF40                            PIC 9(8) COMP-X VALUE 169.
       03  EF47                            PIC 9(8) COMP-X VALUE 170.
       03  EF41                            PIC 9(8) COMP-X VALUE 171.
       03  EF-COMP-TEL-PAIS                PIC 9(8) COMP-X VALUE 172.
       03  EF42                            PIC 9(8) COMP-X VALUE 173.
       03  EF-COMP-CEL-PAIS                PIC 9(8) COMP-X VALUE 174.
       03  EF43                            PIC 9(8) COMP-X VALUE 175.
       03  EF44                            PIC 9(8) COMP-X VALUE 176.
       03  EF48                            PIC 9(8) COMP-X VALUE 177.
       03  EF49                            PIC 9(8) COMP-X VALUE 178.
       03  EF45                            PIC 9(8) COMP-X VALUE 179.
       03  EF46                            PIC 9(8) COMP-X VALUE 180.
       03  EF52                            PIC 9(8) COMP-X VALUE 181.
       03  EF53                            PIC 9(8) COMP-X VALUE 182.
       03  EF55                            PIC 9(8) COMP-X VALUE 183.
       03  EF56                            PIC 9(8) COMP-X VALUE 184.
       03  EF54                            PIC 9(8) COMP-X VALUE 185.
       03  GBOX12                          PIC 9(8) COMP-X VALUE 186.
       03  EF-EMPRESA3                     PIC 9(8) COMP-X VALUE 187.
       03  EF-ENDERECO3                    PIC 9(8) COMP-X VALUE 188.
       03  EF-PONTO-REFERENCIA3            PIC 9(8) COMP-X VALUE 189.
       03  EF-BAIRRO3                      PIC 9(8) COMP-X VALUE 190.
       03  EF-CIDADE3                      PIC 9(8) COMP-X VALUE 191.
       03  EF-NOME-CID3                    PIC 9(8) COMP-X VALUE 192.
       03  EF-DDD-CID3                     PIC 9(8) COMP-X VALUE 193.
       03  EF-COMP-TEL3                    PIC 9(8) COMP-X VALUE 194.
       03  EF-FONE3                        PIC 9(8) COMP-X VALUE 195.
       03  EF-RAMAL3                       PIC 9(8) COMP-X VALUE 196.
       03  EF57                            PIC 9(8) COMP-X VALUE 197.
       03  EF58                            PIC 9(8) COMP-X VALUE 198.
       03  PB21                            PIC 9(8) COMP-X VALUE 199.
       03  PB22                            PIC 9(8) COMP-X VALUE 200.
       03  PB24                            PIC 9(8) COMP-X VALUE 201.
       03  PB25                            PIC 9(8) COMP-X VALUE 202.
       03  GBOX14                          PIC 9(8) COMP-X VALUE 203.
       03  GBOX15                          PIC 9(8) COMP-X VALUE 204.
