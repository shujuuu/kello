---
title: Structure and purpose of fields within CGD999 and CRD999 files
---
This document will cover the structure and purpose of the fields within the CGD999 and CRD999 files. We'll cover:

1. The structure of CGD999 and CRD999 files
2. The purpose of the fields within these files

<SwmSnippet path="/src/crp/crp099.cbl" line="36">

---

# The structure of CGD999 and CRD999 files

The <SwmToken path="src/crp/crp099.cbl" pos="37:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> in <SwmPath>[src/crp/crp099.cbl](src/crp/crp099.cbl)</SwmPath> includes the structure of the CGD999 and CRD999 files. The structure is defined using COBOL's <SwmToken path="src/crp/crp099.cbl" pos="38:1:1" line-data="       COPY CGPW010.">`COPY`</SwmToken> statements and <SwmToken path="src/crp/crp099.cbl" pos="42:5:5" line-data="       COPY LOGACESS.FD.">`FD`</SwmToken> (File Description) entries. For example, <SwmToken path="src/crp/crp099.cbl" pos="38:1:3" line-data="       COPY CGPW010.">`COPY CGPW010`</SwmToken> and <SwmToken path="src/crp/crp099.cbl" pos="40:1:3" line-data="       COPY CRPW099.">`COPY CRPW099`</SwmToken> are used to include the structure of these files.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CGPW010.
       COPY CAPW018.
       COPY CRPW099.
       COPY CRPW001.
       COPY LOGACESS.FD.
       FD  WORK.
       01  REG-WORK.
           05  COD-COMPL-WK.
               10  CLASSIF-WK      PIC 9.
               10  CLIENTE-WK      PIC 9(8).
           05  SEQ-WK              PIC 9(5).
           05  DOCUMENTO-WK        PIC X(10).
           05  PORTADOR-WK         PIC X(10).
           05  CARTEIRA-WK         PIC X(4).
           05  SITUACAO-WK         PIC X(10).
           05  SITUACAO-SIST-WK    PIC 9.
           05  VENCTO-WK           PIC 9(8).
           05  DATA-PAGTO-WK       PIC 9(8).
           05  DIAS-ATRAS-WK       PIC 9(3).
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp099.cbl" line="36">

---

Similarly, in <SwmPath>[src/kello/crp099.cbl](src/kello/crp099.cbl)</SwmPath>, the <SwmToken path="src/kello/crp099.cbl" pos="37:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> defines the structure of the CGD999 and CRD999 files using <SwmToken path="src/kello/crp099.cbl" pos="38:1:1" line-data="       COPY CGPW010.">`COPY`</SwmToken> statements and <SwmToken path="src/kello/crp099.cbl" pos="42:5:5" line-data="       COPY LOGACESS.FD.">`FD`</SwmToken> entries. This ensures that the structure is consistent across different parts of the application.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CGPW010.
       COPY CAPW018.
       COPY CRPW099.
       COPY CRPW001.
       COPY LOGACESS.FD.
       FD  WORK.
       01  REG-WORK.
           05  COD-COMPL-WK.
               10  CLASSIF-WK      PIC 9.
               10  CLIENTE-WK      PIC 9(8).
           05  SEQ-WK              PIC 9(5).
           05  DOCUMENTO-WK        PIC X(10).
           05  PORTADOR-WK         PIC X(10).
           05  CARTEIRA-WK         PIC X(4).
           05  SITUACAO-WK         PIC X(10).
           05  SITUACAO-SIST-WK    PIC 9.
           05  VENCTO-WK           PIC 9(8).
           05  DATA-PAGTO-WK       PIC 9(8).
           05  DIAS-ATRAS-WK       PIC 9(3).
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp099.cbl" line="43">

---

# The purpose of the fields within these files

The fields within the CGD999 and CRD999 files serve specific purposes. For example, <SwmToken path="src/crp/crp099.cbl" pos="45:3:7" line-data="           05  COD-COMPL-WK.">`COD-COMPL-WK`</SwmToken> is used as part of the record key, <SwmToken path="src/crp/crp099.cbl" pos="47:3:5" line-data="               10  CLIENTE-WK      PIC 9(8).">`CLIENTE-WK`</SwmToken> stores client information, and <SwmToken path="src/crp/crp099.cbl" pos="57:3:5" line-data="           05  VALOR-WK            PIC 9(8)V99.">`VALOR-WK`</SwmToken> holds the value amount. These fields are crucial for the application's data processing and reporting functionalities.

```cobol
       FD  WORK.
       01  REG-WORK.
           05  COD-COMPL-WK.
               10  CLASSIF-WK      PIC 9.
               10  CLIENTE-WK      PIC 9(8).
           05  SEQ-WK              PIC 9(5).
           05  DOCUMENTO-WK        PIC X(10).
           05  PORTADOR-WK         PIC X(10).
           05  CARTEIRA-WK         PIC X(4).
           05  SITUACAO-WK         PIC X(10).
           05  SITUACAO-SIST-WK    PIC 9.
           05  VENCTO-WK           PIC 9(8).
           05  DATA-PAGTO-WK       PIC 9(8).
           05  DIAS-ATRAS-WK       PIC 9(3).
           05  VALOR-WK            PIC 9(8)V99.
           05  JR-MULTA-WK         PIC 9(8)V99.
           05  NOSSO-NR-WK         PIC X(15).
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp099.cbl" line="43">

---

In <SwmPath>[src/kello/crp099.cbl](src/kello/crp099.cbl)</SwmPath>, the fields serve similar purposes. <SwmToken path="src/kello/crp099.cbl" pos="49:3:5" line-data="           05  DOCUMENTO-WK        PIC X(10).">`DOCUMENTO-WK`</SwmToken> is used to store document information, <SwmToken path="src/kello/crp099.cbl" pos="50:3:5" line-data="           05  PORTADOR-WK         PIC X(10).">`PORTADOR-WK`</SwmToken> holds carrier information, and <SwmToken path="src/kello/crp099.cbl" pos="54:3:5" line-data="           05  VENCTO-WK           PIC 9(8).">`VENCTO-WK`</SwmToken> is used for due dates. These fields are essential for managing business operations and generating reports.

```cobol
       FD  WORK.
       01  REG-WORK.
           05  COD-COMPL-WK.
               10  CLASSIF-WK      PIC 9.
               10  CLIENTE-WK      PIC 9(8).
           05  SEQ-WK              PIC 9(5).
           05  DOCUMENTO-WK        PIC X(10).
           05  PORTADOR-WK         PIC X(10).
           05  CARTEIRA-WK         PIC X(4).
           05  SITUACAO-WK         PIC X(10).
           05  SITUACAO-SIST-WK    PIC 9.
           05  VENCTO-WK           PIC 9(8).
           05  DATA-PAGTO-WK       PIC 9(8).
           05  DIAS-ATRAS-WK       PIC 9(3).
           05  VALOR-WK            PIC 9(8)V99.
           05  JR-MULTA-WK         PIC 9(8)V99.
           05  NOSSO-NR-WK         PIC X(15).
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
