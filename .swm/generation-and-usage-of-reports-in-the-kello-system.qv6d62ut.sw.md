---
title: Generation and usage of reports in the Kello system
---
This document will cover how various reports (rep201.cpb, <SwmPath>[tests/BUILD/rep203.cbl](tests/BUILD/rep203.cbl)</SwmPath>, etc.) are generated and used in the system. We'll cover:

1. Overview of report generation
2. Detailed explanation of specific reports
3. How reports are used in the system.

# Overview of report generation

The system generates various reports using COBOL programs. Each report program is responsible for extracting data, processing it, and formatting it into a report. The reports are generated based on specific criteria and intervals defined within the programs.

<SwmSnippet path="/tests/BUILD/rep201.cbl" line="1">

---

# Detailed explanation of specific reports

The report <SwmPath>[tests/BUILD/rep201.cbl](tests/BUILD/rep201.cbl)</SwmPath> is designed to list all reports within a specified interval. It uses various COPY statements to include necessary data definitions and procedures.

```cobol
       COPY DSLANG.CPY.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REP201.
      *DATA: 14/04/2000
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *FUNÇÃO: Extrato de REPORTAGEM
      *        Listar todos as reportagens que estiverem
      *        dentro do intervalo de reportagem solicitado.
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
```

---

</SwmSnippet>

<SwmSnippet path="/tests/BUILD/rep203.cbl" line="1">

---

The report <SwmPath>[tests/BUILD/rep203.cbl](tests/BUILD/rep203.cbl)</SwmPath> summarizes the reporting team by function. It also uses COPY statements to include data definitions and procedures.

```cobol
       COPY DSLANG.CPY.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REP203.
      *DATA: 02/05/2000
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *FUNÇÃO: RESUMO DE EQUIPE DE REPORTAGEM POR FUNCAO
      *        Listar todos as reportagens que estiverem
      *        dentro do intervalo de reportagem solicitado.
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
```

---

</SwmSnippet>

<SwmSnippet path="/tests/BUILD/rep205.cbl" line="1">

---

The report <SwmPath>[tests/BUILD/rep205.cbl](tests/BUILD/rep205.cbl)</SwmPath> provides statistics on reporting expenses. It includes data definitions and procedures necessary for generating the report.

```cobol
       COPY DSLANG.CPY.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REP205.
      *DATA: 04/05/2000
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *FUNÇÃO: Estatisiticas das despesas de reportagem
      *        Listar todos as reportagens que estiverem
      *        dentro do intervalo de reportagem solicitado.
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
```

---

</SwmSnippet>

<SwmSnippet path="/tests/BUILD/rep206-a.cbl" line="1">

---

The report <SwmPath>[tests/BUILD/rep206-a.cbl](tests/BUILD/rep206-a.cbl)</SwmPath> lists statistics of reports by requested order. It includes data definitions and procedures necessary for generating the report.

```cobol
       COPY DSLANG.CPY.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REP206.
      *DATA: 08/05/2000
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *FUNÇÃO: ESTATISTICA DE REPORTAGEM POR ORDEM SOLICITADA
      *        Listar todos as reportagens que estiverem
      *        dentro do intervalo de reportagem solicitado.
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
```

---

</SwmSnippet>

# How reports are used in the system

Once generated, the reports are used for various business operations. They provide insights into reporting activities, team performance, and expenses. The reports can be printed or exported to different formats like Excel for further analysis.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
