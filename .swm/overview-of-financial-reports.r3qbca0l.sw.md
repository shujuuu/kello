---
title: Overview of Financial Reports
---
Reports are essential for summarizing and presenting financial data in a structured format. They provide insights into various financial operations, such as cash flow, bank transactions, and payment slips.

The function <SwmToken path="src/cop/cop110.cbl" pos="330:3:5" line-data="                       PERFORM IMPRIME-RELATORIO">`IMPRIME-RELATORIO`</SwmToken> is responsible for generating these reports. It opens the necessary input files, initializes variables, and performs various operations to format and print the report lines.

The <SwmToken path="src/cop/cop110.cbl" pos="323:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section coordinates the report generation process by calling the <SwmToken path="src/cop/cop110.cbl" pos="330:3:5" line-data="                       PERFORM IMPRIME-RELATORIO">`IMPRIME-RELATORIO`</SwmToken> function when the `FIN001-PRINTER-FLG-TRUE` condition is met.

Additionally, the <SwmToken path="src/cop/cop110.cbl" pos="332:5:7" line-data="               WHEN GS-CARREGA-LISTA-FLG-TRUE">`CARREGA-LISTA`</SwmToken> function is used to prepare and load data into the report, ensuring that all relevant financial information is included.

<SwmSnippet path="/src/cop/cop110.cbl" line="1080">

---

# <SwmToken path="src/cop/cop110.cbl" pos="1080:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> Function

The <SwmToken path="src/cop/cop110.cbl" pos="1080:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function is responsible for generating the reports by opening necessary input files, initializing variables, and performing various operations to format and print the report lines.

```cobol
       IMPRIME-RELATORIO SECTION.

           MOVE ZEROS TO PAG-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop110.cbl" line="323">

---

# <SwmToken path="src/cop/cop110.cbl" pos="323:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> Section

The <SwmToken path="src/cop/cop110.cbl" pos="323:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section coordinates the report generation process by calling the <SwmToken path="src/cop/cop110.cbl" pos="330:3:5" line-data="                       PERFORM IMPRIME-RELATORIO">`IMPRIME-RELATORIO`</SwmToken> function when the `FIN001-PRINTER-FLG-TRUE` condition is met.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
                    PERFORM CARREGAR-DADOS-REPORTAGEM
                    PERFORM RESUMO-REPORTAGEM
                    PERFORM CARREGA-DESPESA-FIXA
               WHEN GS-CHAMA-PROGRAMA-TRUE
                    PERFORM CHAMA-PROGRAMA-DESPESA
           END-EVALUATE
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop110.cbl" line="366">

---

# <SwmToken path="src/cop/cop110.cbl" pos="366:1:3" line-data="       CARREGA-LISTA SECTION.">`CARREGA-LISTA`</SwmToken> Function

The <SwmToken path="src/cop/cop110.cbl" pos="366:1:3" line-data="       CARREGA-LISTA SECTION.">`CARREGA-LISTA`</SwmToken> function is used to prepare and load data into the report, ensuring that all relevant financial information is included.

```cobol
       CARREGA-LISTA SECTION.
           MOVE "CLEAR-LIST-BOX" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
