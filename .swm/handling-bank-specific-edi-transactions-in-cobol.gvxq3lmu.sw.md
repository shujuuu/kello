---
title: Handling Bank-Specific EDI Transactions in COBOL
---
This document will cover how the COBOL program handles bank-specific EDI transactions. We'll cover:

1. Overview of EDI transactions
2. Key COBOL programs involved
3. Data flow and processing steps.

# Overview of EDI transactions

Electronic Data Interchange (EDI) transactions are used to exchange business documents between systems in a standardized electronic format. In the context of the Kello Imagens system, EDI transactions are used for bank-specific operations such as payment processing and report generation.

# Key COBOL programs involved

The COBOL programs responsible for handling bank-specific EDI transactions are located in the <SwmPath>[src/banks/](src/banks/)</SwmPath> directory. These programs include <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath>, <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath>, <SwmPath>[src/banks/hsbc.cbl](src/banks/hsbc.cbl)</SwmPath>, and others. Each of these programs is tailored to handle the specific requirements of different banks.

<SwmSnippet path="/src/banks/caixa.cbl" line="1">

---

# Key COBOL programs involved

The <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath> program handles EDI transactions for Caixa bank. It includes sections for initializing the program, processing transactions, and generating reports.

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

The <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath> program handles EDI transactions for Itau bank. Similar to <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath>, it includes sections for initialization, transaction processing, and report generation.

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

The data flow for handling EDI transactions typically involves the following steps:

1. **Initialization**: The program initializes by setting up necessary variables and reading input parameters.
2. **Transaction Processing**: The program processes each transaction by reading data from input files, performing necessary computations, and updating records.
3. **Report Generation**: After processing transactions, the program generates reports and writes output files.

<SwmSnippet path="/src/oep/oep030.cbl" line="266">

---

# Data flow and processing steps

The <SwmToken path="src/oep/oep030.cbl" pos="266:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section in <SwmPath>[src/oep/oep030.cbl](src/oep/oep030.cbl)</SwmPath> initializes the program by accepting <SwmToken path="src/oep/oep030.cbl" pos="267:9:11" line-data="           ACCEPT PARAMETROS-W FROM COMMAND-LINE.">`COMMAND-LINE`</SwmToken> parameters and setting up data blocks.

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

The <SwmToken path="src/oep/oep030.cbl" pos="395:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section in <SwmPath>[src/oep/oep030.cbl](src/oep/oep030.cbl)</SwmPath> handles the main transaction processing logic, including saving data and handling errors.

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

<SwmSnippet path="/src/oep/oep030.cbl" line="889">

---

The <SwmToken path="src/oep/oep030.cbl" pos="889:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section in <SwmPath>[src/oep/oep030.cbl](src/oep/oep030.cbl)</SwmPath> is responsible for loading and displaying error messages during transaction processing.

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
