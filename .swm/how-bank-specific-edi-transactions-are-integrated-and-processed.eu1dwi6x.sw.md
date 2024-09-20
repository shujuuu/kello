---
title: How Bank-Specific EDI Transactions are Integrated and Processed
---
This document will cover the integration and processing of bank-specific EDI transactions, which includes:

1. Setting up the environment and file control
2. Defining the data structure
3. Executing the transaction processing.

<SwmSnippet path="/src/alt/altseqbr.CBL" line="1">

---

# Setting up the environment and file control

The program <SwmToken path="src/alt/altseqbr.CBL" pos="3:6:6" line-data="       PROGRAM-ID. ALTSEQBR.">`ALTSEQBR`</SwmToken> is defined with the necessary environment settings and file control configurations. The file <SwmToken path="src/alt/altseqbr.CBL" pos="15:3:3" line-data="           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA">`SEQBRAS`</SwmToken> is assigned to <SwmToken path="src/alt/altseqbr.CBL" pos="15:9:11" line-data="           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA">`PATH-SEQBRA`</SwmToken> with indexed organization and dynamic access mode.

```cobol
       copy dslang.cpy.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALTSEQBR.
       AUTHOR. ALFREDO SAVIOLLI NETO.
      *PROGRAMA: ALTERA A SEQUENCIA DO BANCO DO BRASIL
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.
       class-control.
           Window             is class "wclass".

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-SEQ
                  RECORD KEY IS CONT-SEQUENCIA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/altseqbr.CBL" line="1">

---

Similarly, the program <SwmToken path="src/kello/altseqbr.CBL" pos="3:6:6" line-data="       PROGRAM-ID. ALTSEQBR.">`ALTSEQBR`</SwmToken> in this file also sets up the environment and file control for processing bank-specific EDI transactions.

```cobol
       copy dslang.cpy.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALTSEQBR.
       AUTHOR. ALFREDO SAVIOLLI NETO.
      *PROGRAMA: ALTERA A SEQUENCIA DO BANCO DO BRASIL
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.
       class-control.
           Window             is class "wclass".

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-SEQ
                  RECORD KEY IS CONT-SEQUENCIA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/alt/altseqbr.CBL" line="20">

---

# Defining the data structure

The data structure for the file <SwmToken path="src/alt/altseqbr.CBL" pos="25:3:3" line-data="       FD  SEQBRAS.">`SEQBRAS`</SwmToken> is defined in the <SwmToken path="src/alt/altseqbr.CBL" pos="22:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken>. The record <SwmToken path="src/alt/altseqbr.CBL" pos="26:3:5" line-data="       01  REG-SEQBRAS.">`REG-SEQBRAS`</SwmToken> contains fields <SwmToken path="src/alt/altseqbr.CBL" pos="27:3:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`CONT-SEQUENCIA`</SwmToken> and <SwmToken path="src/alt/altseqbr.CBL" pos="27:5:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`SEQUENCIA`</SwmToken>.

```cobol


       DATA DIVISION.
       FILE SECTION.

       FD  SEQBRAS.
       01  REG-SEQBRAS.
           05  CONT-SEQUENCIA  PIC 9.
           05  SEQUENCIA       PIC 9(10).
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/altseqbr.CBL" line="20">

---

The same data structure is defined in this file, ensuring consistency in the processing of bank-specific EDI transactions.

```cobol


       DATA DIVISION.
       FILE SECTION.

       FD  SEQBRAS.
       01  REG-SEQBRAS.
           05  CONT-SEQUENCIA  PIC 9.
           05  SEQUENCIA       PIC 9(10).
```

---

</SwmSnippet>

<SwmSnippet path="/src/alt/altseqbr.CBL" line="31">

---

# Executing the transaction processing

The <SwmToken path="src/alt/altseqbr.CBL" pos="31:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> section includes copies of necessary control files. The transaction processing is initiated by moving control settings and performing the <SwmToken path="src/alt/altseqbr.CBL" pos="126:3:7" line-data="           PERFORM CALL-DIALOG-SYSTEM.">`CALL-DIALOG-SYSTEM`</SwmToken>.

```cobol
       WORKING-STORAGE SECTION.
           COPY "ALTSEQBR.CPB".
           COPY "ALTSEQBR.CPY".
           COPY "DS-CNTRL.MF".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/altseqbr.CBL" line="31">

---

The same steps are followed in this file to execute the transaction processing, ensuring that the system behaves consistently across different modules.

```cobol
       WORKING-STORAGE SECTION.
           COPY "ALTSEQBR.CPB".
           COPY "ALTSEQBR.CPY".
           COPY "DS-CNTRL.MF".
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
