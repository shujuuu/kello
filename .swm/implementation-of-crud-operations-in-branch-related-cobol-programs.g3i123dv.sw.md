---
title: Implementation of CRUD Operations in Branch-Related COBOL Programs
---
This document will cover how CRUD operations are implemented in branch-related COBOL programs. We'll cover:

1. Overview of CRUD operations in COBOL
2. Detailed implementation in the <SwmPath>[src/kello/crp055.cbl](src/kello/crp055.cbl)</SwmPath> file
3. Key sections and functions involved

# Overview of CRUD operations in COBOL

CRUD operations (Create, Read, Update, Delete) are fundamental in managing data in any application. In COBOL, these operations are typically implemented using file handling and database access routines. The operations are performed through various sections and paragraphs within the COBOL program, often controlled by flags and conditions.

<SwmSnippet path="/src/kello/crp055.cbl" line="296">

---

# Detailed implementation in the <SwmPath>[src/kello/crp055.cbl](src/kello/crp055.cbl)</SwmPath> file

The <SwmToken path="src/kello/crp055.cbl" pos="296:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section in the <SwmPath>[src/kello/crp055.cbl](src/kello/crp055.cbl)</SwmPath> file is where the main logic for CRUD operations is implemented. This section uses the <SwmToken path="src/kello/crp055.cbl" pos="297:1:1" line-data="           EVALUATE TRUE">`EVALUATE`</SwmToken> statement to determine which operation to perform based on various flags.

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
      *             PERFORM VERIFICA-VENCTO-ANT
                    PERFORM GRAVA-WORK
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-ACHAR-VENCTO-TRUE
                    PERFORM ACHAR-VENCTO
               WHEN GS-ITEM-SELECIONADO-TRUE
                    PERFORM ITEM-SELECIONADO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp055.cbl" line="209">

---

The <SwmToken path="src/kello/crp055.cbl" pos="210:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> section is called within the <SwmToken path="src/kello/crp055.cbl" pos="208:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> section, which initializes the program and repeatedly performs the <SwmToken path="src/kello/crp055.cbl" pos="210:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> until the <SwmToken path="src/kello/crp055.cbl" pos="210:9:13" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`GS-EXIT-FLG`</SwmToken> is true.

```cobol
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp055.cbl" line="379">

---

# Key sections and functions involved

The <SwmToken path="src/kello/crp055.cbl" pos="379:1:3" line-data="       GRAVA-WORK SECTION.">`GRAVA-WORK`</SwmToken> section is responsible for the 'Create' operation. It handles the opening, writing, and closing of the work file.

```cobol
       GRAVA-WORK SECTION.
           IF ST-WORK NOT = "35"
              CLOSE       WORK
              DELETE FILE WORK.

           ACCEPT VARIA-W FROM TIME
           OPEN OUTPUT WORK
           CLOSE       WORK
           OPEN I-O    WORK

           MOVE "TELA-AGUARDA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM

           MOVE GS-TIPO-DOCUMENTO(1:1) TO AUX-TIPO

           MOVE GS-VENCTO-INI          TO DATA-INV
                                          VENCTO-INI-ANT
                                          VENCTO-INI-REL

           CALL "GRIDAT2"           USING DATA-INV
           MOVE DATA-INV               TO VENCTO-INI
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp055.cbl" line="846">

---

The <SwmToken path="src/kello/crp055.cbl" pos="846:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> section is an example of a 'Read' operation. It reads data and prepares it for printing.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO PAG-W.

           COPY CONDENSA.

           MOVE GS-FORMA-PAGTO-D  TO FORMA-PGTO-REL
           MOVE GS-ACP-CONTA      TO CONTA-REL
           MOVE GS-DESC-CONTA     TO NOME-CONTA-REL


           PERFORM ORDEM.
           MOVE ZEROS TO LIN. PERFORM CABECALHO.
           MOVE SPACES TO LINDET-REL

           INITIALIZE REG-WORK
                      TOT-VALOR-PARCIAL
                      TOT-JUROS-PARCIAL
                      TOT-MULTA-PARCIAL
                      TOT-DESC-PARCIAL
                      TOT-LIQ-PARCIAL
                      TOT-VALOR-TOTAL
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp055.cbl" line="722">

---

The <SwmToken path="src/kello/crp055.cbl" pos="722:1:3" line-data="       ZERA-VARIAVEIS SECTION.">`ZERA-VARIAVEIS`</SwmToken> section is used to reset variables, which is often a part of the 'Update' operation.

```cobol
       ZERA-VARIAVEIS SECTION.
           MOVE SPACES TO PORTADOR-ANT NOME-CLIEN-ANT.
           MOVE ZEROS TO VENCTO-ANT ALBUM-ANT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp055.cbl" line="380">

---

The 'Delete' operation is performed by closing and deleting the work file in the <SwmToken path="src/kello/crp055.cbl" pos="305:5:7" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GRAVA-WORK`</SwmToken> section.

```cobol
           IF ST-WORK NOT = "35"
              CLOSE       WORK
              DELETE FILE WORK.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
