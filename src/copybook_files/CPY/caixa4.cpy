      $IF SYS-CONSTANTS NOT DEFINED
       01  SYS-CONSTANTS.
           03  SYS-NULL       PIC 9(8) COMP-X VALUE H"01000000".
           03  SYS-CONTROL    PIC 9(8) COMP-X VALUE H"02000000".
           03  SYS-WINDOW     PIC 9(8) COMP-X VALUE H"03000000".
      $END

       01  filler.

       03  PRINCIPAL                       PIC 9(8) COMP-X VALUE 1.
       03  EF2                             PIC 9(8) COMP-X VALUE 2.
       03  EF4                             PIC 9(8) COMP-X VALUE 3.
       03  EF5                             PIC 9(8) COMP-X VALUE 4.
       03  SB1                             PIC 9(8) COMP-X VALUE 7.
       03  SB2                             PIC 9(8) COMP-X VALUE 8.
       03  EF-CONTRATO                     PIC 9(8) COMP-X VALUE 9.
       03  EF-ALBUM                        PIC 9(8) COMP-X VALUE 10.
       03  EF-MOVTO-INI                    PIC 9(8) COMP-X VALUE 11.
       03  EF-MOVTO-FIM                    PIC 9(8) COMP-X VALUE 12.
       03  EF-VENDEDOR                     PIC 9(8) COMP-X VALUE 13.
       03  PB3                             PIC 9(8) COMP-X VALUE 14.
       03  PB6                             PIC 9(8) COMP-X VALUE 15.
       03  EF3                             PIC 9(8) COMP-X VALUE 16.
       03  GBOX1                           PIC 9(8) COMP-X VALUE 17.
       03  LB1                             PIC 9(8) COMP-X VALUE 18.
       03  EF1                             PIC 9(8) COMP-X VALUE 19.
       03  EF6                             PIC 9(8) COMP-X VALUE 20.
       03  PB4                             PIC 9(8) COMP-X VALUE 21.
       03  PB5                             PIC 9(8) COMP-X VALUE 22.
       03  PB2                             PIC 9(8) COMP-X VALUE 24.
       03  PB8                             PIC 9(8) COMP-X VALUE 25.
       03  GBOX6                           PIC 9(8) COMP-X VALUE 26.
       03  CB1                             PIC 9(8) COMP-X VALUE 27.
       03  CB2                             PIC 9(8) COMP-X VALUE 28.
       03  CB3                             PIC 9(8) COMP-X VALUE 29.
       03  PB9                             PIC 9(8) COMP-X VALUE 30.
       03  EF15                            PIC 9(8) COMP-X VALUE 31.
       03  MLE1                            PIC 9(8) COMP-X VALUE 32.
       03  PB1                             PIC 9(8) COMP-X VALUE 33.
       03  MBOX6                           PIC 9(8) COMP-X VALUE 34.
       03  MBOX-ERROS                      PIC 9(8) COMP-X VALUE 35.
       03  AJUDA                           PIC 9(8) COMP-X VALUE 36.
       03  PB7                             PIC 9(8) COMP-X VALUE 37.
       03  MBOX1                           PIC 9(8) COMP-X VALUE 38.
       03  WIN3                            PIC 9(8) COMP-X VALUE 39.
       03  EF7                             PIC 9(8) COMP-X VALUE 40.
       03  WIN1                            PIC 9(8) COMP-X VALUE 41.
       03  EF-I-CODBAN                     PIC 9(8) COMP-X VALUE 42.
       03  EF-I-NOMEBAN                    PIC 9(8) COMP-X VALUE 43.
       03  EF-I-AGENCIA                    PIC 9(8) COMP-X VALUE 44.
       03  EF-DIG-AGENCIA                  PIC 9(8) COMP-X VALUE 45.
       03  EF-CONTA                        PIC 9(8) COMP-X VALUE 46.
       03  EF-DIG-CONTA                    PIC 9(8) COMP-X VALUE 47.
       03  EF-EMPRESA                      PIC 9(8) COMP-X VALUE 48.
       03  EF-I-CNPJ                       PIC 9(8) COMP-X VALUE 49.
       03  EF-NOSSO-NUMERO                 PIC 9(8) COMP-X VALUE 50.
       03  SB-CARTEIRA                     PIC 9(8) COMP-X VALUE 51.
       03  SB-ESPECIE                      PIC 9(8) COMP-X VALUE 52.
       03  EF-JUROS-DIA                    PIC 9(8) COMP-X VALUE 53.
       03  EF-DIAS-DESCONTO                PIC 9(8) COMP-X VALUE 54.
       03  EF-DESCONTO                     PIC 9(8) COMP-X VALUE 55.
       03  EF-I-MULTA                      PIC 9(8) COMP-X VALUE 56.
       03  EF-DIAS-INSTRUCAO               PIC 9(8) COMP-X VALUE 57.
       03  EF-INSTRUCAO1                   PIC 9(8) COMP-X VALUE 58.
       03  EF-INSTRUCAO2                   PIC 9(8) COMP-X VALUE 59.
       03  EF-INSTRUCAO3                   PIC 9(8) COMP-X VALUE 60.
       03  EF-INSTRUCAO4                   PIC 9(8) COMP-X VALUE 61.
       03  EF-INSTRUCAO5                   PIC 9(8) COMP-X VALUE 62.
       03  EF-LOCAL1                       PIC 9(8) COMP-X VALUE 63.
       03  EF-LOCAL2                       PIC 9(8) COMP-X VALUE 64.
       03  EF-PORTADOR                     PIC 9(8) COMP-X VALUE 65.
       03  EF8                             PIC 9(8) COMP-X VALUE 66.
       03  GBOX3                           PIC 9(8) COMP-X VALUE 67.
       03  GBOX4                           PIC 9(8) COMP-X VALUE 68.
       03  GBOX5                           PIC 9(8) COMP-X VALUE 69.
       03  GBOX8                           PIC 9(8) COMP-X VALUE 70.
       03  EF-LINHA-AVISO                  PIC 9(8) COMP-X VALUE 71.
       03  GBOX2                           PIC 9(8) COMP-X VALUE 72.
       03  EF9                             PIC 9(8) COMP-X VALUE 73.
       03  WIN2                            PIC 9(8) COMP-X VALUE 74.
       03  LB2                             PIC 9(8) COMP-X VALUE 75.
