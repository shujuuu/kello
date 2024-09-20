       IDENTIFICATION DIVISION.
       PROGRAM-ID. GALHO52.
       AUTHOR. ALFREDO SAVIOLLI NETO.
       DATE-WRITTEN. 25/07/2005.
      *FUNÇÃO: ALTERA LAYOUT DO CGD001 CDC010

       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           COPY CAPX001.

           COPY CGPX011.

           SELECT CGD911 ASSIGN TO PATH-CGD911
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  LOCK MODE IS MANUAL WITH LOCK ON RECORD
                  RECORD KEY IS COD-COMPL-CG91
                  ALTERNATE RECORD KEY IS
                  ALT2-CG91 = CPF-CG91
                              CODIGO-CG91
                  STATUS IS ST-CGD911.

       DATA DIVISION.
       FILE SECTION.

           COPY CAPW001.

           COPY CGPW011.

       FD  CGD911.
       01  REG-CGD911.
           05  COD-COMPL-CG91.
               10  CLASSIF-CG91     PIC 9.
      *     CLASSIF = 0-CONTRATO  1-COMUM
               10  CODIGO-CG91      PIC 9(8).
           05  ENDERECO1-CG91       PIC X(45).
           05  COMPLEMENTO1-CG91    PIC X(30).
           05  PONTO-REFER1-CG91    PIC X(40).
           05  BAIRRO1-CG91         PIC X(25).
           05  CIDADE1-CG91         PIC 9(4).
           05  CEP1-CG91            PIC 9(8).
           05  FONE1-CG91           PIC 9(8).
           05  CX-POSTAL1-CG91      PIC 9(5).
           05  EMPRESA-CG91         PIC X(30).
           05  ENDERECO2-CG91       PIC X(45).
           05  COMPLEMENTO2-CG91    PIC X(30).
           05  PONTO-REFER2-CG91    PIC X(40).
           05  BAIRRO2-CG91         PIC X(25).
           05  CIDADE2-CG91         PIC 9(4).
           05  CEP2-CG91            PIC 9(8).
           05  FONE2-CG91           PIC 9(8).
           05  RAMAL2-CG91          PIC 9(3).
           05  CX-POSTAL2-CG91      PIC 9(5).
           05  E-MAIL-CG91          PIC X(30).
           05  CELULAR-CG91         PIC 9(8).
           05  FAX-CG91             PIC 9(8).
           05  CPF-CG91             PIC 9(16).
           05  RG-CG91              PIC X(15).
           05  DT-EXPEDICAO-CG91    PIC 9(8).
           05  ORGAO-EXPEDICAO-CG91 PIC X(8).
           05  DATA-NASC-CG91       PIC 9(8).
      *    DATA-NASC-CG11 = AAAAMMDD
           05  NOME-PAI-CG91         PIC X(30).
           05  NOME-MAE-CG91         PIC X(30).
           05  SITUACAO-CLI-CG91     PIC 9.
           05  TURMA-CG91            PIC X(03).
           05  TURNO-CG91            PIC X(10).
           05  ENDERECO-PAIS-CG91    PIC X(45).
           05  BAIRRO-PAIS-CG91      PIC X(25).
           05  CIDADE-PAIS-CG91      PIC 9(4).
           05  FONE-PAIS-CG91        PIC 9(8).
           05  CELULAR-PAIS-CG91     PIC 9(8).
           05  CEP-PAIS-CG91         PIC 9(8).
           05  ENDERECO-REP-CG91     PIC X(45).
           05  COMPLEMENTO-PAIS-CG91 PIC X(30).
           05  DDDD-CELULAR-CG91     PIC 9(02).
           05  SEXO-CG91             PIC X(01).
           05  BAIRRO-REP-CG91       PIC X(25).
           05  CIDADE-REP-CG91       PIC 9(4).
           05  CEP-REP-CG91          PIC 9(8).
           05  FILLER                PIC X(60).

       WORKING-STORAGE SECTION.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  VARIAVEIS.
           05  ST-CGD002             PIC XX       VALUE SPACES.
           05  ST-CGD003             PIC XX       VALUE SPACES.
           05  ST-CGD011             PIC XX       VALUE SPACES.
           05  ST-CGD902             PIC XX       VALUE SPACES.
           05  ST-CGD903             PIC XX       VALUE SPACES.
           05  ST-CGD911             PIC XX       VALUE SPACES.
           05  ERRO-W                PIC 9        VALUE ZEROS.
      *    ERRO-W - flag que controla se houve erro de abertura arquivo
           05  HORA-W                PIC 9(8)     VALUE ZEROS.
           05  PAG-W                 PIC 9(2)     VALUE ZEROS.
           05  EMP-REFERENCIA.
               10  VAR1              PIC X VALUE "\".
               10  EMP-REC           PIC XXX.
               10  VAR2              PIC X VALUE "\".
               10  ARQ-REC           PIC X(7).
           05  EMPRESA-REF REDEFINES EMP-REFERENCIA PIC X(12).
           05  DATA-MOVTO-W          PIC 9(8)     VALUE ZEROS.
           05  DATA-MOVTO-I          PIC 9(8)     VALUE ZEROS.
           05  CLIENTE-E             PIC ZZZZ.ZZZZ VALUE ZEROS.
           05  SEQ-E                 PIC ZZZZZ    VALUE ZEROS.
           05  DATA-E                PIC 99/99/9999.

           05  CUSTO-PREVISTO-W      PIC 9(8)V99  VALUE ZEROS.
           05  INICIAL-PROCURADA     PIC X(6)     VALUE SPACES.
           05  INICIAL-A-COMPARAR    PIC X(6)     VALUE SPACES.
           05  LETRA                 PIC X        VALUE SPACES.
           05  LETRA1                PIC X        VALUE SPACES.
           05  SAIR-W                PIC 9        VALUE ZEROS.
      *    variáveis p/ listar os nomes com iniciais solicitadas

           05  VALOR-E               PIC ZZZ.ZZZ,ZZ.
           05  VALOR-E1              PIC ZZ.ZZZ.ZZZ,ZZ.
           05  I                     PIC 99       VALUE ZEROS.
           05  L                     PIC 99       VALUE ZEROS.
           05  K                     PIC 99       VALUE ZEROS.
           05  J                     PIC 99       VALUE ZEROS.
           05  VLR-PARCELA           PIC 9(8)V99  VALUE ZEROS.
           05  DATA-DIA-I            PIC 9(8)     VALUE ZEROS.
           05  CLASSIF-W             PIC 9        VALUE ZEROS.
           05  COL1                  PIC 9(3)     VALUE ZEROS.
           05  ANOTACAO-W            PIC X(80)    VALUE SPACES.
           05  ULT-SEQ               PIC 9(3)     VALUE ZEROS.
           05  LIN                   PIC 9(02)    VALUE ZEROS.
           05  AUX-ALBUM             PIC 9(08)    VALUE ZEROS.

           COPY "PARAMETR".

       01  LINDET.
           05  LINDET-REL          PIC X(130)  VALUE SPACES.

       01  CAB04.
           05  FILLER              PIC X(130)  VALUE
           "CONTRATO    ITEM    CURSO    TURMA".


       PROCEDURE DIVISION.
       MAIN-PROCESS SECTION.
           MOVE ZEROS TO PAG-W ERRO-W.
           OPEN INPUT CONTROLE
           READ CONTROLE
           MOVE EMPRESA            TO EMP-REC
           MOVE "CGD011" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD011
           MOVE "CGD911" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD911
           OPEN I-O   CGD011
           CLOSE      CGD011
           OPEN I-O   CGD011
           OPEN INPUT CGD911

           CLOSE CONTROLE.
           IF ST-CGD011 = "35"
              CLOSE CGD011      OPEN OUTPUT CGD011
              CLOSE CGD011      OPEN I-O CGD011
           END-IF.

           display "Vou comecar a atualizar o CGD011"
           stop " ".

           IF ST-CGD011 <> "00" OR ST-CGD911 <> "00"
              CLOSE CGD011
                    CGD911
              stop run.


           INITIALIZE REG-CGD911

           START CGD911 KEY IS NOT LESS COD-COMPL-CG91 INVALID KEY
                 MOVE "10" TO ST-CGD911.


           PERFORM UNTIL ST-CGD911 = "10"
             READ CGD911 NEXT RECORD AT END
                  MOVE "10" TO ST-CGD911
             NOT AT END
                  MOVE REG-CGD911         TO REG-CGD011
                  DISPLAY REG-CGD011
                  WRITE REG-CGD011
              END-READ
           END-PERFORM.

           DISPLAY "ACABOU" STOP "  ".
           DISPLAY "ACABOU" STOP "  ".
           DISPLAY "ACABOU" STOP "  ".

           CLOSE CGD911
           CLOSE CGD011
           EXIT PROGRAM
           STOP RUN.
