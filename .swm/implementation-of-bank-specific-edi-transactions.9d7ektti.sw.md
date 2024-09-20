---
title: Implementation of Bank-Specific EDI Transactions
---
This document will cover the implementation of bank-specific EDI transactions, which includes:

1. Overview of the bank-specific COBOL programs
2. Key sections and functions in the COBOL programs
3. Data flow and processing steps

# Overview of the bank-specific COBOL programs

The implementation of bank-specific EDI transactions in the Kello Imagens system involves several COBOL programs located in the <SwmPath>[src/banks/](src/banks/)</SwmPath> directory. Each program corresponds to a specific bank and handles the EDI transactions for that bank. For example, <SwmPath>[src/banks/caixa.cbl](src/banks/caixa.cbl)</SwmPath> handles transactions for Caixa, while <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath> handles transactions for Itau.

<SwmSnippet path="/src/banks/caixa.cbl" line="1">

---

# Key sections and functions in the COBOL programs

The <SwmToken path="src/banks/caixa.cbl" pos="2:1:3" line-data="       IDENTIFICATION DIVISION.">`IDENTIFICATION DIVISION`</SwmToken> and <SwmToken path="src/banks/caixa.cbl" pos="7:1:3" line-data="       ENVIRONMENT DIVISION.">`ENVIRONMENT DIVISION`</SwmToken> sections define the program's metadata and environment settings. These sections are crucial for setting up the program's execution context.

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

<SwmSnippet path="/src/banks/caixa.cbl" line="50">

---

The <SwmToken path="src/banks/caixa.cbl" pos="88:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> section defines the data structures used in the program. This includes the layout of the EDI records that will be processed.

```cobol
           COPY CRPX200.
           COPY CRPX201.
           COPY BOLCAIX.SEL.
           COPY LOGACESS.SEL.

           select remes
                  assign       to   arquivo-remes
                  organization is      sequential
                  access mode  is      sequential
                  file status  is        fs-remes.

```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/caixa.cbl" line="100">

---

The <SwmToken path="src/banks/caixa.cbl" pos="436:1:3" line-data="       PROCEDURE DIVISION USING POP-UP.">`PROCEDURE DIVISION`</SwmToken> contains the main logic for processing EDI transactions. This section includes various paragraphs and sections that perform specific tasks, such as reading input data, processing transactions, and generating output.

```cobol
               10  CLASS-CLIENTE-CR20x      PIC 9.
      *    classificação cliente =  0-contrato  1-comum
               10  CLIENTE-CR20x            PIC 9(8).
      *    quando a classificação for = 0 - o código do cliente será
      *    o nr-contrato+album e = 1(comum) será uma sequência de código
           05  SEQ-CR20x                    PIC 9(5).
           05  PORTADOR-CR20x                   PIC 9999.
           05  CARTEIRA-CR20x                   PIC 9.
      *    CARTEIRA-CR20  1-SIMPLES  2-CAUÇÃO  3-DESCONTO
           05  SITUACAO-TIT-CR20x               PIC 99.
           05  NR-DOCTO-CR20x                   PIC X(10).
           05  OUTRO-DOCTO-CR20x                PIC X(25).
      *    O NR DA REMESSA, E NO RETORNO O NR-TÍTULO-NO-BANCO(NOSSO-NR)
           05  TIPO-DOCTO-CR20x                 PIC 9.
      *    TIPO-DOCTO = 0-BOLETO     1-DUPL/PROMIS.     2-ORG.EVENTO
      *                 3-DEBITO AUTOMATICO 4-CARTAO CREDITO
           05  DATA-EMISSAO-CR20x               PIC 9(8).
           05  DATA-VENCTO-CR20x                PIC 9(8).
      *    DATA-VENCTO-CR20 - AAAAMMDD
           05  DESCRICAO-CR20x                  PIC X(30).
           05  SITUACAO-CR20x                   PIC 9.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/caixa.cbl" line="150">

---

# Data flow and processing steps

The <SwmToken path="src/banks/caixa.cbl" pos="438:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> section orchestrates the overall flow of the program. It typically starts by initializing the program, then processes each transaction, and finally generates the necessary output.

```cobol

       COPY CGPW001.
       COPY CGPW010.
       COPY CGPW011.
       COPY CRPW200.
       COPY CRPW201.
       COPY BOLCAIX.FD.
       COPY LOGACESS.FD.

       fd remes label record is omitted.
       01 reg-remes.
           05  dados-remes      pic x(449).
           05  pula-remes       pic x(002).

       FD  WORK.
       01  REG-WORK.
           05  SEQ-WK           PIC 9(3).
           05  NOME-WK          PIC X(40).
           05  ENDERECO-WK      PIC X(40).
           05  BAIRRO-WK        PIC X(12).
           05  CEP-WK           PIC 9(8).
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/caixa.cbl" line="200">

