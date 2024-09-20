---
title: >-
  Operation of the Dialog System Control Block for Initializing Errors and
  Managing Control Flows
---
This document will cover how the Dialog System Control Block operates in terms of initializing errors and managing control flows. We'll cover:

1. Initializing errors using the Dialog System Control Block
2. Managing control flows using the Dialog System Control Block

<SwmSnippet path="/src/acp/acp100.cbl" line="259">

---

# Initializing errors using the Dialog System Control Block

The <SwmToken path="src/acp/acp100.cbl" pos="259:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes various components, including the Dialog System Control Block. This section accepts parameters from the command line, initializes data blocks, and sets up paths for various files. The <SwmToken path="src/acp/acp100.cbl" pos="266:1:7" line-data="           INITIALIZE DS-CONTROL-BLOCK">`INITIALIZE DS-CONTROL-BLOCK`</SwmToken> statement is crucial as it prepares the Dialog System Control Block for subsequent operations.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
      *    COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W
           CALL "GRIDAT2"  USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           INITIALIZE DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE DATA-BLOCK-VERSION-NO TO DS-DATA-BLOCK-VERSION-NO.
           MOVE VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC

           MOVE "ACD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD010.
           MOVE "ACD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD020.
           MOVE "ACD030" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD030.
           MOVE "ACD100" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD100.
           MOVE "ACD101" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD101.
           MOVE "ACD102" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD102.
           MOVE "ACD103" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD103.
           MOVE "ACD104" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD104.
           MOVE "ACD105" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-ACD105.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop106.cbl" line="238">

---

Similar to <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath>, the <SwmToken path="src/cop/cop106.cbl" pos="238:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section in <SwmPath>[src/cop/cop106.cbl](src/cop/cop106.cbl)</SwmPath> initializes the Dialog System Control Block. It also sets up paths for various files and initializes data blocks. The <SwmToken path="src/cop/cop106.cbl" pos="246:1:7" line-data="           INITIALIZE DS-CONTROL-BLOCK">`INITIALIZE DS-CONTROL-BLOCK`</SwmToken> statement ensures that the Dialog System Control Block is ready for use.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CGD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CAD004"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD004.
           MOVE "CAD010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.
           MOVE "CAD012"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD012.
           MOVE "IED010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-IED010.
           MOVE "IED011"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-IED011.
           MOVE "COD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD001.
```

---

</SwmSnippet>

<SwmSnippet path="/src/lbp/lbp207.cbl" line="140">

---

In <SwmPath>[src/lbp/lbp207.cbl](src/lbp/lbp207.cbl)</SwmPath>, the <SwmToken path="src/lbp/lbp207.cbl" pos="140:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the Dialog System Control Block and other data blocks. It also sets up paths for various files and handles error messages if file openings fail. The <SwmToken path="src/lbp/lbp207.cbl" pos="148:1:7" line-data="           INITIALIZE DS-CONTROL-BLOCK">`INITIALIZE DS-CONTROL-BLOCK`</SwmToken> statement is used to prepare the Dialog System Control Block.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CGD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "LBD021"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-LBD021.
           MOVE "LBD100"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-LBD100.
           OPEN INPUT CGD001 LBD021 LBD100.
           IF ST-CGD001 <> "00"
              MOVE "ERRO ABERTURA CGD001: "  TO GS-MENSAGEM-ERRO
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp100.cbl" line="450">

---

# Managing control flows using the Dialog System Control Block

The <SwmToken path="src/acp/acp100.cbl" pos="450:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section in <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath> manages control flows by evaluating conditions and performing corresponding sections. For example, it performs the <SwmToken path="src/acp/acp100.cbl" pos="453:3:3" line-data="                   PERFORM CENTRALIZAR">`CENTRALIZAR`</SwmToken> section if <SwmToken path="src/acp/acp100.cbl" pos="452:3:5" line-data="               WHEN CENTRALIZA-TRUE">`CENTRALIZA-TRUE`</SwmToken> is true. This section ensures that the program flow is managed based on various conditions.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN CARREGA-ULT-TRUE
                    PERFORM CARREGA-ULT-SEQ
                    PERFORM LIMPAR-TODAS-LB
               WHEN LE-ATENDIMENTO-TRUE
                    PERFORM LER-ATENDIMENTOS
               WHEN CHAMA-POP-UP-AT-TRUE
                    PERFORM CHAMA-POP-ATENDIMENTO
               WHEN VALIDA-TRUE
                    PERFORM VALIDAR-CAMPOS
               WHEN LE-CLIENTE-TRUE
                    PERFORM LER-CLIENTE
               WHEN CHAMA-POP-UP-CLI-TRUE
                    PERFORM CHAMA-POP-CLIENTE
               WHEN LE-CIDADE-TRUE
                    PERFORM LER-CIDADE
               WHEN CHAMA-POP-UP-CID-TRUE
                    PERFORM CHAMA-POP-CIDADE
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop106.cbl" line="327">

---

In <SwmPath>[src/cop/cop106.cbl](src/cop/cop106.cbl)</SwmPath>, the <SwmToken path="src/cop/cop106.cbl" pos="327:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section evaluates conditions and performs corresponding sections. It handles tasks like centralizing, verifying passwords, and printing reports. This section ensures that the program flow is managed based on various conditions.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
                    PERFORM VERIFICAR-SENHA-STATUS
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    PERFORM GRAVA-WORK
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-CHAMAR-POP-UP-TRUE
                    PERFORM CHAMAR-POPUP
               WHEN GS-LE-DESCRICAO-TRUE
                    PERFORM LE-DESCRICAO
```

