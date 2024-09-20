---
title: Transaction Formats Used in Bank-Specific Files
---
This document will cover the specific formats used for transactions in the Kello Imagens system. We'll cover:

1. The structure of transaction files
2. Key fields and their formats
3. Examples of transaction records

<SwmSnippet path="/src/kello/alseqbr9.CBL" line="4">

---

# The structure of transaction files

The transaction files in Kello Imagens are structured using COBOL's DATA DIVISION. The <SwmToken path="src/kello/alseqbr9.CBL" pos="7:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph defines the decimal point and class control. The <SwmToken path="src/kello/alseqbr9.CBL" pos="23:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> defines the file layout, including the record key and the fields within each record.

```cobol
       AUTHOR. ALFREDO SAVIOLLI NETO.
      *PROGRAMA: ALTERA A SEQUENCIA DO BANCO DO BRASIL - EK FORMATURAS
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


       DATA DIVISION.
       FILE SECTION.

```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/alseqbr9.CBL" line="25">

---

# Key fields and their formats

In the <SwmToken path="src/kello/alseqbr9.CBL" pos="23:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken>, the <SwmToken path="src/kello/alseqbr9.CBL" pos="25:1:1" line-data="       FD  SEQBRAS.">`FD`</SwmToken>` `<SwmToken path="src/kello/alseqbr9.CBL" pos="25:3:3" line-data="       FD  SEQBRAS.">`SEQBRAS`</SwmToken> defines the file descriptor for the transaction file. The <SwmToken path="src/kello/alseqbr9.CBL" pos="26:1:1" line-data="       01  REG-SEQBRAS.">`01`</SwmToken>` `<SwmToken path="src/kello/alseqbr9.CBL" pos="26:3:5" line-data="       01  REG-SEQBRAS.">`REG-SEQBRAS`</SwmToken> defines the record structure, which includes fields like <SwmToken path="src/kello/alseqbr9.CBL" pos="27:3:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`CONT-SEQUENCIA`</SwmToken> and <SwmToken path="src/kello/alseqbr9.CBL" pos="27:5:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`SEQUENCIA`</SwmToken>. <SwmToken path="src/kello/alseqbr9.CBL" pos="27:3:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`CONT-SEQUENCIA`</SwmToken> is a single-digit field (<SwmToken path="src/kello/alseqbr9.CBL" pos="27:7:9" line-data="           05  CONT-SEQUENCIA  PIC 9.">`PIC 9`</SwmToken>), and <SwmToken path="src/kello/alseqbr9.CBL" pos="27:5:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`SEQUENCIA`</SwmToken> is a ten-digit field (<SwmToken path="src/kello/alseqbr9.CBL" pos="28:5:10" line-data="           05  SEQUENCIA       PIC 9(10).">`PIC 9(10)`</SwmToken>).

```cobol
       FD  SEQBRAS.
       01  REG-SEQBRAS.
           05  CONT-SEQUENCIA  PIC 9.
           05  SEQUENCIA       PIC 9(10).
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/alseqbr9.CBL" line="25">

---

# Examples of transaction records

An example of a transaction record would be a sequence number record where <SwmToken path="src/kello/alseqbr9.CBL" pos="27:3:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`CONT-SEQUENCIA`</SwmToken> might be <SwmToken path="src/kello/alseqbr9.CBL" pos="102:3:3" line-data="              MOVE 1 TO CONT-SEQUENCIA">`1`</SwmToken> and <SwmToken path="src/kello/alseqbr9.CBL" pos="27:5:5" line-data="           05  CONT-SEQUENCIA  PIC 9.">`SEQUENCIA`</SwmToken> could be `1234567890`. This structure ensures that each transaction is uniquely identifiable and can be processed in sequence.

```cobol
       FD  SEQBRAS.
       01  REG-SEQBRAS.
           05  CONT-SEQUENCIA  PIC 9.
           05  SEQUENCIA       PIC 9(10).
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
