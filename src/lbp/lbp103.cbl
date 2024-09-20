       COPY DSLANG.CPY.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LBP103.
       AUTHOR. MARELI AMANCIO VOLPATO.
       DATE-WRITTEN. 29/05/2000.
      *FUNÇÃO: Movimento de Ampliação de Fotografia

       ENVIRONMENT DIVISION.
       class-control.
           Window             is class "wclass".
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CGPX001.
           COPY LBPX023.
           COPY LBPX026.
           COPY LBPX027.
           COPY LBPX029.
           COPY LBPX103.

           SELECT RELAT ASSIGN TO PRINTER NOME-IMPRESSORA.

       DATA DIVISION.
       FILE SECTION.
       COPY CGPW001.
       COPY LBPW023.
       COPY LBPW026.
       COPY LBPW027.
       COPY LBPW029.
       COPY LBPW103.
       FD  RELAT
           LABEL RECORD IS OMITTED.
       01  REG-RELAT.
           05  FILLER              PIC X(130).
       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "LBP103.CPB".
           COPY "LBP103.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBDATA.CPY".
           COPY "CBPRINT.CPY".
           COPY "CPADAY1.CPY".
           COPY "CPTIME.CPY".
           COPY "CPDCIC.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  PASSAR-PARAMETROS.
           05  PASSAR-STRING-1       PIC X(60).
       01  VARIAVEIS.
           05  ST-CGD001             PIC XX       VALUE SPACES.
           05  ST-LBD023             PIC XX       VALUE SPACES.
           05  ST-LBD026             PIC XX       VALUE SPACES.
           05  ST-LBD027             PIC XX       VALUE SPACES.
           05  ST-LBD029             PIC XX       VALUE SPACES.
           05  ST-LBD103             PIC XX       VALUE SPACES.
           05  ERRO-W                PIC 9        VALUE ZEROS.
      *    ERRO-W - flag que controla se houve erro de abertura arquivo
           05  ULT-SEQ               PIC 9(3)     VALUE ZEROS.
           05  HORA-W                PIC 9(8)     VALUE ZEROS.
           05  LIN                   PIC 9(2)     VALUE ZEROS.
           05  PAG-W                 PIC 9(2)     VALUE ZEROS.
           05  EMP-REFERENCIA.
               10  FILLER            PIC X(15)
                   VALUE "\PROGRAMA\KELLO".
               10  VAR1              PIC X VALUE "\".
               10  EMP-REC           PIC XXX.
               10  VAR2              PIC X VALUE "\".
               10  ARQ-REC           PIC X(10).
           05  EMPRESA-REF REDEFINES EMP-REFERENCIA PIC X(30).
           05  DATA-MOVTO-W          PIC 9(8)     VALUE ZEROS.
           05  DATA-MOVTO-I          PIC 9(8)     VALUE ZEROS.
           05  QTDE-E                PIC ZZZ,ZZZ  BLANK WHEN ZEROS.
           05  DATA-DIA-I            PIC 9(8)     VALUE ZEROS.
           COPY "PARAMETR".

       77 janelaPrincipal              object reference.
       77 handle8                      pic 9(08) comp-x value zeros.
       77 wHandle                      pic 9(09) comp-5 value zeros.

       01  CAB01.
           05  EMPRESA-REL         PIC X(90)   VALUE SPACES.
           05  FILLER              PIC X(13)   VALUE SPACES.
           05  FILLER              PIC X(5)    VALUE "PAG: ".
           05  PAG-REL             PIC Z9      VALUE ZEROS.
       01  CAB02.
           05  FILLER              PIC X(69)   VALUE
           "CONFERENCIA-MOVTO DE AMPLIACAO DE FOTOGRAFIA".
           05  FILLER              PIC X(07)   VALUE "MOVTO: ".
           05  DATA-MOVTO-REL      PIC 99/99/9999 VALUE ZEROS.
           05  FILLER              PIC X(07)   VALUE SPACES.
           05  HORA-REL            PIC X(5)    VALUE "  :  ".
           05  FILLER              PIC XX      VALUE SPACES.
           05  EMISSAO-REL         PIC 99/99/9999 BLANK WHEN ZEROS.
       01  CAB03.
           05  FILLER              PIC X(110)  VALUE ALL "=".
       01  CAB04.
           05  FILLER              PIC X(110)  VALUE
           "SEQ FUNCIO-NOME       TURNO     IMPRESSORA QT-RO QT-FO TP-FO
      -    "TO    HR-INI HR-FIM INTERRUP TP-INTERRUPÇ INTERV".

       01  LINDET.
           05  LINDET-REL          PIC X(110)   VALUE SPACES.
       LINKAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W DATA-MOVTO-REL.
           CALL "GRIDAT2"  USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO TO DS-DATA-BLOCK-VERSION-NO.
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CGD001" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "LBD023" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-LBD023.
           MOVE "LBD026" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-LBD026.
           MOVE "LBD027" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-LBD027.
           MOVE "LBD029" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-LBD029.
           MOVE "LBD103" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-LBD103.
           OPEN I-O LBD103.
           OPEN INPUT CGD001 LBD023 LBD026 LBD027 LBD029.
           IF ST-LBD103 = "35"
              CLOSE LBD103      OPEN OUTPUT LBD103
              CLOSE LBD103      OPEN I-O LBD103
           END-IF.
           IF ST-CGD001 <> "00"
              MOVE "ERRO ABERTURA CGD001: "  TO GS-MENSAGEM-ERRO
              MOVE ST-CGD001 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-LBD023 <> "00"
              MOVE "ERRO ABERTURA LBD023: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD023 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-LBD026 <> "00"
              MOVE "ERRO ABERTURA LBD026: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD026 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-LBD027 <> "00"
              MOVE "ERRO ABERTURA LBD027: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD027 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-LBD029 <> "00"
              MOVE "ERRO ABERTURA LBD029: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD029 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-LBD103 <> "00"
              MOVE "ERRO ABERTURA LBD103: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD103 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF COD-USUARIO-W NOT NUMERIC
              MOVE "Executar pelo MENU" TO GS-MENSAGEM-ERRO
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ERRO-W = 0 PERFORM LOAD-SCREENSET.

       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   PERFORM SALVAR-DADOS
                   IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS
                   ELSE PERFORM GRAVA-DADOS
                   END-IF
                   PERFORM LIMPAR-DADOS
               WHEN GS-EXCLUI-FLG-TRUE
                   PERFORM EXCLUI
                   PERFORM LIMPAR-DADOS
               WHEN GS-CLR-FLG-TRUE
                   PERFORM LIMPAR-DADOS
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
               WHEN GS-CARREGA-ULT-TRUE
                   PERFORM CARREGA-ULTIMOS
               WHEN GS-CARREGA-LIST-BOX-TRUE
                   MOVE DATA-MOVTO-I     TO DATA-MOVTO-L103
                   MOVE GS-LINDET(1: 3)  TO SEQ-L103
                   PERFORM CARREGAR-DADOS
               WHEN GS-LE-TURNO-TRUE
                   PERFORM LE-TURNO
               WHEN GS-LE-INTERRUPCAO-TRUE
                   PERFORM LE-INTERRUPCAO
               WHEN GS-LE-TIPO-FOTO-TRUE
                   PERFORM LE-TIPO-FOTO
               WHEN GS-LE-FUNCIONARIO-TRUE
                   PERFORM LE-FUNCIONARIO
               WHEN GS-LE-IMPRESSORA-TRUE
                   PERFORM LE-IMPRESSORA
               WHEN GS-CHAMAR-POP-UP-TRUE
                   PERFORM CHAMAR-POP-UP
           END-EVALUATE.
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.

       CENTRALIZAR SECTION.
          move-object-handle principal handle8
          move handle8 to wHandle
          invoke Window "fromHandleWithClass" using wHandle Window
                 returning janelaPrincipal

          invoke janelaPrincipal "CentralizarNoDesktop".

       CHAMAR-POP-UP SECTION.
           EVALUATE GS-OPCAO-POP-UP
             WHEN 1 CALL   "CGP001T" USING PARAMETROS-W PASSAR-STRING-1
                    CANCEL "CGP001T"
                    MOVE PASSAR-STRING-1(1: 30) TO GS-NOME-FUNCIONARIO
                    MOVE PASSAR-STRING-1(33: 6) TO GS-FUNCIONARIO
             WHEN 2 CALL   "LBP023T" USING PARAMETROS-W PASSAR-STRING-1
                    CANCEL "LBP023T"
                    MOVE PASSAR-STRING-1(1: 15) TO GS-DESC-TURNO
                    MOVE PASSAR-STRING-1(33: 1) TO GS-TURNO
             WHEN 3 CALL   "LBP026T" USING PARAMETROS-W PASSAR-STRING-1
                    CANCEL "LBP026T"
                    MOVE PASSAR-STRING-1(1: 30) TO GS-DESC-IMPRESSORA
                    MOVE PASSAR-STRING-1(33: 2) TO GS-IMPRESSORA
             WHEN 4 CALL   "LBP027T" USING PARAMETROS-W PASSAR-STRING-1
                    CANCEL "LBP027T"
                    MOVE PASSAR-STRING-1(1: 30) TO GS-DESC-TP-FOTO
                    MOVE PASSAR-STRING-1(33: 2) TO GS-TIPO-FOTO
             WHEN 5 CALL   "LBP029T" USING PARAMETROS-W PASSAR-STRING-1
                    CANCEL "LBP029T"
                    MOVE PASSAR-STRING-1(1: 20) TO GS-NOME-INTERRUPCAO
                    MOVE PASSAR-STRING-1(33: 2) TO GS-TIPO-INTERRUPCAO
           END-EVALUATE.
      *----------------------------------------------------------------
       LE-FUNCIONARIO SECTION.
           MOVE GS-FUNCIONARIO       TO CODIGO-CG01.
           READ CGD001 INVALID KEY MOVE SPACES TO NOME-CG01.
           MOVE NOME-CG01          TO GS-NOME-FUNCIONARIO.
       LE-TURNO SECTION.
           MOVE GS-TURNO           TO CODIGO-LB23.
           READ LBD023 INVALID KEY MOVE SPACES TO DESCRICAO-LB23.
           MOVE DESCRICAO-LB23     TO GS-DESC-TURNO.
       LE-INTERRUPCAO SECTION.
           MOVE GS-TIPO-INTERRUPCAO TO CODIGO-LB29.
           READ LBD029 INVALID KEY  MOVE SPACES TO DESCRICAO-LB29.
           MOVE DESCRICAO-LB29      TO GS-NOME-INTERRUPCAO.
       LE-TIPO-FOTO SECTION.
           MOVE GS-TIPO-FOTO       TO CODIGO-LB27.
           READ LBD027 INVALID KEY MOVE SPACES TO DESCRICAO-LB27.
           MOVE DESCRICAO-LB27     TO GS-DESC-TP-FOTO.
       LE-IMPRESSORA SECTION.
           MOVE GS-IMPRESSORA      TO CODIGO-LB26.
           READ LBD026 INVALID KEY MOVE SPACES TO DESCRICAO-LB26.
           MOVE DESCRICAO-LB26     TO GS-DESC-IMPRESSORA.
      *--------------------------------------------------------------
       CARREGAR-DADOS SECTION.
           START LBD103 KEY IS = CHAVE-L103 INVALID KEY CONTINUE.
           READ LBD103 INVALID KEY INITIALIZE REG-LBD103.
           MOVE DATA-MOVTO-W         TO  GS-DATA-MOVTO
           MOVE SEQ-L103             TO  GS-SEQ
           MOVE TURNO-L103           TO  GS-TURNO CODIGO-LB23.
           READ LBD023 INVALID KEY MOVE SPACES TO DESCRICAO-LB23.
           MOVE DESCRICAO-LB23       TO  GS-DESC-TURNO.
           MOVE TIPO-INTERR-L103     TO  GS-TIPO-INTERRUPCAO
                                         CODIGO-LB29.
           READ LBD029 INVALID KEY MOVE SPACES TO DESCRICAO-LB29.
           MOVE DESCRICAO-LB29       TO  GS-NOME-INTERRUPCAO.
           MOVE FUNCIONARIO-L103     TO  GS-FUNCIONARIO CODIGO-CG01.
           READ CGD001 INVALID KEY MOVE "*****" TO NOME-CG01.
           MOVE NOME-CG01            TO  GS-NOME-FUNCIONARIO.
           MOVE IMPRESSORA-L103      TO  GS-IMPRESSORA CODIGO-LB26
           READ LBD026 INVALID KEY MOVE SPACES TO DESCRICAO-LB26.
           MOVE DESCRICAO-LB26       TO  GS-DESC-IMPRESSORA.
           MOVE QTDE-ROLOS-L103      TO  GS-QTDE-ROLO
           MOVE QTDE-FOTOS-L103      TO  GS-QTDE-FOTO
           MOVE TIPO-FOTO-L103       TO  GS-TIPO-FOTO CODIGO-LB27
           READ LBD027 INVALID KEY MOVE SPACES TO DESCRICAO-LB27.
           MOVE DESCRICAO-LB27       TO  GS-DESC-TP-FOTO.
           MOVE HORA-INIC-L103       TO  GS-HORA-INI
           MOVE HORA-FIM-L103        TO  GS-HORA-FIM
           MOVE TEMPO-INTERRUPC-L103 TO  GS-TEMPO-INTERRUP
           MOVE TEMPO-INTERVALO-L103 TO  GS-TEMPO-INTERVALO.
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
       LIMPAR-DADOS SECTION.
           INITIALIZE REG-LBD103
           INITIALIZE GS-DATA-BLOCK
           MOVE ULT-SEQ TO GS-SEQ
           MOVE DATA-MOVTO-W TO GS-DATA-MOVTO.
           PERFORM SET-UP-FOR-REFRESH-SCREEN.
           PERFORM CALL-DIALOG-SYSTEM.

       EXCLUI SECTION.
           DELETE LBD103.
           PERFORM LIMPAR-DADOS.
      *    PERFORM CARREGA-ULTIMOS.

       SALVAR-DADOS SECTION.
           MOVE DATA-MOVTO-I           TO DATA-MOVTO-L103
           MOVE GS-SEQ                 TO SEQ-L103
           MOVE GS-TIPO-INTERRUPCAO    TO TIPO-INTERR-L103.
           MOVE GS-TURNO               TO TURNO-L103
           MOVE GS-FUNCIONARIO         TO FUNCIONARIO-L103.
           MOVE GS-QTDE-ROLO           TO QTDE-ROLOS-L103.
           MOVE GS-QTDE-FOTO           TO QTDE-FOTOS-L103
           MOVE GS-TIPO-FOTO           TO TIPO-FOTO-L103.
           MOVE GS-IMPRESSORA          TO IMPRESSORA-L103.
           MOVE GS-HORA-INI            TO HORA-INIC-L103
           MOVE GS-HORA-FIM            TO HORA-FIM-L103.
           MOVE GS-TEMPO-INTERRUP      TO TEMPO-INTERRUPC-L103
           MOVE GS-TEMPO-INTERVALO     TO TEMPO-INTERVALO-L103.
           MOVE USUARIO-W              TO DIGITADOR-L103.
       GRAVA-DADOS SECTION.
           MOVE ZEROS TO ST-LBD103.
           PERFORM UNTIL ST-LBD103 = "10"
             WRITE REG-LBD103 INVALID KEY
                 ADD 1 TO SEQ-L103
               NOT INVALID KEY
                 MOVE "10" TO ST-LBD103.
           PERFORM MOVER-DADOS-LISTA.
           ADD 1 TO ULT-SEQ.
           MOVE "INSERE-LIST" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
       REGRAVA-DADOS SECTION.
           REWRITE REG-LBD103 INVALID KEY
                 MOVE "Erro Regravacao LBD103" TO GS-MENSAGEM-ERRO
                 MOVE ST-LBD103 TO GS-MENSAGEM-ERRO(24: 5)
                 MOVE "ERRO-GRAVACAO" TO DS-PROCEDURE
                 PERFORM CALL-DIALOG-SYSTEM.
           PERFORM MOVER-DADOS-LISTA.
           MOVE "ATUALIZA-LISTA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
       ERRO-GRAVACAO SECTION.
           MOVE "ERRO GRAVAÇÃO" TO GS-MENSAGEM-ERRO
           PERFORM LOAD-SCREENSET
           PERFORM CARREGA-MENSAGEM-ERRO.
       CARREGA-ULTIMOS SECTION.
           MOVE "CLEAR-LIST-BOX" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM
           MOVE GS-DATA-MOVTO   TO DATA-MOVTO-W DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV        TO DATA-MOVTO-I DATA-MOVTO-L103.
           MOVE ZEROS           TO SEQ-L103 GS-SEQ.
           START LBD103 KEY IS NOT < CHAVE-L103
                    INVALID KEY MOVE "10" TO ST-LBD103.
           MOVE SPACES TO GS-LINDET.
           PERFORM UNTIL ST-LBD103 = "10"
              READ LBD103 NEXT RECORD AT END MOVE "10" TO ST-LBD103
              NOT AT END
                IF DATA-MOVTO-L103 <> DATA-MOVTO-I
                   MOVE "10" TO ST-LBD103
                ELSE
                   PERFORM MOVER-DADOS-LISTA
                   MOVE SEQ-L103      TO GS-SEQ
                   MOVE "INSERE-LIST" TO DS-PROCEDURE
                   PERFORM CALL-DIALOG-SYSTEM
                END-IF
              END-READ
           END-PERFORM.
           ADD 1 TO GS-SEQ.
           MOVE GS-SEQ TO ULT-SEQ.
       MOVER-DADOS-LISTA SECTION.
           MOVE SPACES             TO GS-LINDET
           MOVE SEQ-L103           TO GS-LINDET(1: 4)
           MOVE FUNCIONARIO-L103   TO GS-LINDET(5: 07) CODIGO-CG01
           READ CGD001 INVALID KEY MOVE SPACES TO NOME-CG01.
           MOVE NOME-CG01          TO GS-LINDET(12: 10)

           MOVE TURNO-L103         TO GS-LINDET(23: 2) CODIGO-LB23
           READ LBD023 INVALID KEY MOVE SPACES TO DESCRICAO-LB23.
           MOVE DESCRICAO-LB23     TO GS-LINDET(25: 8)
           MOVE IMPRESSORA-L103    TO GS-LINDET(33: 3) CODIGO-LB26
           READ LBD026 INVALID KEY MOVE SPACES TO DESCRICAO-LB26.
           MOVE DESCRICAO-LB26     TO GS-LINDET(36: 7)
           MOVE QTDE-ROLOS-L103    TO QTDE-E
           MOVE QTDE-E             TO GS-LINDET(44: 8)
           MOVE QTDE-FOTOS-L103    TO GS-LINDET(52: 6)
           MOVE TIPO-FOTO-L103     TO GS-LINDET(58: 3) CODIGO-LB27
           READ LBD027 INVALID KEY MOVE SPACES TO DESCRICAO-LB27.
           MOVE DESCRICAO-LB27     TO GS-LINDET(61: 7).
           MOVE HORA-INIC-L103     TO GS-LINDET(69: 7)
           MOVE HORA-FIM-L103      TO GS-LINDET(76: 7)
           MOVE TEMPO-INTERRUPC-L103  TO GS-LINDET(83: 9)
           MOVE TIPO-INTERR-L103   TO GS-LINDET(92: 3) CODIGO-LB29.
           READ LBD029 INVALID KEY MOVE SPACES TO DESCRICAO-LB29.
           MOVE DESCRICAO-LB29     TO GS-LINDET(95: 9)
           MOVE TEMPO-INTERVALO-L103 TO GS-LINDET(105: 5).
      *-------------------------------------------------------------
       CLEAR-FLAGS SECTION.
           INITIALIZE GS-FLAG-GROUP.

       SET-UP-FOR-REFRESH-SCREEN SECTION.
           MOVE "REFRESH-DATA" TO DS-PROCEDURE.

       LOAD-SCREENSET SECTION.
           MOVE DS-PUSH-SET TO DS-CONTROL
           MOVE "LBP103" TO DS-SET-NAME
           PERFORM CALL-DIALOG-SYSTEM.
      *-----------------------------------------------------------
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO PAG-W.

           COPY CONDENSA.

           MOVE DATA-MOVTO-I   TO DATA-MOVTO-L103.
           MOVE ZEROS          TO SEQ-L103.
           START LBD103 KEY IS NOT < CHAVE-L103 INVALID KEY
                 MOVE "10" TO ST-LBD103.
           MOVE ZEROS TO LIN. PERFORM CABECALHO.
           PERFORM UNTIL ST-LBD103 = "10"
             READ LBD103 NEXT RECORD AT END MOVE "10" TO ST-LBD103
              NOT AT END
                IF DATA-MOVTO-L103 <> DATA-MOVTO-I
                         MOVE "10" TO ST-LBD103
                ELSE
                  PERFORM MOVER-DADOS-REL
                  WRITE REG-RELAT FROM LINDET
                  ADD 1 TO LIN
                  IF LIN > 56 PERFORM CABECALHO
                  END-IF
                END-IF
             END-READ
           END-PERFORM.

           COPY DESCONDENSA.

       MOVER-DADOS-REL SECTION.
           MOVE SPACES             TO LINDET-REL
           MOVE SEQ-L103           TO LINDET-REL(1: 4)
           MOVE FUNCIONARIO-L103   TO LINDET-REL(5: 07) CODIGO-CG01
           READ CGD001 INVALID KEY MOVE SPACES TO NOME-CG01.
           MOVE NOME-CG01          TO LINDET-REL(12: 10)

           MOVE TURNO-L103         TO LINDET-REL(23: 2) CODIGO-LB23
           READ LBD023 INVALID KEY MOVE SPACES TO DESCRICAO-LB23.
           MOVE DESCRICAO-LB23     TO LINDET-REL(25: 8)
           MOVE IMPRESSORA-L103    TO LINDET-REL(33: 3) CODIGO-LB26
           READ LBD026 INVALID KEY MOVE SPACES TO DESCRICAO-LB26.
           MOVE DESCRICAO-LB26     TO LINDET-REL(36: 7)
           MOVE QTDE-ROLOS-L103    TO QTDE-E
           MOVE QTDE-E             TO LINDET-REL(44: 8)
           MOVE QTDE-FOTOS-L103    TO LINDET-REL(52: 6)
           MOVE TIPO-FOTO-L103     TO LINDET-REL(58: 3) CODIGO-LB27
           READ LBD027 INVALID KEY MOVE SPACES TO DESCRICAO-LB27.
           MOVE DESCRICAO-LB27     TO LINDET-REL(61: 7).
           MOVE HORA-INIC-L103     TO LINDET-REL(69: 7)
           MOVE HORA-FIM-L103      TO LINDET-REL(76: 7)
           MOVE TEMPO-INTERRUPC-L103  TO LINDET-REL(83: 9)
           MOVE TIPO-INTERR-L103   TO LINDET-REL(92: 3) CODIGO-LB29.
           READ LBD029 INVALID KEY MOVE SPACES TO DESCRICAO-LB29.
           MOVE DESCRICAO-LB29     TO LINDET-REL(95: 9)
           MOVE TEMPO-INTERVALO-L103 TO LINDET-REL(105: 5).

       CABECALHO SECTION.
           MOVE DATA-MOVTO-W    TO DATA-MOVTO-REL.
           ADD 1 TO PAG-W.  MOVE PAG-W TO PAG-REL.
           IF PAG-W = 1
              WRITE REG-RELAT FROM CAB01
           ELSE WRITE REG-RELAT FROM CAB01 AFTER PAGE.
           WRITE REG-RELAT FROM CAB02 AFTER 2.
           WRITE REG-RELAT FROM CAB03.
           WRITE REG-RELAT FROM CAB04.
           WRITE REG-RELAT FROM CAB03.
           MOVE 4 TO LIN.

       CALL-DIALOG-SYSTEM SECTION.
           CALL "DSRUN" USING DS-CONTROL-BLOCK, GS-DATA-BLOCK.
           IF NOT DS-NO-ERROR
              MOVE DS-ERROR-CODE TO DISPLAY-ERROR-NO
              DISPLAY "DS ERROR NO:  " DISPLAY-ERROR-NO
              GO FINALIZAR-PROGRAMA
           END-IF.
       FINALIZAR-PROGRAMA SECTION.
           CLOSE CGD001 LBD023 LBD026 LBD027 LBD029 LBD103.
           MOVE DS-QUIT-SET TO DS-CONTROL.
           PERFORM CALL-DIALOG-SYSTEM.
           EXIT PROGRAM.
