---
title: Mechanisms for Exporting Reports to PDF and Excel
---
This document will cover the mechanisms for exporting reports to PDF and Excel, which includes:

1. Exporting reports to Excel
2. Exporting reports to PDF

<SwmSnippet path="/src/bxrec.cbl" line="827">

---

# Exporting reports to Excel

The section <SwmToken path="src/bxrec.cbl" pos="827:1:7" line-data="       EXPORTAR-PARA-EXCEL-PRO section.">`EXPORTAR-PARA-EXCEL-PRO`</SwmToken> is responsible for exporting reports to Excel. It uses the <SwmToken path="src/bxrec.cbl" pos="828:3:3" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`aListview`</SwmToken> object to invoke the <SwmToken path="src/bxrec.cbl" pos="828:6:6" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`ExportarParaOExcel`</SwmToken> method, passing <SwmToken path="src/bxrec.cbl" pos="829:3:5" line-data="                    using gs-listview lnkTabelaPro.">`gs-listview`</SwmToken> and <SwmToken path="src/bxrec.cbl" pos="829:7:7" line-data="                    using gs-listview lnkTabelaPro.">`lnkTabelaPro`</SwmToken> as parameters.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
           EXIT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/bxrec.cbl" line="827">

---

Similarly, in the file <SwmPath>[src/kello/bxrec.cbl](src/kello/bxrec.cbl)</SwmPath>, the section <SwmToken path="src/kello/bxrec.cbl" pos="827:1:7" line-data="       EXPORTAR-PARA-EXCEL-PRO section.">`EXPORTAR-PARA-EXCEL-PRO`</SwmToken> performs the same operation of exporting reports to Excel using the <SwmToken path="src/kello/bxrec.cbl" pos="828:3:3" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`aListview`</SwmToken> object.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
           EXIT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/mtp020novo.cbl" line="1559">

---

In the file <SwmPath>[src/kello/mtp020novo.cbl](src/kello/mtp020novo.cbl)</SwmPath>, the section <SwmToken path="src/kello/mtp020novo.cbl" pos="1559:1:7" line-data="       EXPORTAR-PARA-EXCEL-PRO section.">`EXPORTAR-PARA-EXCEL-PRO`</SwmToken> also invokes the <SwmToken path="src/kello/mtp020novo.cbl" pos="1560:6:6" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`ExportarParaOExcel`</SwmToken> method using <SwmToken path="src/kello/mtp020novo.cbl" pos="1561:3:9" line-data="                    using gs-listview-produtos-cont lnkTabelaPro.">`gs-listview-produtos-cont`</SwmToken> and <SwmToken path="src/kello/mtp020novo.cbl" pos="1561:11:11" line-data="                    using gs-listview-produtos-cont lnkTabelaPro.">`lnkTabelaPro`</SwmToken>.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview-produtos-cont lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
           EXIT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp020novo.cbl" line="1559">

---

The same mechanism is used in the file <SwmPath>[src/mtp/mtp020novo.cbl](src/mtp/mtp020novo.cbl)</SwmPath> for exporting reports to Excel.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview-produtos-cont lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
           EXIT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp023.cbl" line="562">

---

In the file <SwmPath>[src/mtp/mtp023.cbl](src/mtp/mtp023.cbl)</SwmPath>, the section <SwmToken path="src/mtp/mtp023.cbl" pos="562:1:7" line-data="       EXPORTAR-PARA-EXCEL-PRO section.">`EXPORTAR-PARA-EXCEL-PRO`</SwmToken> uses the <SwmToken path="src/mtp/mtp023.cbl" pos="563:3:3" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`aListview`</SwmToken> object to invoke the <SwmToken path="src/mtp/mtp023.cbl" pos="563:6:6" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`ExportarParaOExcel`</SwmToken> method.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/mtp023.cbl" line="562">

---

Similarly, in the file <SwmPath>[src/kello/mtp023.cbl](src/kello/mtp023.cbl)</SwmPath>, the section <SwmToken path="src/kello/mtp023.cbl" pos="562:1:7" line-data="       EXPORTAR-PARA-EXCEL-PRO section.">`EXPORTAR-PARA-EXCEL-PRO`</SwmToken> performs the same operation.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/mtp001.cbl" line="448">

---

In the file <SwmPath>[src/kello/mtp001.cbl](src/kello/mtp001.cbl)</SwmPath>, the section <SwmToken path="src/kello/mtp001.cbl" pos="448:1:7" line-data="       EXPORTAR-PARA-EXCEL-PRO section.">`EXPORTAR-PARA-EXCEL-PRO`</SwmToken> invokes the <SwmToken path="src/kello/mtp001.cbl" pos="449:6:6" line-data="           invoke aListview &quot;ExportarParaOExcel&quot;">`ExportarParaOExcel`</SwmToken> method using <SwmToken path="src/kello/mtp001.cbl" pos="450:3:7" line-data="                    using gs-listview-produtos lnkTabelaPro.">`gs-listview-produtos`</SwmToken> and <SwmToken path="src/kello/mtp001.cbl" pos="450:9:9" line-data="                    using gs-listview-produtos lnkTabelaPro.">`lnkTabelaPro`</SwmToken>.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview-produtos lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
           EXIT.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp001.cbl" line="448">

---

The same mechanism is used in the file <SwmPath>[src/mtp/mtp001.cbl](src/mtp/mtp001.cbl)</SwmPath> for exporting reports to Excel.

```cobol
       EXPORTAR-PARA-EXCEL-PRO section.
           invoke aListview "ExportarParaOExcel"
                    using gs-listview-produtos lnkTabelaPro.
       EXPORTAR-PARA-EXCEL-PRO-fim.
           EXIT.
```

---

</SwmSnippet>

# Exporting reports to PDF

The context provided does not include specific sections or methods for exporting reports to PDF. However, it is likely that a similar mechanism to the Excel export is used, involving invoking a method on an object responsible for handling PDF exports.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
