---
title: Report Generation and Criteria in the Procedure Division
---
This document will cover the process of generating reports and the criteria used in the Kello Imagens system. We'll cover:

1. How reports are generated
2. Criteria used for generating reports

# How reports are generated

Reports in the Kello Imagens system are generated using COBOL-85 programs. These programs are responsible for collecting data, formatting it, and producing the final report output. The report generation process typically involves reading data from various sources, processing this data according to specific business rules, and then formatting the data into a human-readable report.

<SwmSnippet path="/src/rep/rep003.cbl" line="66">

---

# How reports are generated

The function <SwmToken path="src/rep/rep003.cbl" pos="67:1:1" line-data="           05  FILLER              PIC X(63)   VALUE">`05`</SwmToken> in <SwmPath>[src/rep/rep003.cbl](src/rep/rep003.cbl)</SwmPath> defines a report header with the title 'RELACAO DE EQUIPAMENTOS P/ REPORTAGEM' and a placeholder for the report time. This is part of the report generation process where the header is defined.

```cobol
       01  CAB02.
           05  FILLER              PIC X(63)   VALUE
           "RELACAO DE EQUIPAMENTOS P/ REPORTAGEM".
           05  HORA-REL            PIC X(5)    VALUE "  :  ".
           05  FILLER              PIC XX      VALUE SPACES.
```

---

</SwmSnippet>

# Criteria used for generating reports

The criteria for generating reports in the Kello Imagens system can vary depending on the specific report being generated. Common criteria include date ranges, specific customer or equipment IDs, and other business-specific filters. These criteria are used to filter the data that will be included in the report, ensuring that only relevant information is presented.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
