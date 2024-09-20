---
title: Role and Significance of COPY Files in Cooperative Operations
---
This document will cover the significance of the various <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files included in the Cooperative Operations module. We'll cover:

1. Purpose of <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files
2. Usage in different sections
3. Examples from the codebase

# Purpose of <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files

In COBOL, <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files are used to include common code segments across multiple programs. This promotes code reuse and maintainability. By using <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files, developers can ensure consistency and reduce redundancy in the codebase.

# Usage in different sections

The Cooperative Operations module utilizes <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files extensively in various sections such as <SwmToken path="src/chp/chp057t.CBL" pos="178:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> and <SwmToken path="src/rcp/rcp209.CBL" pos="602:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>. These sections include common data definitions and procedural code that are shared across different programs.

<SwmSnippet path="/src/chp/chp057t.CBL" line="178">

---

# Usage in different sections

In the <SwmToken path="src/chp/chp057t.CBL" pos="178:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section, multiple <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> files are included to define common data structures and variables. For example, <SwmToken path="src/chp/chp057t.CBL" pos="179:1:3" line-data="           COPY IMPRESSORA.">`COPY IMPRESSORA`</SwmToken>, <SwmToken path="src/chp/chp057t.CBL" pos="180:1:7" line-data="           COPY &quot;CHP057t.CPB&quot;.">`COPY "CHP057t.CPB"`</SwmToken>, and <SwmToken path="src/chp/chp057t.CBL" pos="182:1:7" line-data="           COPY &quot;CBDATA.CPY&quot;.">`COPY "CBDATA.CPY"`</SwmToken> are used to include printer definitions, specific program data, and common data structures respectively.

```cobol
       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "CHP057t.CPB".
           COPY "CHP057T.CPY".
           COPY "CBDATA.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
           COPY "CPADAY1.CPY".
           COPY "CPDIAS1.CPY".
      *    COPY "CPWEEK1.CPY".
           COPY "CPTIME.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/chp/chp040.CBL" line="143">

---

Similarly, in another <SwmToken path="src/chp/chp040.CBL" pos="143:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section, <SwmToken path="src/chp/chp040.CBL" pos="144:1:1" line-data="           COPY &quot;CHP040.CPB&quot;.">`COPY`</SwmToken> files like <SwmToken path="src/chp/chp040.CBL" pos="144:1:7" line-data="           COPY &quot;CHP040.CPB&quot;.">`COPY "CHP040.CPB"`</SwmToken>, <SwmToken path="src/chp/chp040.CBL" pos="146:1:7" line-data="           COPY &quot;CBDATA.CPY&quot;.">`COPY "CBDATA.CPY"`</SwmToken>, and <SwmToken path="src/chp/chp040.CBL" pos="152:1:7" line-data="           COPY &quot;CPTIME.CPY&quot;.">`COPY "CPTIME.CPY"`</SwmToken> are included to bring in common data definitions and time-related data structures.

```cobol
       WORKING-STORAGE SECTION.
           COPY "CHP040.CPB".
           COPY "CHP040.CPY".
           COPY "CBDATA.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
           COPY "CPADAY1.CPY".
           COPY "CPDIAS1.CPY".
      *    COPY "CPWEEK1.CPY".
           COPY "CPTIME.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/rcp/rcp209.CBL" line="602">

---

In the <SwmToken path="src/rcp/rcp209.CBL" pos="602:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section, <SwmToken path="src/rcp/rcp209.CBL" pos="608:3:3" line-data="      *             COPY IMPRESSORA.CHAMA.">`COPY`</SwmToken> files are used to include procedural code. For instance, <SwmToken path="src/rcp/rcp209.CBL" pos="608:3:7" line-data="      *             COPY IMPRESSORA.CHAMA.">`COPY IMPRESSORA.CHAMA`</SwmToken> is commented out but indicates that printer-related procedures can be included when needed.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
                   PERFORM CRIAR-LISTVIEW
               WHEN GS-PRINTER-FLG-TRUE
      *             COPY IMPRESSORA.CHAMA.
      *             IF LNK-MAPEAMENTO <> SPACES
      *                PERFORM IMPRIME-RELATORIO
      *             END-IF

                    IF GS-IMPR-RELATORIO = 1
                       MOVE 1 TO QUAL-CAB
                    ELSE
                       IF GS-IMPR-RESUMO = 1
                          MOVE 2 TO QUAL-CAB
                       END-IF
                    END-IF

                    perform 0010-inicio
               WHEN GS-GRAVA-WORK-FLG-TRUE
