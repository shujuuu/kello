---
title: Understanding Imported Data Structures in the Data Division
---
This document will cover the specific data structures being imported in the Data Division. We'll cover:

1. Overview of the Data Division
2. Specific data structures being imported

# Overview of the Data Division

The Data Division in COBOL is used to define the variables and data structures that the program will use. It is divided into several sections, such as the File Section, <SwmToken path="src/conpro.cbl" pos="25:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> Section, and Linkage Section. Each section serves a specific purpose in managing data within the program.

<SwmSnippet path="/src/conpro.cbl" line="17">

---

# Specific data structures being imported

In <SwmPath>[src/conpro.cbl](src/conpro.cbl)</SwmPath>, the Data Division imports data structures using the <SwmToken path="src/conpro.cbl" pos="17:1:1" line-data="           COPY CADMOD.SEL.">`COPY`</SwmToken> statement. The <SwmToken path="src/conpro.cbl" pos="17:1:5" line-data="           COPY CADMOD.SEL.">`COPY CADMOD.SEL`</SwmToken> and <SwmToken path="src/conpro.cbl" pos="21:1:5" line-data="           COPY CADPRO.FD.">`COPY CADPRO.FD`</SwmToken> statements import predefined data structures from external files.

```cobol
           COPY CADMOD.SEL.

       DATA DIVISION.
       FILE SECTION.
           COPY CADPRO.FD.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/conpro.cbl" line="17">

---

Similarly, in <SwmPath>[src/kello/conpro.cbl](src/kello/conpro.cbl)</SwmPath>, the Data Division imports the same data structures using the <SwmToken path="src/kello/conpro.cbl" pos="17:1:5" line-data="           COPY CADMOD.SEL.">`COPY CADMOD.SEL`</SwmToken> and <SwmToken path="src/kello/conpro.cbl" pos="21:1:5" line-data="           COPY CADPRO.FD.">`COPY CADPRO.FD`</SwmToken> statements.

```cobol
           COPY CADMOD.SEL.

       DATA DIVISION.
       FILE SECTION.
           COPY CADPRO.FD.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/menunovo.cbl" line="31">

---

In <SwmPath>[src/kello/menunovo.cbl](src/kello/menunovo.cbl)</SwmPath>, the Data Division imports the data structure using the <SwmToken path="src/kello/menunovo.cbl" pos="35:1:3" line-data="       COPY CAPW001.">`COPY CAPW001`</SwmToken> statement.

```cobol
                         FILE STATUS IS ST-LIB001.

       DATA DIVISION.
       FILE SECTION.
       COPY CAPW001.
```

---

</SwmSnippet>

<SwmSnippet path="/src/menunovo.cbl" line="31">

---

Similarly, in <SwmPath>[src/menunovo.cbl](src/menunovo.cbl)</SwmPath>, the Data Division imports the same data structure using the <SwmToken path="src/menunovo.cbl" pos="35:1:3" line-data="       COPY CAPW001.">`COPY CAPW001`</SwmToken> statement.

```cobol
                         FILE STATUS IS ST-LIB001.

       DATA DIVISION.
       FILE SECTION.
       COPY CAPW001.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
