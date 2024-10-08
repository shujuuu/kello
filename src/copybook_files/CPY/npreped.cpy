      $IF SYS-CONSTANTS NOT DEFINED
       01  SYS-CONSTANTS.
           03  SYS-NULL       PIC 9(8) COMP-X VALUE H"01000000".
           03  SYS-CONTROL    PIC 9(8) COMP-X VALUE H"02000000".
           03  SYS-WINDOW     PIC 9(8) COMP-X VALUE H"03000000".
      $END

       01  filler.

       03  WIN1                            PIC 9(8) COMP-X VALUE 1.
       03  EF-LINHA-STATUS                 PIC 9(8) COMP-X VALUE 2.
       03  EF-LINHA-AVISO                  PIC 9(8) COMP-X VALUE 3.
       03  PB-OK                           PIC 9(8) COMP-X VALUE 4.
       03  PB-INCLUSAO                     PIC 9(8) COMP-X VALUE 5.
       03  PB-ALTERACAO                    PIC 9(8) COMP-X VALUE 6.
       03  PB-EXCLUSAO                     PIC 9(8) COMP-X VALUE 7.
       03  PB-CONSULTA                     PIC 9(8) COMP-X VALUE 8.
       03  PB-ANTERIOR                     PIC 9(8) COMP-X VALUE 9.
       03  PB-PROXIMO                      PIC 9(8) COMP-X VALUE 10.
       03  PB-SUGESTAO                     PIC 9(8) COMP-X VALUE 11.
       03  PB-NAVEGACAO                    PIC 9(8) COMP-X VALUE 12.
       03  PB-SAIR                         PIC 9(8) COMP-X VALUE 13.
       03  PB-CANCELAR                     PIC 9(8) COMP-X VALUE 14.
       03  GBOX4                           PIC 9(8) COMP-X VALUE 15.
       03  RB-PEDIDO-PADRAO                PIC 9(8) COMP-X VALUE 16.
       03  RB-VENDA-CARTAO                 PIC 9(8) COMP-X VALUE 17.
       03  WIN2                            PIC 9(8) COMP-X VALUE 18.
       03  EF-SEQUENCIA                    PIC 9(8) COMP-X VALUE 19.
       03  EF-SITUACAO                     PIC 9(8) COMP-X VALUE 20.
       03  GBOX1                           PIC 9(8) COMP-X VALUE 21.
       03  EF-DTATUALIZADO                 PIC 9(8) COMP-X VALUE 22.
       03  EF-USUARIO                      PIC 9(8) COMP-X VALUE 23.
       03  EF-DTCADASTRO                   PIC 9(8) COMP-X VALUE 24.
       03  PB7                             PIC 9(8) COMP-X VALUE 25.
       03  WIN3                            PIC 9(8) COMP-X VALUE 26.
       03  EF-VENDEDOR                     PIC 9(8) COMP-X VALUE 27.
       03  EF-CLIENTE                      PIC 9(8) COMP-X VALUE 28.
       03  GBOX2                           PIC 9(8) COMP-X VALUE 29.
       03  GBOX3                           PIC 9(8) COMP-X VALUE 30.
       03  PB5                             PIC 9(8) COMP-X VALUE 31.
       03  PB3                             PIC 9(8) COMP-X VALUE 32.
       03  PB4                             PIC 9(8) COMP-X VALUE 33.
       03  PB6                             PIC 9(8) COMP-X VALUE 34.
       03  EF8                             PIC 9(8) COMP-X VALUE 35.
       03  EF-TOTPAGAR                     PIC 9(8) COMP-X VALUE 36.
       03  EF-TOTAL-F                      PIC 9(8) COMP-X VALUE 37.
       03  EF1                             PIC 9(8) COMP-X VALUE 38.
       03  USER1                           PIC 9(8) COMP-X VALUE 39.
       03  EF4                             PIC 9(8) COMP-X VALUE 40.
       03  EF-TOTAL-TABELA                 PIC 9(8) COMP-X VALUE 41.
       03  PB8                             PIC 9(8) COMP-X VALUE 42.
       03  RB-EFETIVAR                     PIC 9(8) COMP-X VALUE 43.
       03  RB-ORCAMENTO                    PIC 9(8) COMP-X VALUE 44.
       03  RB-CONDICIONAL                  PIC 9(8) COMP-X VALUE 45.
       03  RB-ENCOMENDA                    PIC 9(8) COMP-X VALUE 46.
       03  RB5                             PIC 9(8) COMP-X VALUE 47.
       03  RB6                             PIC 9(8) COMP-X VALUE 48.
       03  EF15                            PIC 9(8) COMP-X VALUE 49.
       03  EF17                            PIC 9(8) COMP-X VALUE 50.
       03  EF-EFETIVAR                     PIC 9(8) COMP-X VALUE 51.
       03  PB11                            PIC 9(8) COMP-X VALUE 52.
       03  EF33                            PIC 9(8) COMP-X VALUE 53.
       03  PB10                            PIC 9(8) COMP-X VALUE 54.
       03  WIN5                            PIC 9(8) COMP-X VALUE 55.
       03  EF-OBSERVACAO1                  PIC 9(8) COMP-X VALUE 56.
       03  EF-OBSERVACAO2                  PIC 9(8) COMP-X VALUE 57.
       03  EF-OBSERVACAO3                  PIC 9(8) COMP-X VALUE 58.
       03  EF-OBSERVACAO4                  PIC 9(8) COMP-X VALUE 59.
       03  WIN7                            PIC 9(8) COMP-X VALUE 60.
       03  PB-GRAVAR                       PIC 9(8) COMP-X VALUE 61.
       03  EF-VENCTO                       PIC 9(8) COMP-X VALUE 62.
       03  EF-VLRPAGO                      PIC 9(8) COMP-X VALUE 63.
       03  SB-TABCOB                       PIC 9(8) COMP-X VALUE 64.
       03  EF6                             PIC 9(8) COMP-X VALUE 65.
       03  EF-TOTALPAGO                    PIC 9(8) COMP-X VALUE 66.
       03  EF-TROCO                        PIC 9(8) COMP-X VALUE 67.
       03  PB1                             PIC 9(8) COMP-X VALUE 68.
       03  CB1                             PIC 9(8) COMP-X VALUE 69.
       03  EF5                             PIC 9(8) COMP-X VALUE 70.
       03  USER5                           PIC 9(8) COMP-X VALUE 71.
       03  SB-TIPO-PAGO                    PIC 9(8) COMP-X VALUE 72.
       03  CB2                             PIC 9(8) COMP-X VALUE 73.
       03  WIN10                           PIC 9(8) COMP-X VALUE 74.
       03  EF-PRODUTO-ALTER                PIC 9(8) COMP-X VALUE 75.
       03  EF-DESC-PRODUTO-ALTER           PIC 9(8) COMP-X VALUE 76.
       03  EF-QTDE-ALTER                   PIC 9(8) COMP-X VALUE 77.
       03  EF-VLRUNI-ALTER                 PIC 9(8) COMP-X VALUE 78.
       03  EF-DESCONTO-ALTER               PIC 9(8) COMP-X VALUE 79.
       03  EF12                            PIC 9(8) COMP-X VALUE 80.
       03  EF14                            PIC 9(8) COMP-X VALUE 81.
       03  WIN11                           PIC 9(8) COMP-X VALUE 82.
       03  EF9                             PIC 9(8) COMP-X VALUE 83.
       03  EF-DESC-G                       PIC 9(8) COMP-X VALUE 84.
       03  RB3                             PIC 9(8) COMP-X VALUE 85.
       03  RB4                             PIC 9(8) COMP-X VALUE 86.
       03  EF-JURO                         PIC 9(8) COMP-X VALUE 87.
       03  GBOX5                           PIC 9(8) COMP-X VALUE 88.
       03  GBOX8                           PIC 9(8) COMP-X VALUE 89.
       03  EF-DESC-G2                      PIC 9(8) COMP-X VALUE 90.
       03  EF-JURO2                        PIC 9(8) COMP-X VALUE 91.
       03  EF-ARREDONDAMENTO               PIC 9(8) COMP-X VALUE 92.
       03  EF10                            PIC 9(8) COMP-X VALUE 93.
       03  WIN13                           PIC 9(8) COMP-X VALUE 94.
       03  EF-TOTAL-QTDE                   PIC 9(8) COMP-X VALUE 95.
       03  WIN4                            PIC 9(8) COMP-X VALUE 96.
       03  MLE1                            PIC 9(8) COMP-X VALUE 97.
       03  PB9                             PIC 9(8) COMP-X VALUE 98.
       03  EF3                             PIC 9(8) COMP-X VALUE 99.
       03  EF32                            PIC 9(8) COMP-X VALUE 100.
       03  WIN16                           PIC 9(8) COMP-X VALUE 101.
       03  EF-PRODUTO-D                    PIC 9(8) COMP-X VALUE 102.
       03  EF-QTDE-D                       PIC 9(8) COMP-X VALUE 103.
       03  EF-VLRUNI-D                     PIC 9(8) COMP-X VALUE 104.
       03  EF-DESC-D                       PIC 9(8) COMP-X VALUE 105.
       03  EF20                            PIC 9(8) COMP-X VALUE 106.
       03  EF21                            PIC 9(8) COMP-X VALUE 107.
       03  EF16                            PIC 9(8) COMP-X VALUE 108.
       03  RB1                             PIC 9(8) COMP-X VALUE 109.
       03  RB2                             PIC 9(8) COMP-X VALUE 110.
       03  WIN17                           PIC 9(8) COMP-X VALUE 111.
       03  EF-ESPESSURA                    PIC 9(8) COMP-X VALUE 112.
       03  EF-LARGURA                      PIC 9(8) COMP-X VALUE 113.
       03  EF-COMPRIMENTO                  PIC 9(8) COMP-X VALUE 114.
       03  WIN18                           PIC 9(8) COMP-X VALUE 115.
       03  EF-PRODUTO                      PIC 9(8) COMP-X VALUE 116.
       03  EF-QTDE                         PIC 9(8) COMP-X VALUE 117.
       03  EF-VLRUNI                       PIC 9(8) COMP-X VALUE 118.
       03  EF-DESC                         PIC 9(8) COMP-X VALUE 119.
       03  EF23                            PIC 9(8) COMP-X VALUE 120.
       03  EF24                            PIC 9(8) COMP-X VALUE 121.
       03  EF28                            PIC 9(8) COMP-X VALUE 122.
       03  EF18                            PIC 9(8) COMP-X VALUE 123.
       03  WIN19                           PIC 9(8) COMP-X VALUE 124.
       03  EF2                             PIC 9(8) COMP-X VALUE 125.
       03  USER6                           PIC 9(8) COMP-X VALUE 126.
       03  EF7                             PIC 9(8) COMP-X VALUE 127.
       03  WIN20                           PIC 9(8) COMP-X VALUE 128.
       03  USER8                           PIC 9(8) COMP-X VALUE 129.
       03  WIN21                           PIC 9(8) COMP-X VALUE 130.
       03  USER9                           PIC 9(8) COMP-X VALUE 131.
       03  WIN6                            PIC 9(8) COMP-X VALUE 132.
       03  GBOX9                           PIC 9(8) COMP-X VALUE 133.
       03  EF-C�DIGO-BARRAS                PIC 9(8) COMP-X VALUE 134.
       03  WIN12                           PIC 9(8) COMP-X VALUE 135.
       03  GBOX10                          PIC 9(8) COMP-X VALUE 136.
       03  USER2                           PIC 9(8) COMP-X VALUE 137.
       03  EF27                            PIC 9(8) COMP-X VALUE 138.
       03  EF29                            PIC 9(8) COMP-X VALUE 139.
       03  EF30                            PIC 9(8) COMP-X VALUE 140.
       03  EF31                            PIC 9(8) COMP-X VALUE 141.
       03  EF11                            PIC 9(8) COMP-X VALUE 142.
       03  WIN14                           PIC 9(8) COMP-X VALUE 143.
       03  EF-QTDE-CARTAO                  PIC 9(8) COMP-X VALUE 144.
       03  EF-PRODUTO-CARTAO               PIC 9(8) COMP-X VALUE 145.
       03  EF-VLRUNI-CARTAO                PIC 9(8) COMP-X VALUE 146.
       03  EF-DESC-CARTAO                  PIC 9(8) COMP-X VALUE 147.
       03  EF22                            PIC 9(8) COMP-X VALUE 148.
       03  EF25                            PIC 9(8) COMP-X VALUE 149.
       03  EF26                            PIC 9(8) COMP-X VALUE 150.
       03  WIN8                            PIC 9(8) COMP-X VALUE 151.
       03  GBOX6                           PIC 9(8) COMP-X VALUE 152.
       03  PB2                             PIC 9(8) COMP-X VALUE 153.
       03  EF-DATA-ENTREGA                 PIC 9(8) COMP-X VALUE 154.
       03  EF-HORA-ENTREGA                 PIC 9(8) COMP-X VALUE 155.
       03  EF19                            PIC 9(8) COMP-X VALUE 156.
       03  WIN9                            PIC 9(8) COMP-X VALUE 157.
       03  USER3                           PIC 9(8) COMP-X VALUE 158.
       03  WIN22                           PIC 9(8) COMP-X VALUE 159.
       03  USER4                           PIC 9(8) COMP-X VALUE 160.
       03  WIN-ALERTA                      PIC 9(8) COMP-X VALUE 161.
       03  EF34                            PIC 9(8) COMP-X VALUE 162.
       03  WIN-CUSTO-ADD                   PIC 9(8) COMP-X VALUE 163.
       03  USER7                           PIC 9(8) COMP-X VALUE 164.
       03  EF13                            PIC 9(8) COMP-X VALUE 165.
       03  WIN-ALTERAR-CUSTO               PIC 9(8) COMP-X VALUE 166.
       03  EF35                            PIC 9(8) COMP-X VALUE 167.
       03  WIN15                           PIC 9(8) COMP-X VALUE 168.
       03  USER10                          PIC 9(8) COMP-X VALUE 169.
       03  PB12                            PIC 9(8) COMP-X VALUE 170.
       03  EF-COR-BORDADO                  PIC 9(8) COMP-X VALUE 171.
       03  EF37                            PIC 9(8) COMP-X VALUE 172.
       03  EF-TAMANHO-BORDADO              PIC 9(8) COMP-X VALUE 173.
       03  EF-POSICAO-BORDADO              PIC 9(8) COMP-X VALUE 174.
       03  EF-PONTOS-BORDADO               PIC 9(8) COMP-X VALUE 175.
       03  USER11                          PIC 9(8) COMP-X VALUE 176.
       03  EF36                            PIC 9(8) COMP-X VALUE 177.
