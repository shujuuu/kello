---
title: How IMPRIME-RELATORIO Works
---
This document will cover the implementation details of the <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function, including:

1. The purpose and functionality of <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken>
2. How <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> is used in various modules
3. Key sections and operations within <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken>

# Purpose and Functionality of <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken>

The <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function is responsible for generating reports in the Kello Imagens system. It handles the opening of output files, reading records, formatting data, and writing the formatted data to the report file. This function is crucial for producing various types of reports required by the business operations.

# Usage of <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> in Various Modules

The <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function is implemented in multiple modules across the Kello Imagens system. These modules include <SwmPath>[src/cadpro.cbl](src/cadpro.cbl)</SwmPath>, <SwmPath>[src/cadseg.cbl](src/cadseg.cbl)</SwmPath>, <SwmPath>[src/chp/chp061.cbl](src/chp/chp061.cbl)</SwmPath>, <SwmPath>[src/cop/cop041.cbl](src/cop/cop041.cbl)</SwmPath>, <SwmPath>[src/cop/cop041x.cbl](src/cop/cop041x.cbl)</SwmPath>, <SwmPath>[src/cop/cop042.cbl](src/cop/cop042.cbl)</SwmPath>, <SwmPath>[src/cop/cop105.cbl](src/cop/cop105.cbl)</SwmPath>, <SwmPath>[src/crp/crp020.cbl](src/crp/crp020.cbl)</SwmPath>, <SwmPath>[src/crp/crp053.cbl](src/crp/crp053.cbl)</SwmPath>, <SwmPath>[src/crp/crp058.cbl](src/crp/crp058.cbl)</SwmPath>, <SwmPath>[src/crp/crp9100.cbl](src/crp/crp9100.cbl)</SwmPath>, <SwmPath>[src/cxp/cxp120.cbl](src/cxp/cxp120.cbl)</SwmPath>, <SwmPath>[src/imp001.cbl](src/imp001.cbl)</SwmPath>, <SwmPath>[src/kello/prp100.cbl](src/kello/prp100.cbl)</SwmPath>, <SwmPath>[src/kello/rcp204.cbl](src/kello/rcp204.cbl)</SwmPath>, and <SwmPath>[src/kello/rep004.cbl](src/kello/rep004.cbl)</SwmPath>. Each implementation may have slight variations depending on the specific requirements of the module.

<SwmSnippet path="/src/cadpro.cbl" line="504">

---

# Key Sections and Operations within <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken>

The <SwmToken path="src/cadpro.cbl" pos="504:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function in <SwmPath>[src/cadpro.cbl](src/cadpro.cbl)</SwmPath> opens the output file, reads records from the <SwmToken path="src/cadpro.cbl" pos="507:7:7" line-data="              MOVE ZEROS TO CADPRO-CODIGO">`CADPRO`</SwmToken> file, formats the data, and writes it to the report. It also handles pagination and calls the <SwmToken path="src/cadpro.cbl" pos="515:3:3" line-data="           PERFORM CABECALHO">`CABECALHO`</SwmToken> section to print the header on each new page.

