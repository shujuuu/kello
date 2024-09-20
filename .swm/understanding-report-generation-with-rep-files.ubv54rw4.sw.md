---
title: Understanding report generation with rep files
---
This document will cover how the system handles report generation using `.rep` files. We'll cover:

1. File Control Definitions
2. Data Division and File Section
3. Report Generation Process

<SwmSnippet path="/src/kello/rep203.cbl" line="14">

---

# File Control Definitions

The <SwmToken path="src/kello/rep203.cbl" pos="17:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> paragraph defines the files used in the report generation process. It includes various <SwmToken path="src/kello/rep203.cbl" pos="18:1:1" line-data="           COPY CGPX001.">`COPY`</SwmToken> statements for including external definitions and specifies the organization and access mode for the files.

```cobol
           Window             is class "wclass".

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CGPX001.
           COPY CGPX005.
           COPY REPX002.
           COPY REPX100.
           COPY REPX103.
           SELECT WORK ASSIGN TO VARIA-W
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-WORK
                  RECORD KEY IS CHAVE-WK = FUNCIONARIO-WK FUNCAO-WK
                  ALTERNATE RECORD KEY IS ALT-WK =
                     NOME-FUNC-WK FUNCAO-WK WITH DUPLICATES
                  ALTERNATE RECORD KEY IS VLR-REPORT-WK WITH DUPLICATES
                  ALTERNATE RECORD KEY IS FUNCAO-WK WITH DUPLICATES.
           SELECT RELAT ASSIGN TO PRINTER NOME-IMPRESSORA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep203.cbl" line="14">

---

Similarly, the <SwmToken path="src/rep/rep203.cbl" pos="17:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> paragraph in <SwmPath>[src/rep/rep203.cbl](src/rep/rep203.cbl)</SwmPath> defines the files and their attributes, including the printer assignment for the report output.

```cobol
           Window             is class "wclass".

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CGPX001.
           COPY CGPX005.
           COPY REPX002.
           COPY REPX100.
           COPY REPX103.
           SELECT WORK ASSIGN TO VARIA-W
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-WORK
                  RECORD KEY IS CHAVE-WK = FUNCIONARIO-WK FUNCAO-WK
                  ALTERNATE RECORD KEY IS ALT-WK =
                     NOME-FUNC-WK FUNCAO-WK WITH DUPLICATES
                  ALTERNATE RECORD KEY IS VLR-REPORT-WK WITH DUPLICATES
                  ALTERNATE RECORD KEY IS FUNCAO-WK WITH DUPLICATES.
           SELECT RELAT ASSIGN TO PRINTER NOME-IMPRESSORA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/rep203.cbl" line="35">

---

# Data Division and File Section

The <SwmToken path="src/kello/rep203.cbl" pos="35:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> and <SwmToken path="src/kello/rep203.cbl" pos="36:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> paragraphs include <SwmToken path="src/kello/rep203.cbl" pos="37:1:1" line-data="       COPY CGPW001.">`COPY`</SwmToken> statements to bring in the necessary data structures for report generation.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CGPW001.
       COPY CGPW005.
       COPY REPW002.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep203.cbl" line="35">

---

The <SwmToken path="src/rep/rep203.cbl" pos="35:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> and <SwmToken path="src/rep/rep203.cbl" pos="36:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> in <SwmPath>[src/rep/rep203.cbl](src/rep/rep203.cbl)</SwmPath> also include <SwmToken path="src/rep/rep203.cbl" pos="37:1:1" line-data="       COPY CGPW001.">`COPY`</SwmToken> statements for data structures, ensuring consistency across different report programs.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CGPW001.
       COPY CGPW005.
       COPY REPW002.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/rep203.cbl" line="254">

---

# Report Generation Process

The <SwmToken path="src/kello/rep203.cbl" pos="257:1:5" line-data="                         TOT-VLR-REPORT.">`TOT-VLR-REPORT`</SwmToken> paragraph outlines the steps for generating the report. It includes opening and closing files, initializing totals, and performing system calls to handle data processing and report generation.

```cobol
       GRAVA-WORK SECTION.
           CLOSE WORK  OPEN OUTPUT WORK CLOSE WORK  OPEN I-O WORK.
           MOVE ZEROS TO TOT-FIT-FILME TOT-REPORT TOT-FUNCIONARIO
                         TOT-VLR-REPORT.
           MOVE "TELA-AGUARDA" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE GS-VECTO-INI TO DATA-INV VECTO-INI-ANT
                                     VECTO-INI-REL.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV    TO VECTO-INI.
           MOVE GS-VECTO-FIM TO DATA-INV VECTO-FIM-ANT
                                     VECTO-FIM-REL.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV    TO VECTO-FIM.

           MOVE VECTO-INI         TO DATA-MOV-R100.
           START RED100 KEY IS NOT < DATA-MOV-R100 INVALID KEY
                  MOVE "10" TO ST-RED100.
           MOVE ZEROS TO ULT-SEQ.
           PERFORM UNTIL ST-RED100 = "10"
             READ RED100 NEXT RECORD AT END MOVE "10" TO ST-RED100
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep203.cbl" line="254">

---

The <SwmToken path="src/rep/rep203.cbl" pos="257:1:5" line-data="                         TOT-VLR-REPORT.">`TOT-VLR-REPORT`</SwmToken> paragraph in <SwmPath>[src/rep/rep203.cbl](src/rep/rep203.cbl)</SwmPath> mirrors the steps in <SwmPath>[src/kello/rep203.cbl](src/kello/rep203.cbl)</SwmPath>, ensuring that the report generation logic is consistent across different modules.

```cobol
       GRAVA-WORK SECTION.
           CLOSE WORK  OPEN OUTPUT WORK CLOSE WORK  OPEN I-O WORK.
           MOVE ZEROS TO TOT-FIT-FILME TOT-REPORT TOT-FUNCIONARIO
                         TOT-VLR-REPORT.
           MOVE "TELA-AGUARDA" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE GS-VECTO-INI TO DATA-INV VECTO-INI-ANT
                                     VECTO-INI-REL.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV    TO VECTO-INI.
           MOVE GS-VECTO-FIM TO DATA-INV VECTO-FIM-ANT
                                     VECTO-FIM-REL.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV    TO VECTO-FIM.

           MOVE VECTO-INI         TO DATA-MOV-R100.
           START RED100 KEY IS NOT < DATA-MOV-R100 INVALID KEY
                  MOVE "10" TO ST-RED100.
           MOVE ZEROS TO ULT-SEQ.
           PERFORM UNTIL ST-RED100 = "10"
             READ RED100 NEXT RECORD AT END MOVE "10" TO ST-RED100
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
