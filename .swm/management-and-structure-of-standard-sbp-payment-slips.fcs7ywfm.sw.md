---
title: Management and Structure of Standard SBP Payment Slips
---
This document will cover the structure of the standard SBP payment slips and how they are managed in the code. We'll cover:

1. The structure of the SBP payment slips
2. Initialization and data loading
3. Main processing logic
4. Data saving and error handling

# The structure of the SBP payment slips

The standard SBP payment slips in the Kello Imagens system are structured to include various fields such as company information, payment details, and transaction codes. These slips are generated and managed through COBOL programs that handle the data processing and formatting required for the slips.

<SwmSnippet path="/src/kello/lbp027t.cbl" line="59">

---

# Initialization and data loading

The <SwmToken path="src/kello/lbp027t.cbl" pos="59:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the program by setting up necessary data blocks and opening the input file <SwmToken path="src/kello/lbp027t.cbl" pos="68:4:4" line-data="           MOVE &quot;LBD027&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-LBD027.">`LBD027`</SwmToken>. It also handles error messages if the file cannot be opened.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           MOVE "00" TO STRING-1(33: 2).
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO

           MOVE EMPRESA-W          TO EMP-REC
           MOVE "LBD027"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-LBD027.

           OPEN INPUT LBD027.
           IF ST-LBD027 <> "00"
              MOVE "ERRO ABERTURA LBD027: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD027 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM LOAD-SCREENSET
              PERFORM CARREGA-MENSAGEM-ERRO
           ELSE PERFORM LOAD-SCREENSET.
```

---

</SwmSnippet>

<SwmSnippet path="/src/lbp/lbp027t.cbl" line="59">

---

Similarly, the <SwmToken path="src/lbp/lbp027t.cbl" pos="59:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section in this file performs the same initialization tasks, ensuring that the data blocks are set up and the input file is opened correctly.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           MOVE "00" TO STRING-1(33: 2).
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO

           MOVE EMPRESA-W          TO EMP-REC
           MOVE "LBD027"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-LBD027.

           OPEN INPUT LBD027.
           IF ST-LBD027 <> "00"
              MOVE "ERRO ABERTURA LBD027: "  TO GS-MENSAGEM-ERRO
              MOVE ST-LBD027 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM LOAD-SCREENSET
              PERFORM CARREGA-MENSAGEM-ERRO
           ELSE PERFORM LOAD-SCREENSET.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/lbp027t.cbl" line="78">

---

# Main processing logic

The <SwmToken path="src/kello/lbp027t.cbl" pos="78:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main processing logic. It evaluates various conditions and performs corresponding actions such as centralizing data, loading the list box, and handling item selection.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
               WHEN GS-CARREGA-LIST-BOX-TRUE
                    PERFORM CARREGA-ULTIMOS
               WHEN GS-ITEM-SELECIONADO-TRUE
                    PERFORM ITEM-SELECIONADO
           END-EVALUATE.
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/lbp/lbp027.cbl" line="120">

---

In this file, the <SwmToken path="src/lbp/lbp027.cbl" pos="120:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section includes additional actions such as saving data, clearing data, and printing reports. It uses an <SwmToken path="src/lbp/lbp027.cbl" pos="121:1:1" line-data="           EVALUATE TRUE">`EVALUATE`</SwmToken> statement to determine which actions to perform based on different flags.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   PERFORM SALVAR-DADOS
                   PERFORM CARREGA-ULTIMOS
                   PERFORM LIMPAR-DADOS
                   PERFORM INCREMENTA-CODIGO
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-LOAD-FLG-TRUE
                   PERFORM CARREGAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-EXCLUI-FLG-TRUE
                   PERFORM EXCLUI-RECORD
                   PERFORM CARREGA-ULTIMOS
                   PERFORM ACHAR-CODIGO
                   PERFORM MOSTRA-ULT-CODIGO
               WHEN GS-CLR-FLG-TRUE
                   PERFORM LIMPAR-DADOS
                   PERFORM MOSTRA-ULT-CODIGO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/lbp027.cbl" line="187">

---

# Data saving and error handling

The <SwmToken path="src/kello/lbp027.cbl" pos="187:1:3" line-data="       SALVAR-DADOS SECTION.">`SALVAR-DADOS`</SwmToken> section handles data saving. It writes or rewrites records in the <SwmToken path="src/kello/lbp027.cbl" pos="191:5:5" line-data="              WRITE REG-LBD027 INVALID KEY">`LBD027`</SwmToken> file and performs error handling if the operation fails.

```cobol
       SALVAR-DADOS SECTION.
           MOVE GS-CODIGO       TO CODIGO-LB27.
           MOVE GS-DESCRICAO    TO DESCRICAO-LB27.
           IF GRAVA-W = 1
              WRITE REG-LBD027 INVALID KEY
                   PERFORM ERRO-GRAVACAO
           ELSE REWRITE REG-LBD027 INVALID KEY
                PERFORM ERRO-GRAVACAO
               NOT INVALID KEY
                SUBTRACT 1 FROM ULT-CODIGO
           END-IF.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/lbp027.cbl" line="205">

---

The <SwmToken path="src/kello/lbp027.cbl" pos="205:1:3" line-data="       CARREGA-ULTIMOS SECTION.">`CARREGA-ULTIMOS`</SwmToken> section loads the latest records from the <SwmToken path="src/kello/lbp027.cbl" pos="210:3:3" line-data="              START LBD027 KEY IS NOT &lt; DESCRICAO-LB27">`LBD027`</SwmToken> file into a list box. It uses a loop to read records until the end of the file is reached.

```cobol
       CARREGA-ULTIMOS SECTION.
           MOVE "CLEAR-LIST-BOX" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM
           IF GS-ORDER = ZEROS
              MOVE SPACES TO DESCRICAO-LB27
              START LBD027 KEY IS NOT < DESCRICAO-LB27
                    INVALID KEY MOVE "10" TO ST-LBD027
           ELSE
             MOVE ZEROS TO CODIGO-LB27
               START LBD027 KEY IS NOT < CODIGO-LB27
                 INVALID KEY MOVE "10" TO ST-LBD027.
           MOVE SPACES TO GS-LINDET.
           MOVE ZEROS TO GS-CONT.
           PERFORM UNTIL ST-LBD027 = "10"
              READ LBD027 NEXT RECORD AT END MOVE "10" TO ST-LBD027
              NOT AT END
                ADD 1 TO GS-CONT
                MOVE SPACES TO GS-LINDET
                MOVE CODIGO-LB27          TO GS-LINDET(01: 06)
                MOVE DESCRICAO-LB27       TO GS-LINDET(07: 31)
                MOVE "INSERE-LIST" TO DS-PROCEDURE
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/lbp027.cbl" line="177">

---

The <SwmToken path="src/kello/lbp027.cbl" pos="177:1:3" line-data="       LIMPAR-DADOS SECTION.">`LIMPAR-DADOS`</SwmToken> section clears the data by initializing the record and data blocks, ensuring that the screen is refreshed with the latest data.

```cobol
       LIMPAR-DADOS SECTION.
           INITIALIZE REG-LBD027
           MOVE GS-ORDER TO ORDEM-W
           INITIALIZE GS-DATA-BLOCK
           MOVE ORDEM-W TO GS-ORDER
           PERFORM SET-UP-FOR-REFRESH-SCREEN.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
