---
title: EDI Transactions in Cooperative Operations
---
This document will cover the EDI transactions managed by the module, specifically focusing on the <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> function. We'll cover:

1. Overview of EDI transactions in <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken>
2. Key sections and their roles in managing EDI transactions
3. Error handling in EDI transactions

# Overview of EDI transactions in <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken>

The <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> function is a core component in managing EDI transactions within the Kello Imagens system. It handles various tasks such as initializing the program, processing the main logic, and finalizing the program. The function is defined in <SwmPath>[src/rep/rep132.cbl](src/rep/rep132.cbl)</SwmPath> and <SwmPath>[src/kello/rep132.cbl](src/kello/rep132.cbl)</SwmPath>.

<SwmSnippet path="/src/rep/rep132.cbl" line="118">

---

# Key sections and their roles in managing EDI transactions

The <SwmToken path="src/rep/rep132.cbl" pos="118:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> section is the entry point of the <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> function. It initializes the program and processes the main logic until the exit flag is set.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="123">

---

The <SwmToken path="src/rep/rep132.cbl" pos="123:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes various parameters and opens the necessary files for EDI transactions. It also handles error messages if any files fail to open.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV TO DATA-DIA-INV.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "IED011"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-IED011.
           MOVE "COD040"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "MTD019"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-MTD019.
           OPEN INPUT COD040 IED011 MTD019.
           IF ST-IED011 <> "00"
              MOVE "ERRO ABERTURA IED011: "  TO GS-MENSAGEM-ERRO
              MOVE ST-IED011 TO GS-MENSAGEM-ERRO(23: 02)
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="159">

---

The <SwmToken path="src/rep/rep132.cbl" pos="159:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main logic for processing EDI transactions. It evaluates different conditions and performs corresponding actions such as centralizing data, printing reports, and loading lists.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
               WHEN GS-PRINTER-FLG-TRUE
                    PERFORM IMPRIME-RELATORIO
               WHEN GS-LE-CONTRATO-TRUE
                    PERFORM LE-CONTRATO
               WHEN GS-POPUP-CONTRATO-TRUE
                    PERFORM CHAMA-POPUP-CONTRATO
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM CARREGA-LISTA
           END-EVALUATE
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="192">

---

The <SwmToken path="src/rep/rep132.cbl" pos="192:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section is responsible for loading and displaying error messages. This is crucial for handling any issues that arise during EDI transactions.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="140">

---

# Error handling in EDI transactions

Error handling is implemented in the <SwmToken path="src/rep/rep132.cbl" pos="119:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> section. If any of the required files fail to open, an error message is generated and displayed using the <SwmToken path="src/rep/rep132.cbl" pos="144:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section.

```cobol
           OPEN INPUT COD040 IED011 MTD019.
           IF ST-IED011 <> "00"
              MOVE "ERRO ABERTURA IED011: "  TO GS-MENSAGEM-ERRO
              MOVE ST-IED011 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-COD040 <> "00"
              MOVE "ERRO ABERTURA COD040: "  TO GS-MENSAGEM-ERRO
              MOVE ST-COD040 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
