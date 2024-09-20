---
title: >-
  How the application interacts with customer data sets in CGD999 and CRD999
  files
---
This document will cover how the application interacts with customer data sets in the CGD999 and CRD999 files. We'll cover:

1. Data Definitions
2. Data Manipulation
3. File Operations.

<SwmSnippet path="/src/crp/crp099.cbl" line="36">

---

# Data Definitions

The <SwmToken path="src/crp/crp099.cbl" pos="36:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> in the <SwmPath>[src/crp/crp099.cbl](src/crp/crp099.cbl)</SwmPath> file defines the structure of the data. The <SwmToken path="src/crp/crp099.cbl" pos="37:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> includes a copy of the <SwmToken path="src/crp/crp099.cbl" pos="38:3:3" line-data="       COPY CGPW010.">`CGPW010`</SwmToken> file, which contains the layout for customer data.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CGPW010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp099.cbl" line="36">

---

Similarly, the <SwmToken path="src/kello/crp099.cbl" pos="36:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> in the <SwmPath>[src/kello/crp099.cbl](src/kello/crp099.cbl)</SwmPath> file also includes a copy of the <SwmToken path="src/kello/crp099.cbl" pos="38:3:3" line-data="       COPY CGPW010.">`CGPW010`</SwmToken> file, ensuring consistency in data structure.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CGPW010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp9109.cbl" line="142">

---

# Data Manipulation

In the <SwmPath>[src/crp/crp9109.cbl](src/crp/crp9109.cbl)</SwmPath> file, the variables <SwmToken path="src/crp/crp9109.cbl" pos="144:3:3" line-data="           05 DATAW.">`DATAW`</SwmToken> and <SwmToken path="src/crp/crp9109.cbl" pos="149:3:3" line-data="           05 DATAI.">`DATAI`</SwmToken> are defined to handle date-related information. <SwmToken path="src/crp/crp9109.cbl" pos="144:3:3" line-data="           05 DATAW.">`DATAW`</SwmToken> includes day and month, while <SwmToken path="src/crp/crp9109.cbl" pos="149:3:3" line-data="           05 DATAI.">`DATAI`</SwmToken> includes year, month, and day.

```cobol
           05 AUX-TIPO            PIC 9(1)     VALUE ZEROS.
           05 DIGITO-VERIFICADOR  PIC X(1)     VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp9109.cbl" line="142">

---

The same definitions for <SwmToken path="src/kello/crp9109.cbl" pos="144:3:3" line-data="           05 DATAW.">`DATAW`</SwmToken> and <SwmToken path="src/kello/crp9109.cbl" pos="149:3:3" line-data="           05 DATAI.">`DATAI`</SwmToken> are found in the <SwmPath>[src/kello/crp9109.cbl](src/kello/crp9109.cbl)</SwmPath> file, ensuring that date manipulation is handled consistently across different parts of the application.

```cobol
           05 AUX-TIPO            PIC 9(1)     VALUE ZEROS.
           05 DIGITO-VERIFICADOR  PIC X(1)     VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp9102C.cbl" line="141">

---

In the <SwmPath>[src/crp/crp9102C.cbl](src/crp/crp9102C.cbl)</SwmPath> file, <SwmToken path="src/crp/crp9102C.cbl" pos="143:3:3" line-data="           05 DATAW.">`DATAW`</SwmToken> and <SwmToken path="src/crp/crp9102C.cbl" pos="148:3:3" line-data="           05 DATAI.">`DATAI`</SwmToken> are again defined for date manipulation, showing the widespread use of these variables in handling customer data.

```cobol
           05 RESP-MSG            PIC X(01).
           05 DIGITO-VERIFICADOR  PIC X(1)     VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp9102C.cbl" line="141">

---

The <SwmPath>[src/kello/crp9102C.cbl](src/kello/crp9102C.cbl)</SwmPath> file also includes the same definitions for <SwmToken path="src/kello/crp9102C.cbl" pos="143:3:3" line-data="           05 DATAW.">`DATAW`</SwmToken> and <SwmToken path="src/kello/crp9102C.cbl" pos="148:3:3" line-data="           05 DATAI.">`DATAI`</SwmToken>, reinforcing the standard approach to date handling.

```cobol
           05 RESP-MSG            PIC X(01).
           05 DIGITO-VERIFICADOR  PIC X(1)     VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp9119A.cbl" line="101">

---

In the <SwmPath>[src/crp/crp9119A.cbl](src/crp/crp9119A.cbl)</SwmPath> file, <SwmToken path="src/crp/crp9119A.cbl" pos="103:3:3" line-data="           05 DATAW.">`DATAW`</SwmToken> and <SwmToken path="src/crp/crp9119A.cbl" pos="108:3:3" line-data="           05 DATAI.">`DATAI`</SwmToken> are defined alongside other variables like <SwmToken path="src/crp/crp9119A.cbl" pos="101:3:9" line-data="           05 COD-COMPL-CR20-W    PIC 9(09)  VALUE ZEROS.">`COD-COMPL-CR20-W`</SwmToken> and <SwmToken path="src/crp/crp9119A.cbl" pos="102:3:3" line-data="           05 ACHEI               PIC X(01)  VALUE SPACES.">`ACHEI`</SwmToken>, which are used in customer data processing.

```cobol
           05 COD-COMPL-CR20-W    PIC 9(09)  VALUE ZEROS.
           05 ACHEI               PIC X(01)  VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp9119A.cbl" line="101">

---

The <SwmPath>[src/kello/crp9119A.cbl](src/kello/crp9119A.cbl)</SwmPath> file mirrors the definitions found in <SwmPath>[src/crp/crp9119A.cbl](src/crp/crp9119A.cbl)</SwmPath>, ensuring consistency in how customer data is processed.

```cobol
           05 COD-COMPL-CR20-W    PIC 9(09)  VALUE ZEROS.
           05 ACHEI               PIC X(01)  VALUE SPACES.
           05 DATAW.
              10  DIA-W       PIC 99.
              10  MES-W       PIC 99.
              10  ANO-W       PIC 99.
           05 DATA-W REDEFINES DATAW PIC 9(6).
           05 DATAI.
              10  ANO-I       PIC 99.
              10  MES-I       PIC 99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp9109.cbl" line="42">

---

# File Operations

The <SwmToken path="src/crp/crp9109.cbl" pos="44:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> in the <SwmPath>[src/crp/crp9109.cbl](src/crp/crp9109.cbl)</SwmPath> file includes a <SwmToken path="src/crp/crp9109.cbl" pos="45:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> that copies the <SwmToken path="src/crp/crp9109.cbl" pos="46:3:3" line-data="       COPY CAPW002.">`CAPW002`</SwmToken> file, which is used for file operations related to customer data.

```cobol
           SELECT RELAT ASSIGN TO PRINTER NOME-IMPRESSORA.

       DATA DIVISION.
       FILE SECTION.
       COPY CAPW002.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp9109.cbl" line="42">

---

The <SwmPath>[src/kello/crp9109.cbl](src/kello/crp9109.cbl)</SwmPath> file also includes a <SwmToken path="src/kello/crp9109.cbl" pos="45:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> that copies the <SwmToken path="src/kello/crp9109.cbl" pos="46:3:3" line-data="       COPY CAPW002.">`CAPW002`</SwmToken> file, ensuring that file operations are handled consistently.

```cobol
           SELECT RELAT ASSIGN TO PRINTER NOME-IMPRESSORA.

       DATA DIVISION.
       FILE SECTION.
       COPY CAPW002.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
