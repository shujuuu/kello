---
title: Conditions and Criteria for CRUD Operations in Branch Management
---
This document will cover the CRUD operations in branch management, which includes:

1. Creating a branch
2. Reading branch details
3. Updating branch information
4. Deleting a branch.

<SwmSnippet path="/src/galho/GalhoCRD020B.cbl" line="49">

---

# Creating a branch

The <SwmToken path="src/galho/GalhoCRD020B.cbl" pos="49:1:3" line-data="       PROCEDURE DIVISION.">`PROCEDURE DIVISION`</SwmToken> in <SwmPath>[src/galho/GalhoCRD020B.cbl](src/galho/GalhoCRD020B.cbl)</SwmPath> starts the main process section and accepts parameters from the command line. This is where the creation of a branch would be initiated.

```cobol
       PROCEDURE DIVISION.
       MAIN-PROCESS SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/galho90CRD.cbl" line="100">

---

# Reading branch details

The <SwmToken path="src/kello/galho90CRD.cbl" pos="100:1:3" line-data="       PROCEDURE DIVISION.">`PROCEDURE DIVISION`</SwmToken> in <SwmPath>[src/kello/galho90CRD.cbl](src/kello/galho90CRD.cbl)</SwmPath> starts the main process section. This section would include the logic to read and display branch details.

```cobol
       PROCEDURE DIVISION.
       MAIN-PROCESS SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp053.cbl" line="145">

---

# Updating branch information

The <SwmToken path="src/kello/crp053.cbl" pos="145:1:3" line-data="       PROCEDURE DIVISION.">`PROCEDURE DIVISION`</SwmToken> in <SwmPath>[src/kello/crp053.cbl](src/kello/crp053.cbl)</SwmPath> starts the main process section. This section would handle the logic for updating branch information.

```cobol
       PROCEDURE DIVISION.

       MAIN-PROCESS SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/crp055.cbl" line="206">

---

# Deleting a branch

The <SwmToken path="src/kello/crp055.cbl" pos="206:1:3" line-data="       PROCEDURE DIVISION.">`PROCEDURE DIVISION`</SwmToken> in <SwmPath>[src/kello/crp055.cbl](src/kello/crp055.cbl)</SwmPath> starts the main process section. This section would include the logic for deleting a branch.

```cobol
       PROCEDURE DIVISION.

       MAIN-PROCESS SECTION.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
