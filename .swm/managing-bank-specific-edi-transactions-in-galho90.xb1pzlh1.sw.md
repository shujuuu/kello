---
title: Managing Bank-Specific EDI Transactions in GALHO90
---
This document will cover how bank-specific EDI transactions are managed in the Kello Imagens system. We'll cover:

1. Overview of EDI transaction management
2. Key programs involved
3. Data flow and file handling

# Overview of EDI transaction management

Bank-specific EDI (Electronic Data Interchange) transactions in the Kello Imagens system are managed through various COBOL programs. These programs handle the creation, modification, and processing of EDI files specific to different banks. The directory <SwmPath>[src/banks/](src/banks/)</SwmPath> contains COBOL source files for different banks such as Caixa, Itau, and HSBC.

# Key programs involved

Several key programs are involved in managing bank-specific EDI transactions. These include <SwmToken path="src/alt/altseqbr.CBL" pos="3:6:6" line-data="       PROGRAM-ID. ALTSEQBR.">`ALTSEQBR`</SwmToken>, <SwmToken path="src/als/alseqbr9.CBL" pos="3:6:6" line-data="       PROGRAM-ID. ALSEQBR9.">`ALSEQBR9`</SwmToken>, and <SwmToken path="src/oep/oep030.cbl" pos="3:6:6" line-data="       PROGRAM-ID. OEP030.">`OEP030`</SwmToken>. Each program is responsible for different aspects of the EDI transaction process.

<SwmSnippet path="/src/alt/altseqbr.CBL" line="2">

---

# Key programs involved

The program <SwmToken path="src/alt/altseqbr.CBL" pos="3:6:6" line-data="       PROGRAM-ID. ALTSEQBR.">`ALTSEQBR`</SwmToken> is used to alter the sequence for Banco do Brasil. It defines the file <SwmToken path="src/alt/altseqbr.CBL" pos="15:3:3" line-data="           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA">`SEQBRAS`</SwmToken> and its structure, which is used to store sequence data.

```cobol
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

<SwmSnippet path="/src/als/alseqbr9.CBL" line="2">

---

The program <SwmToken path="src/als/alseqbr9.CBL" pos="3:6:6" line-data="       PROGRAM-ID. ALSEQBR9.">`ALSEQBR9`</SwmToken> is another variant used for altering sequences, specifically for EK Formaturas. It also defines the file <SwmToken path="src/als/alseqbr9.CBL" pos="15:3:3" line-data="           SELECT SEQBRAS ASSIGN TO PATH-SEQBRA">`SEQBRAS`</SwmToken> and its structure.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALSEQBR9.
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

```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep030.cbl" line="266">

---

The function <SwmToken path="src/oep/oep030.cbl" pos="266:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> in <SwmToken path="src/oep/oep030.cbl" pos="3:6:6" line-data="       PROGRAM-ID. OEP030.">`OEP030`</SwmToken> initializes various parameters and paths for different files used in the EDI process.

```cobol
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
           MOVE "CGD001" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CGD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010.
           MOVE "CGD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD020.
           MOVE "CXD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CXD020.
           MOVE "CAD018" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CAD018.
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep030.cbl" line="395">

---

The function <SwmToken path="src/oep/oep030.cbl" pos="395:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> in <SwmToken path="src/oep/oep030.cbl" pos="3:6:6" line-data="       PROGRAM-ID. OEP030.">`OEP030`</SwmToken> handles the main logic for processing EDI transactions, including saving and loading data.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
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
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
```

---

</SwmSnippet>

# Data flow and file handling

The data flow for managing EDI transactions involves reading and writing to various files. The programs define file structures and paths, and use these to store and retrieve data necessary for EDI transactions.

<SwmSnippet path="/src/alt/altseqbr.CBL" line="25">

---

# Data flow and file handling

The file <SwmToken path="src/alt/altseqbr.CBL" pos="25:3:3" line-data="       FD  SEQBRAS.">`SEQBRAS`</SwmToken> is defined with a record structure that includes a sequence number. This file is used by multiple programs to manage sequence data for EDI transactions.

```cobol
       FD  SEQBRAS.
       01  REG-SEQBRAS.
           05  CONT-SEQUENCIA  PIC 9.
           05  SEQUENCIA       PIC 9(10).
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep030.cbl" line="889">

---

The function <SwmToken path="src/oep/oep030.cbl" pos="889:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> in <SwmToken path="src/oep/oep030.cbl" pos="3:6:6" line-data="       PROGRAM-ID. OEP030.">`OEP030`</SwmToken> handles error messages during the EDI transaction process, ensuring that any issues are logged and displayed appropriately.

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

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
