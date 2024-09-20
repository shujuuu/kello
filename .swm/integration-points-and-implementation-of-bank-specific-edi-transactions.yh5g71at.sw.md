---
title: Integration points and implementation of bank-specific EDI transactions
---
This document will cover the key integration points for bank-specific EDI transactions and how they are implemented. We'll cover:

1. Overview of bank-specific EDI transactions
2. Key integration points
3. Implementation details

# Overview of bank-specific EDI transactions

Bank-specific EDI (Electronic Data Interchange) transactions in the Kello Imagens system are designed to facilitate automated communication between the system and various banks. These transactions include functionalities such as payment processing, report generation, and data synchronization.

# Key integration points

The key integration points for bank-specific EDI transactions are located in the <SwmPath>[src/banks/](src/banks/)</SwmPath> directory. This directory contains COBOL programs specific to different banks, such as <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath>, <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath>, and <SwmPath>[src/banks/hsbc.cbl](src/banks/hsbc.cbl)</SwmPath>. Each of these programs handles the EDI transactions for their respective banks.

<SwmSnippet path="/src/banks/caixa.cbl" line="1">

---

# Key integration points

The <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath> file contains the COBOL code for handling EDI transactions with Caixa bank. This includes reading and writing data specific to Caixa's EDI format.

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
       class-control.
           Window             is class "wclass".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX001.
           COPY CAPX010.
           COPY CAPX018.
           COPY CRPX020.

          $set IDXFORMAT"4" FILETYPE"4"
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/itau.cbl" line="1">

---

The <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath> file contains the COBOL code for handling EDI transactions with Itau bank. This includes reading and writing data specific to Itau's EDI format.

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
       class-control.
           Window             is class "wclass".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX001.
           COPY CAPX010.
           COPY CAPX018.
           COPY CRPX020.
           COPY CGPX001.
           COPY CGPX010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/hsbc.cbl" line="1">

---

The <SwmPath>[src/banks/hsbc.cbl](src/banks/hsbc.cbl)</SwmPath> file contains the COBOL code for handling EDI transactions with HSBC bank. This includes reading and writing data specific to HSBC's EDI format.

```cobol
       copy dslang.cpy.
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    HSBC.
       AUTHOR.        ALFREDO SAVIOLLI NETO.
      *GERA ARQUIVO XXXXXXXX.REM P/ HSBC
       DATE-WRITTEN.  08-10-2010.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA
                      PRINTER IS LPRINTER.
       class-control.
           Window             is class "wclass".
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX001.
           COPY CAPX010.
           COPY CAPX018.
           COPY CRPX020.
           COPY CGPX001.
           COPY CGPX010.
```

---

</SwmSnippet>

# Implementation details

The implementation of bank-specific EDI transactions involves several steps:

1. **File Selection**: Each bank's EDI transactions are handled by a specific COBOL program located in the <SwmPath>[src/banks/](src/banks/)</SwmPath> directory.
2. **Data Handling**: The COBOL programs read and write data in the format required by each bank. This includes handling specific fields and record structures.
3. **Transaction Processing**: The programs process the EDI transactions by performing operations such as data validation, formatting, and communication with the bank's systems.

<SwmSnippet path="/src/alt/altseqbr.CBL" line="1">

---

# Implementation details

The <SwmPath>[src/alt/altseqbr.CBL](src/alt/altseqbr.CBL)</SwmPath> file contains the COBOL code for altering the sequence of transactions for Banco do Brasil. This is an example of a specific operation performed as part of the EDI transaction processing.

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

<SwmSnippet path="/src/oep/oep030.cbl" line="261">

---

The <SwmPath>[src/oep/oep030.cbl](src/oep/oep030.cbl)</SwmPath> file contains the COBOL code for initializing the program and setting up the environment for EDI transactions. This includes accepting parameters from the command line and setting up file paths.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.

       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE HORA-REL TO HORA-RELA
           MOVE EMISSAO-REL TO EMISSAO-RELA.
           MOVE DATA-INV TO DATA-MOVTO-W DATA-MOVTO-REL.
           CALL "GRIDAT2"  USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp020.cbl" line="401">

---

The <SwmPath>[src/crp/crp020.cbl](src/crp/crp020.cbl)</SwmPath> file contains the COBOL code for the main processing section of the EDI transactions. This includes evaluating conditions and performing the necessary operations based on the transaction type.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   MOVE "S" TO PRIMEIRA
                   IF GS-PARCELA = 1 PERFORM GRAVA-PARCELAS
                   ELSE
                    PERFORM SALVAR-DADOS
                    IF GS-TIPO-GRAVACAO = 1
                       PERFORM REGRAVA-DADOS
                       PERFORM GRAVA-ANOTACAO
                    ELSE
                       PERFORM GRAVA-DADOS
                       PERFORM GRAVA-ANOTACAO-PRE-DEFINIDA
                    END-IF
                   END-IF
                   PERFORM LIMPAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-LOAD-FLG-TRUE
                   PERFORM CARREGAR-DADOS
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
