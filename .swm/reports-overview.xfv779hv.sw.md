---
title: Reports Overview
---
Reports are automatically generated documents that provide detailed information about various business operations.

They are created using COBOL programs that process data and format it into structured outputs.

The function <SwmToken path="src/rep/rep206.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP206.">`REP206`</SwmToken> is responsible for initializing the program, processing the main logic, and finalizing the report generation.

The <SwmToken path="src/rep/rep206.cbl" pos="240:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section sets up necessary parameters and data structures for the report.

The <SwmToken path="src/rep/rep206.cbl" pos="321:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main logic for generating the report, including data evaluation and conditional processing.

Errors encountered during report generation are handled by the <SwmToken path="src/rep/rep206.cbl" pos="521:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section, which displays appropriate error messages.

The `GRAVAR-DADOS-REPORTAGEM` function in <SwmPath>[src/kello/rep100.cbl](src/kello/rep100.cbl)</SwmPath> is used to save report data into the database.

Reports can include various types of data, such as sales information, participant details, and contract statuses.

The <SwmToken path="src/rep/rep206.cbl" pos="329:3:5" line-data="                       PERFORM IMPRIME-RELATORIO">`IMPRIME-RELATORIO`</SwmToken> section is responsible for printing the report, ensuring that it is formatted correctly for output.

<SwmSnippet path="/src/rep/rep206.cbl" line="240">

---

# Initializing the Report

The <SwmToken path="src/rep/rep206.cbl" pos="240:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section sets up necessary parameters and data structures for the report.

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

# Main Logic for Report Generation

The <SwmToken path="src/rep/rep206.cbl" pos="321:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main logic for generating the report, including data evaluation and conditional processing.

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

<SwmSnippet path="/src/rep/rep206.cbl" line="521">

---

# Handling Errors

Errors encountered during report generation are handled by the <SwmToken path="src/rep/rep206.cbl" pos="521:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section, which displays appropriate error messages.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep205.cbl" line="739">

---

# Saving Report Data

The `GRAVAR-DADOS-REPORTAGEM` function in <SwmPath>[src/kello/rep100.cbl](src/kello/rep100.cbl)</SwmPath> is used to save report data into the database.

```cobol
       GRAVA-REPORTAGEM SECTION.
           MOVE DOCTO-R100             TO DOCTO-R103.
           MOVE ZEROS                  TO CODIGO-R103 FUNCAO-R103.
           START RED103 KEY IS NOT < CHAVE-R103 INVALID KEY
                 MOVE "10" TO ST-RED103.                                        x
           PERFORM UNTIL ST-RED103 = "10"
                 READ RED103 NEXT RECORD AT END
                      MOVE "10" TO ST-RED103
                 NOT AT END
                      IF DOCTO-R103 <> DOCTO-R100
                         MOVE "10" TO ST-RED103
                      ELSE
                         MOVE FUNCAO-R103 TO CODIGO-RE02
                         READ RED002 INVALID KEY
                              INITIALIZE REG-RED002
                         END-READ
                         EVALUATE ACUMULAR-RE02
                              WHEN 1 ADD VLR-REPORT-R103 TO
                                         GS-VLR-COORD GS-TOT-REPORT
                              WHEN 2 ADD VLR-REPORT-R103 TO
                                         GS-VLR-FOTOG GS-TOT-REPORT
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206.cbl" line="1336">

---

# Printing the Report

The <SwmToken path="src/rep/rep206.cbl" pos="1336:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> section is responsible for printing the report, ensuring that it is formatted correctly for output.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO PAG-W.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
