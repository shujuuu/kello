---
title: Data Fetching and Formatting in Automatic Report Generation
---
This document will cover the specifics of data fetching and formatting in automatic report generation. We'll cover:

1. Fetching data for reports
2. Formatting data for reports

<SwmSnippet path="/src/rep/rep206.cbl" line="240">

---

# Fetching data for reports

The <SwmToken path="src/rep/rep206.cbl" pos="240:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the program by accepting parameters from the command line and setting up various data blocks and file paths. This is the first step in fetching data for the report.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CAD004"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD004.
           MOVE "CAD010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.
           MOVE "CAD012"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD012.
           MOVE "COD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD001.
           MOVE "COD003"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD003.
           MOVE "COD040"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "COD041"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD041.
           MOVE "RED100"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED100.
           MOVE "RED101"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED101.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="321">

---

The <SwmToken path="src/rep/rep206.cbl" pos="321:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main logic for fetching data. It evaluates different conditions and performs corresponding actions such as centralizing data, verifying status, and loading lists.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
                   PERFORM VERIFICAR-SENHA-STATUS
               WHEN GS-PRINTER-FLG-TRUE
                    copy impressora.chama.
                    if lnk-mapeamento <> spaces
                       PERFORM IMPRIME-RELATORIO
                    end-if
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    PERFORM GRAVA-WORK
                    PERFORM CARREGA-LISTA
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM CARREGA-LISTA
               WHEN GS-POPUP-CIDADE-TRUE
                    PERFORM CHAMAR-POPUP-CIDADE
               WHEN GS-LE-CIDADE-TRUE
                   PERFORM LE-CIDADE
               WHEN GS-POPUP-REGIAO-TRUE
                    PERFORM CHAMAR-POPUP-REGIAO
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="358">

---

The <SwmToken path="src/rep/rep206.cbl" pos="358:1:5" line-data="       VERIFICAR-SENHA-STATUS SECTION.">`VERIFICAR-SENHA-STATUS`</SwmToken> section opens the input file <SwmToken path="src/rep/rep206.cbl" pos="359:5:5" line-data="           OPEN INPUT CAD004">`CAD004`</SwmToken> and moves user codes to verify status. This is part of the data fetching process.

```cobol
       VERIFICAR-SENHA-STATUS SECTION.
           OPEN INPUT CAD004
           MOVE COD-USUARIO-W      TO COD-USUARIO-CA004
           MOVE "SENHA48"          TO PROGRAMA-CA004
           READ CAD004 INVALID KEY
               DISABLE-OBJECT PB12
           NOT INVALID KEY
               ENABLE-OBJECT PB12.

           CLOSE CAD004.

       CENTRALIZAR SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="481">

---

The <SwmToken path="src/rep/rep206.cbl" pos="481:1:3" line-data="       LE-STATUS SECTION.">`LE-STATUS`</SwmToken> section reads the status from the <SwmToken path="src/rep/rep206.cbl" pos="483:3:3" line-data="           READ COD001 INVALID KEY">`COD001`</SwmToken> file. This is another step in fetching the necessary data for the report.

```cobol
       LE-STATUS SECTION.
           MOVE GS-STATUS              TO CODIGO-CO01
           READ COD001 INVALID KEY
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="543">

---

The <SwmToken path="src/rep/rep206.cbl" pos="543:1:3" line-data="       LE-REGIAO SECTION.">`LE-REGIAO`</SwmToken> section reads region data from the <SwmToken path="src/rep/rep206.cbl" pos="545:3:3" line-data="           READ CAD012 INVALID KEY MOVE &quot;****&quot; TO NOME-REG.">`CAD012`</SwmToken> file. This is part of the data fetching process.

```cobol
       LE-REGIAO SECTION.
           MOVE GS-REGIAO  TO CODIGO-REG.
           READ CAD012 INVALID KEY MOVE "****" TO NOME-REG.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="526">

---

# Formatting data for reports

The <SwmToken path="src/rep/rep206.cbl" pos="526:1:3" line-data="       LIMPAR-DADOS SECTION.">`LIMPAR-DADOS`</SwmToken> section initializes data blocks and sets up for refreshing the screen. This is the first step in formatting the fetched data.

```cobol
       LIMPAR-DADOS SECTION.
           INITIALIZE GS-DATA-BLOCK
           PERFORM SET-UP-FOR-REFRESH-SCREEN.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="1254">

---

The <SwmToken path="src/rep/rep206.cbl" pos="1254:1:5" line-data="       MOVER-DADOS-LINDET SECTION.">`MOVER-DADOS-LINDET`</SwmToken> section moves spaces to <SwmToken path="src/rep/rep206.cbl" pos="1255:7:9" line-data="           MOVE SPACES            TO GS-LINDET.">`GS-LINDET`</SwmToken>, which is part of the data formatting process.

```cobol
       MOVER-DADOS-LINDET SECTION.
           MOVE SPACES            TO GS-LINDET.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="1296">

---

The <SwmToken path="src/rep/rep206.cbl" pos="1296:1:1" line-data="       TOTALIZA SECTION.">`TOTALIZA`</SwmToken> section moves spaces to <SwmToken path="src/rep/rep206.cbl" pos="1297:7:9" line-data="           MOVE SPACES TO GS-LINTOT.">`GS-LINTOT`</SwmToken>, which is another step in formatting the data.

```cobol
       TOTALIZA SECTION.
           MOVE SPACES TO GS-LINTOT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="1336">

---

The <SwmToken path="src/rep/rep206.cbl" pos="1336:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> section initializes the page number and prepares the data for printing. This is the final step in formatting the data for the report.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO PAG-W.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