```cobol
       IMPRIME-RELATORIO SECTION.
           OPEN OUTPUT RELAT.
           IF CAP012-ORDER = 1
              MOVE ZEROS TO CADPRO-CODIGO
              START CADPRO KEY IS NOT < CADPRO-CHAVE INVALID KEY
                           MOVE "10" TO ST-CADPRO
           ELSE
              MOVE SPACES TO CADPRO-NOME
              START CADPRO KEY IS NOT < CADPRO-CH-NOME INVALID KEY
                    MOVE "10" TO ST-CADPRO.
           MOVE ZEROS TO LIN
           PERFORM CABECALHO
           PERFORM UNTIL ST-CADPRO = "10"
             READ CADPRO NEXT RECORD AT END
                  MOVE "10" TO ST-CADPRO
             NOT AT END
                  MOVE SPACES             TO LINDET-REL
                  MOVE CADPRO-CODIGO      TO LINDET-REL(01: 06)
                  MOVE CADPRO-NOME        TO LINDET-REL(08: 40)
                   MOVE CADPRO-MODELO     TO CADMOD-CODIGO
                   READ CADMOD INVALID KEY
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp020.cbl" line="1442">

---

In <SwmPath>[src/crp/crp020.cbl](src/crp/crp020.cbl)</SwmPath>, <SwmToken path="src/crp/crp020.cbl" pos="1442:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> starts by initializing the page counter and copying the condensed format. It reads records from the <SwmToken path="src/crp/crp020.cbl" pos="1448:3:3" line-data="           START CRD020 KEY IS = DATA-MOVTO-CR20 INVALID KEY">`CRD020`</SwmToken> file, formats the data, and writes it to the report. It also evaluates the status of each record and formats the status description accordingly.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO PAG-W.

           COPY CONDENSA.

           MOVE DATA-MOVTO-I TO DATA-MOVTO-CR20.
           START CRD020 KEY IS = DATA-MOVTO-CR20 INVALID KEY
                 MOVE "10" TO ST-CRD020.
           MOVE ZEROS TO LIN. PERFORM CABECALHO.
           PERFORM UNTIL ST-CRD020 = "10"
                 READ CRD020 NEXT RECORD AT END
                      MOVE "10" TO ST-CRD020
                 NOT AT END
                    IF DATA-MOVTO-CR20 NOT = DATA-MOVTO-I
                       MOVE "10" TO ST-CRD020
                    ELSE
                       MOVE CLASS-CLIENTE-CR20    TO CLASS-CLIENTE-REL
                       MOVE CLIENTE-CR20          TO CLIENTE-REL
                       MOVE SEQ-CR20              TO SEQ-REL
                       MOVE CARTEIRA-CR20         TO CARTEIRA-REL
                       MOVE NR-DOCTO-CR20         TO DOCUMENTO-REL
```

---

</SwmSnippet>

<SwmSnippet path="/src/imp001.cbl" line="1342">

---

The <SwmToken path="src/imp001.cbl" pos="1342:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function in <SwmPath>[src/imp001.cbl](src/imp001.cbl)</SwmPath> initializes various counters and performs the header printing. It reads records from the <SwmToken path="src/imp001.cbl" pos="1354:3:3" line-data="                READ RETORNO AT END">`RETORNO`</SwmToken> file, unstrings the data, and writes the formatted data to the report.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO LIN.

           COPY CONDENSA.

           INITIALIZE VALOR-TOTAL
                      ACRESCIMO-TOTAL
                      QTDE-PARC

           PERFORM CABECALHO.

           PERFORM UNTIL ST-RET = "10"
                READ RETORNO AT END
                     MOVE "10" TO ST-RET
                NOT AT END
                     INITIALIZE RET-RETORNO
                     UNSTRING REG-RETORNO DELIMITED BY ";"
                          INTO RET-EMPRESA
                               RET-EMPRESA-GER
                               RET-BANCO
```

---

</SwmSnippet>

<SwmSnippet path="/src/ccp/ccplog.cbl" line="485">

---

In <SwmPath>[src/ccp/ccplog.cbl](src/ccp/ccplog.cbl)</SwmPath>, <SwmToken path="src/ccp/ccplog.cbl" pos="485:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> initializes the balance counters, reads records from the <SwmToken path="src/ccp/ccplog.cbl" pos="494:5:5" line-data="           INITIALIZE REG-WORK">`WORK`</SwmToken> file, formats the log data, and writes it to the report. It also handles pagination and calls the <SwmToken path="src/ccp/ccplog.cbl" pos="492:3:3" line-data="           PERFORM CABECALHO.">`CABECALHO`</SwmToken> section to print the header on each new page.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO SALDO-WT SALDO-GT
           MOVE ZEROS TO PAG-W.

           COPY CONDENSA.

           MOVE ZEROS TO LIN.
           PERFORM CABECALHO.

           INITIALIZE REG-WORK
           START WORK KEY IS NOT LESS SEQ-WK INVALID KEY
                 MOVE "10" TO ST-WORK.

           PERFORM UNTIL ST-WORK = "10"
              READ WORK NEXT RECORD AT END
                   MOVE "10" TO ST-WORK
              NOT AT END
                   MOVE FORNEC-WK         TO DET-FORNEC
                   MOVE SEQUEN-WK         TO DET-SEQUEN
                   MOVE USUARIO-WK        TO DET-USUARIO
                   MOVE DATA-WK(1:4)      TO DET-ANO
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