```

---

</SwmSnippet>

# Examples from the codebase

Here are some specific examples of <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> file usage in the Cooperative Operations module:

<SwmSnippet path="/src/copybook_files/CPY/cobrel-det-paisagem.cpy" line="1">

---

# Examples from the codebase

This <SwmToken path="src/chp/chp057t.CBL" pos="179:1:1" line-data="           COPY IMPRESSORA.">`COPY`</SwmToken> file defines the layout for a report header, including fields for company name, report title, and user information. This layout can be reused across multiple report programs.

```cobol
       01 DET-CABECALHO1-p.
          05 FILLER                      PIC X(34).
          05 DET-EMPRESA-p               PIC X(04).
          05 FILLER                      PIC X(05).
          05 DET-RAZAO-p                 PIC X(76).
          05 FILLER                      PIC X(38).
          05 FILLER                      PIC X(07) VALUE "PÁGINA ".
          05 DET-PAGINA-p                PIC 9(06) VALUE ZEROS.

       01 DET-CABECALHO2-p.
          05 FILLER                      PIC X(34).
          05 DET-TITULO-CAB-p            PIC X(108).
          05 FILLER                      PIC X(12) VALUE "EMITIDO EM:".
          05 DET-DIA-EMIS-p              PIC 99/.
          05 DET-MES-EMIS-p              PIC 99/.
          05 DET-ANO-EMIS-p              PIC 9999.
          05 FILLER                      PIC X(01).
          05 DET-HO-EMIS-p               PIC 99.
          05 FILLER                      PIC X(01) VALUE ":".
          05 DET-MI-EMIS-p               PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/chp040.CBL" line="143">

---

In this <SwmToken path="src/kello/chp040.CBL" pos="143:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section, <SwmToken path="src/kello/chp040.CBL" pos="144:1:1" line-data="           COPY &quot;CHP040.CPB&quot;.">`COPY`</SwmToken> files are used to include common data structures and variables, ensuring consistency across different programs.

```cobol
       WORKING-STORAGE SECTION.
           COPY "CHP040.CPB".
           COPY "CHP040.CPY".
           COPY "CBDATA.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
           COPY "CPADAY1.CPY".
           COPY "CPDIAS1.CPY".
      *    COPY "CPWEEK1.CPY".
           COPY "CPTIME.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/rcp209.CBL" line="602">

---

In the <SwmToken path="src/kello/rcp209.CBL" pos="602:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section, <SwmToken path="src/kello/rcp209.CBL" pos="608:3:3" line-data="      *             COPY IMPRESSORA.CHAMA.">`COPY`</SwmToken> files are used to include procedural code, such as printer-related procedures, which can be reused across different programs.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
                   PERFORM CRIAR-LISTVIEW
               WHEN GS-PRINTER-FLG-TRUE
      *             COPY IMPRESSORA.CHAMA.
      *             IF LNK-MAPEAMENTO <> SPACES
      *                PERFORM IMPRIME-RELATORIO
      *             END-IF

                    IF GS-IMPR-RELATORIO = 1
                       MOVE 1 TO QUAL-CAB
                    ELSE
                       IF GS-IMPR-RESUMO = 1
                          MOVE 2 TO QUAL-CAB
                       END-IF
                    END-IF

                    perform 0010-inicio
               WHEN GS-GRAVA-WORK-FLG-TRUE
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