---

</SwmSnippet>

<SwmSnippet path="/src/lbp/lbp207.cbl" line="176">

---

The <SwmToken path="src/lbp/lbp207.cbl" pos="176:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section in <SwmPath>[src/lbp/lbp207.cbl](src/lbp/lbp207.cbl)</SwmPath> evaluates conditions and performs corresponding sections. It handles tasks like centralizing, printing reports, and managing work files. This section ensures that the program flow is managed based on various conditions.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    PERFORM GRAVA-WORK
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
      *        WHEN GS-CARREGA-LISTA-FLG-TRUE
      *             PERFORM ZERA-VARIAVEIS
      *             PERFORM CARREGA-LISTA
           END-EVALUATE
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp100.cbl" line="2483">

---

The <SwmToken path="src/acp/acp100.cbl" pos="2483:1:5" line-data="       CALL-DIALOG-SYSTEM SECTION.">`CALL-DIALOG-SYSTEM`</SwmToken> section in <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath> is responsible for invoking the Dialog System using the control block. This section ensures that the Dialog System is called correctly, and any errors are handled appropriately.

```cobol
       CALL-DIALOG-SYSTEM SECTION.
           CALL "DSRUN" USING DS-CONTROL-BLOCK, DATA-BLOCK.
           IF NOT DS-NO-ERROR
              MOVE DS-ERROR-CODE TO DISPLAY-ERROR-NO
              DISPLAY "DS ERROR NO:  " DISPLAY-ERROR-NO
              GO FINALIZAR-PROGRAMA
           END-IF.
       FINALIZAR-PROGRAMA SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop106.cbl" line="1668">

---

In <SwmPath>[src/cop/cop106.cbl](src/cop/cop106.cbl)</SwmPath>, the <SwmToken path="src/cop/cop106.cbl" pos="1668:1:5" line-data="       CALL-DIALOG-SYSTEM SECTION.">`CALL-DIALOG-SYSTEM`</SwmToken> section calls the Dialog System using the control block. It checks for errors and handles them if necessary. This section ensures that the Dialog System is invoked correctly.

```cobol
       CALL-DIALOG-SYSTEM SECTION.
           CALL "DSRUN" USING DS-CONTROL-BLOCK, GS-DATA-BLOCK.
           IF NOT DS-NO-ERROR
```

---

</SwmSnippet>

<SwmSnippet path="/src/lbp/lbp207.cbl" line="401">

---

The <SwmToken path="src/lbp/lbp207.cbl" pos="401:1:5" line-data="       CALL-DIALOG-SYSTEM SECTION.">`CALL-DIALOG-SYSTEM`</SwmToken> section in <SwmPath>[src/lbp/lbp207.cbl](src/lbp/lbp207.cbl)</SwmPath> calls the Dialog System using the control block. It checks for errors and handles them if necessary. This section ensures that the Dialog System is invoked correctly.

```cobol
       CALL-DIALOG-SYSTEM SECTION.
           CALL "DSRUN" USING DS-CONTROL-BLOCK, GS-DATA-BLOCK.
           IF NOT DS-NO-ERROR
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
