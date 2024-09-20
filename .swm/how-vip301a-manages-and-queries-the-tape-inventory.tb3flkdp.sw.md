---
title: How VIP301A Manages and Queries the Tape Inventory
---
This document will cover how VIP301A manages and queries the tape inventory. We'll cover:

1. The structure of the <SwmToken path="src/kello/cop041t.cbl" pos="23:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section
2. Key variables used for managing the tape inventory
3. How the tape inventory is queried.

<SwmSnippet path="/src/kello/cop041t.cbl" line="20">

---

# The structure of the <SwmToken path="src/kello/cop041t.cbl" pos="23:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section

The <SwmToken path="src/kello/cop041t.cbl" pos="23:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section in <SwmPath>[src/kello/cop041t.cbl](src/kello/cop041t.cbl)</SwmPath> defines various variables and copies necessary files for managing the tape inventory. This section includes variables like <SwmToken path="src/kello/cop041t.cbl" pos="31:3:5" line-data="           05  ST-COD040              PIC XX       VALUE SPACES.">`ST-COD040`</SwmToken>, <SwmToken path="src/kello/cop041t.cbl" pos="32:3:5" line-data="           05  ST-COD041              PIC XX       VALUE SPACES.">`ST-COD041`</SwmToken>, and <SwmToken path="src/kello/cop041t.cbl" pos="33:3:5" line-data="           05  ST-IED011              PIC XX       VALUE SPACES.">`ST-IED011`</SwmToken> which are used to store codes and identifiers related to the tape inventory.

```cobol
           COPY COPW041.
           COPY IEPW011.

       WORKING-STORAGE SECTION.
           COPY "COP041T.CPB".
           COPY "COP041T.CPY".
           COPY "DS-CNTRL.MF".
           COPY "DSSYSINF.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  VARIAVEIS.
           05  ST-COD040              PIC XX       VALUE SPACES.
           05  ST-COD041              PIC XX       VALUE SPACES.
           05  ST-IED011              PIC XX       VALUE SPACES.
           05  LIN-DETALHE-W          PIC X(30)    VALUE SPACES.
           05  EMP-REFERENCIA.
               10  FILLER             PIC X(15)
                   VALUE "\PROGRAMA\KELLO".
               10  VAR1               PIC X VALUE "\".
               10  EMP-REC            PIC XXX.
               10  VAR2               PIC X VALUE "\".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop041t.cbl" line="30">

---

# Key variables used for managing the tape inventory

The <SwmToken path="src/kello/cop041t.cbl" pos="30:3:3" line-data="       01  VARIAVEIS.">`VARIAVEIS`</SwmToken> structure within the <SwmToken path="src/kello/cop041t.cbl" pos="23:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section contains several key variables:

- <SwmToken path="src/kello/cop041t.cbl" pos="31:3:5" line-data="           05  ST-COD040              PIC XX       VALUE SPACES.">`ST-COD040`</SwmToken> and <SwmToken path="src/kello/cop041t.cbl" pos="32:3:5" line-data="           05  ST-COD041              PIC XX       VALUE SPACES.">`ST-COD041`</SwmToken>: These variables store specific codes related to the tape inventory.
- <SwmToken path="src/kello/cop041t.cbl" pos="35:3:5" line-data="           05  EMP-REFERENCIA.">`EMP-REFERENCIA`</SwmToken>: This variable holds reference information about the company, which is crucial for identifying the tape inventory.
- <SwmToken path="src/kello/cop041t.cbl" pos="43:3:5" line-data="           05  CODIGO-W               PIC X(8)   VALUE SPACES.">`CODIGO-W`</SwmToken> and <SwmToken path="src/kello/cop041t.cbl" pos="44:3:5" line-data="           05  CLASSIF-W              PIC X      VALUE SPACES.">`CLASSIF-W`</SwmToken>: These variables are used for classification and coding purposes within the tape inventory management.

```cobol
       01  VARIAVEIS.
           05  ST-COD040              PIC XX       VALUE SPACES.
           05  ST-COD041              PIC XX       VALUE SPACES.
           05  ST-IED011              PIC XX       VALUE SPACES.
           05  LIN-DETALHE-W          PIC X(30)    VALUE SPACES.
           05  EMP-REFERENCIA.
               10  FILLER             PIC X(15)
                   VALUE "\PROGRAMA\KELLO".
               10  VAR1               PIC X VALUE "\".
               10  EMP-REC            PIC XXX.
               10  VAR2               PIC X VALUE "\".
               10  ARQ-REC            PIC X(10).
           05  EMPRESA-REF REDEFINES EMP-REFERENCIA PIC X(30).
           05  CODIGO-W               PIC X(8)   VALUE SPACES.
           05  CLASSIF-W              PIC X      VALUE SPACES.
           05  MESANO-E               PIC 99/9999 VALUE ZEROS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop041t.cbl" line="20">

---

# How the tape inventory is queried

The tape inventory is queried using the variables defined in the <SwmToken path="src/kello/cop041t.cbl" pos="23:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section. For instance, <SwmToken path="src/kello/cop041t.cbl" pos="31:3:5" line-data="           05  ST-COD040              PIC XX       VALUE SPACES.">`ST-COD040`</SwmToken> and <SwmToken path="src/kello/cop041t.cbl" pos="32:3:5" line-data="           05  ST-COD041              PIC XX       VALUE SPACES.">`ST-COD041`</SwmToken> can be used to filter and retrieve specific tapes based on their codes. The <SwmToken path="src/kello/cop041t.cbl" pos="35:3:5" line-data="           05  EMP-REFERENCIA.">`EMP-REFERENCIA`</SwmToken> variable helps in narrowing down the search to a particular company's tapes. The combination of these variables allows for efficient querying and management of the tape inventory.

```cobol
           COPY COPW041.
           COPY IEPW011.

       WORKING-STORAGE SECTION.
           COPY "COP041T.CPB".
           COPY "COP041T.CPY".
           COPY "DS-CNTRL.MF".
           COPY "DSSYSINF.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  VARIAVEIS.
           05  ST-COD040              PIC XX       VALUE SPACES.
           05  ST-COD041              PIC XX       VALUE SPACES.
           05  ST-IED011              PIC XX       VALUE SPACES.
           05  LIN-DETALHE-W          PIC X(30)    VALUE SPACES.
           05  EMP-REFERENCIA.
               10  FILLER             PIC X(15)
                   VALUE "\PROGRAMA\KELLO".
               10  VAR1               PIC X VALUE "\".
               10  EMP-REC            PIC XXX.
               10  VAR2               PIC X VALUE "\".
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
