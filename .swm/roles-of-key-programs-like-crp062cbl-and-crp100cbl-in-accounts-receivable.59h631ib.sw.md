---
title: Roles of Key Programs like crp062.cbl and crp100.cbl in Accounts Receivable
---
This document will cover the key roles of the program <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath> in the Kello Imagens system. We'll cover:

1. The purpose of <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath>
2. How <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath> is structured
3. Key sections and their roles

<SwmSnippet path="/src/crp/crp062.cbl" line="2">

---

# The purpose of <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath>

The program <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath> is designed to generate a report for duplicate transfers. This is indicated in the comments and metadata at the beginning of the file.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRP062.
       DATE-WRITTEN. 12/07/2005.
       AUTHOR. ALFREDO SAVIOLLI NETO.
      *FUNÇÃO: RELATORIO DUPLICATAS PARA TRANSFERENCIA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="2">

---

# How <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath> is structured

The structure of <SwmPath>[src/crp/crp062.cbl](src/crp/crp062.cbl)</SwmPath> follows the standard COBOL program layout with divisions such as IDENTIFICATION, ENVIRONMENT, and DATA. The <SwmToken path="src/crp/crp062.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> clause specifies the decimal point and printer settings.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRP062.
       DATE-WRITTEN. 12/07/2005.
       AUTHOR. ALFREDO SAVIOLLI NETO.
      *FUNÇÃO: RELATORIO DUPLICATAS PARA TRANSFERENCIA.
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="14">

---

The <SwmToken path="src/crp/crp062.cbl" pos="14:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> SECTION and <SwmToken path="src/crp/crp062.cbl" pos="15:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> are defined here, specifying the files and their control mechanisms used in the program.

```cobol
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX004.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="49">

---

The DATA DIVISION includes the FILE SECTION where various file descriptions are copied in, such as <SwmToken path="src/crp/crp062.cbl" pos="51:3:3" line-data="       COPY CAPW004.">`CAPW004`</SwmToken>, <SwmToken path="src/crp/crp062.cbl" pos="52:3:3" line-data="       COPY CAPW002.">`CAPW002`</SwmToken>, and others. These files are essential for the program's operations.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CAPW004.
       COPY CAPW002.
       COPY CAPW010.
       COPY CGPW010.
       COPY CGPW020.
       COPY CGPW011.
       COPY CAPW018.
       COPY CRPW020.
       COPY CRPW020B.
       COPY CRPW200.
       COPY CRPW201.
       COPY LOGACESS.FD.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="83">

---

The <SwmToken path="src/crp/crp062.cbl" pos="83:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION contains variables and parameters used throughout the program. This includes error handling and parameter passing structures.

```cobol
       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "CRP062.CPB".
           COPY "CRP062.CPY".
           COPY "CBDATA.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
           COPY "CPADAY1.CPY".
           COPY "CPDIAS1.CPY".
      *    COPY "CPWEEK1.CPY".
           COPY "CPTIME.CPY".

       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  PASSAR-PARAMETROS.
           05  PASSAR-STRING-1       PIC X(60).
       01  VARIAVEIS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="227">

---

# Key sections and their roles

The <SwmToken path="src/crp/crp062.cbl" pos="227:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> SECTION is the entry point of the program, which performs the initialization of the program by calling <SwmToken path="src/crp/crp062.cbl" pos="228:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken>.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.

       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="355">

---

The <SwmToken path="src/crp/crp062.cbl" pos="355:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> SECTION contains the main logic of the program. It uses an EVALUATE statement to handle different conditions and operations.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="404">

---

The <SwmToken path="src/crp/crp062.cbl" pos="404:1:3" line-data="       BAIXAR-LOTE SECTION.">`BAIXAR-LOTE`</SwmToken> SECTION handles batch processing, moving the current date to a working storage variable.

```cobol
       BAIXAR-LOTE SECTION.
           MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp062.cbl" line="1122">

---

The <SwmToken path="src/crp/crp062.cbl" pos="1122:1:3" line-data="       IMPRIMIR-RELATORIO SECTION.">`IMPRIMIR-RELATORIO`</SwmToken> SECTION is responsible for printing the report. It opens the necessary files, reads data, and formats it for output.

```cobol
       IMPRIMIR-RELATORIO SECTION.
           OPEN I-O WORK
           MOVE ZEROS TO PAG-W.

           COPY CONDENSA.

           MOVE ZEROS TO LIN.
           PERFORM CABECALHO.
           MOVE SPACES TO GS-LINDET.

       START-WORK10.
           INITIALIZE REG-WORK
           MOVE ZEROS TO GS-TOTAL-PERIODO GS-QTDE-TITULOS GS-AVENCER
                         GS-VENCIDAS

           MOVE ZEROS TO VENC-WK NR-DUPLICATA-WK AUX-DATA.

           EVALUATE GS-ORDEM
               WHEN 1  MOVE SPACES TO CLIENTE-WK
                       START WORK KEY IS NOT < ALT-WK1 INVALID KEY
                             GO TO SAIR10
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
