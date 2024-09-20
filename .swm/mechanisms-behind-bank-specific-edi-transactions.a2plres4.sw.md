---
title: Mechanisms behind bank-specific EDI transactions
---
This document will cover the mechanisms underpinning the handling of bank-specific EDI transactions. We'll cover:

1. Overview of bank-specific EDI transactions
2. Key COBOL programs involved
3. Data flow and processing steps

# Overview of bank-specific EDI transactions

Bank-specific EDI (Electronic Data Interchange) transactions are crucial for automating and standardizing the exchange of financial data between the business and various banks. These transactions ensure that payment instructions, bank statements, and other financial documents are exchanged in a structured format, reducing manual intervention and errors.

# Key COBOL programs involved

The handling of bank-specific EDI transactions in the Kello Imagens system involves several COBOL programs located in the <SwmPath>[src/banks/](src/banks/)</SwmPath> directory. Each program is tailored to interact with a specific bank's EDI system. Key programs include:

- <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath>, <SwmPath>[src/banks/caixa2.cbl](src/banks/caixa2.cbl)</SwmPath>, <SwmPath>[src/banks/caixa3.cbl](src/banks/caixa3.cbl)</SwmPath>, <SwmPath>[src/banks/caixa4.cbl](src/banks/caixa4.cbl)</SwmPath>: Programs for handling transactions with Caixa bank.
- <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath>, <SwmPath>[src/banks/itau2.cbl](src/banks/itau2.cbl)</SwmPath>, <SwmPath>[src/banks/ritau.cbl](src/banks/ritau.cbl)</SwmPath>, <SwmPath>[src/banks/ritau2.cbl](src/banks/ritau2.cbl)</SwmPath>: Programs for handling transactions with Itau bank.
- <SwmPath>[src/banks/hsbc.cbl](src/banks/hsbc.cbl)</SwmPath>, <SwmPath>[src/banks/rhsbc.cbl](src/banks/rhsbc.cbl)</SwmPath>: Programs for handling transactions with HSBC bank.
- <SwmPath>[src/banks/rcaixa.cbl](src/banks/rcaixa.cbl)</SwmPath>, <SwmPath>[src/banks/rcaixa4.cbl](src/banks/rcaixa4.cbl)</SwmPath>: Additional programs for Caixa bank.

<SwmSnippet path="/src/banks/caixa.cbl" line="1">

---

# Example - <SwmToken path="/src/banks/caixa.cbl" pos="3:6:6" line-data="       PROGRAM-ID.    CAIXA.">`CAIXA`</SwmToken>

This program handles EDI transactions specific to Caixa bank. It includes routines for generating and processing payment instructions, bank statements, and other financial documents.

```cobol
       copy dslang.cpy.
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CAIXA.
       AUTHOR.        ALFREDO SAVIOLLI NETO.
      *GERA ARQUIVO XXXXXXXX.REM P/ CAIXA
       DATE-WRITTEN.  23-07-2012.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA
                      PRINTER IS LPRINTER.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/itau.cbl" line="1">

---

# Example - <SwmToken path="/src/banks/itau.cbl" pos="3:6:6" line-data="       PROGRAM-ID.    ITAU.">`ITAU`</SwmToken>

This program handles EDI transactions specific to Itau bank. It includes routines for generating and processing payment instructions, bank statements, and other financial documents.

```cobol
       copy dslang.cpy.
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    ITAU.
       AUTHOR.        ALFREDO SAVIOLLI NETO.
      *GERA ARQUIVO XXXXXXXX.REM P/ ITAU
       DATE-WRITTEN.  08-10-2010.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA
                      PRINTER IS LPRINTER.
```

---

</SwmSnippet>

# Data flow and processing steps

The data flow for handling bank-specific EDI transactions involves several steps:

1. **Initialization**: The program initializes necessary variables and reads input parameters from the command line.
2. **Data Preparation**: The program prepares the data to be sent or received from the bank. This includes formatting the data according to the bank's EDI specifications.
3. **File Handling**: The program reads from and writes to various files that store transaction data. For example, the <SwmToken path="src/banks/caixa.cbl" pos="9:1:3" line-data="       SPECIAL-NAMES. DECIMAL-POINT IS COMMA">`SPECIAL-NAMES`</SwmToken> paragraph in <SwmPath>[src/alt/altseqbr.CBL](src/alt/altseqbr.CBL)</SwmPath> defines the file structure for Banco do Brasil transactions.
4. **Transaction Processing**: The core logic of the program processes the transactions. This includes generating payment instructions, reading bank statements, and updating the system's records.
5. **Error Handling**: The program includes routines for handling errors that may occur during the transaction processing. For example, the <SwmToken path="src/oep/oep030.cbl" pos="889:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section in <SwmPath>[src/oep/oep030.cbl](src/oep/oep030.cbl)</SwmPath> handles error messages.

<SwmSnippet path="/src/alt/altseqbr.CBL" line="4">

---

# Example specific to <SwmToken path="/src/alt/altseqbr.CBL" pos="5:13:17" line-data="      *PROGRAMA: ALTERA A SEQUENCIA DO BANCO DO BRASIL">`BANCO DO BRASIL`</SwmToken>

The <SwmToken path="src/alt/altseqbr.CBL" pos="7:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph defines the file structure for Banco do Brasil transactions. It specifies the file organization, access mode, and record key.

```cobol
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


       DATA DIVISION.
       FILE SECTION.

```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep030.cbl" line="889">

---

The <SwmToken path="src/oep/oep030.cbl" pos="889:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section handles error messages during transaction processing. It loads the error screen and displays the error message.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET
           MOVE "EXIBE-ERRO"  TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1             TO ERRO-W.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