---

The <SwmToken path="src/banks/caixa.cbl" pos="439:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the program by setting up necessary variables and reading initial parameters. This is a crucial step to ensure that the program has all the required information before processing transactions.

```cobol
          05 SAC-FONE           PIC X(20).
          05 SAC-VALOR          PIC 9(15).
          05 SAC-DIA            PIC 9(02).
          05 SAC-SERIE          PIC 9(10).
          05 SAC-PULA           PIC X(002).

       FD AUXSAC.
       01 REG-AUXSAC.
          05 AUXSAC-CODIGO      PIC 9(09).

       WORKING-STORAGE SECTION.
           COPY "CAIXA.CPB".
           COPY "CAIXA.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  AREAS-DE-TRABALHO.
           05 ERRO-1                 PIC XX     VALUE SPACES.
           05 ST-CAD001              PIC XX     VALUE SPACES.
           05 ST-CAD010              PIC XX     VALUE SPACES.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/caixa.cbl" line="300">

---

The <SwmToken path="src/banks/caixa.cbl" pos="440:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> section contains the core logic for processing each transaction. It evaluates various conditions and performs the necessary actions based on the transaction type and other parameters.

```cobol
               10  link-cgc-dig2    pic 9(01).
           05  link-cgc-conf        pic 9(01).

       *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
       *>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

       01 DETALHE-ARQUIVO.
          05 D-CODIGO              PIC X(15).
          05 D-SEU-NUMERO          PIC X(15).
          05 D-NOSSO-NUMERO        PIC X(11).
          05 D-CARTEIRA            PIC 9(04).
          05 D-ACEITE              PIC X(01).
          05 D-ESPECIE             PIC 9(02).
          05 D-INSTRUCAO-COB       PIC 9(01).
          05 D-PRAZO-PROTESTO      PIC 9(04).
          05 D-OPCAO-VECTO         PIC 9(01).
          05 D-VECTO               PIC 9(08).
          05 D-EMISSAO             PIC 9(08).
          05 D-COD-MOEDA           PIC 9(02).
          05 D-VALOR-TITULO        PIC 9(13)V99.
          05 D-VALOR-JUROS         PIC 9(13)V99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/caixa.cbl" line="400">

---

The <SwmToken path="src/banks/caixa.cbl" pos="488:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section handles error messages. If an error occurs during processing, this section is responsible for loading and displaying the appropriate error message.

```cobol
           05  CIDADE-REL           PIC X(15) VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  UF-REL               PIC XX    VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  DOCTO-REL            PIC X(11) VALUE SPACES.
           05  FILLER               PIC X     VALUE SPACES.
           05  VALOR-REL            PIC ZZ.ZZZ.ZZZ,ZZ.
       01  LINDET1.
           05  FILLER               PIC X(20) VALUE 'VALOR TOTAL.: '.
           05  VALOR-TOTAL-REL      PIC ZZ.ZZZ.ZZZ.ZZZ,ZZ.
           05  FILLER               PIC X(20) VALUE SPACES.
           05  FILLER               PIC X(20) VALUE 'QTDE TITULOS: '.
           05  QTDE-TIT-TOTAL-REL   PIC ZZZ.ZZZ.

       01 TABELA-NUMERO             PIC 9(10).
       01 REDEFINES TABELA-NUMERO OCCURS 10 TIMES.
          05 TAB-NUMERO             PIC 9(01).

       01 WS-DATA-SYS.
          05 WS-DATA-CPU.
             10 WS-ANO-CPU         PIC 9(04).
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
