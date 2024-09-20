---
title: Understanding external modules included via COPY statements in COBOL
---
This document will cover the types of external modules included via COPY statements and their purposes. We'll cover:

1. What external modules are included
2. Why these modules are included
3. Examples of COPY statements in the codebase

# What external modules are included

External modules in COBOL are often included using the COPY statement. These modules, also known as copybooks, contain reusable code such as data definitions, procedures, or both. In the Kello Imagens project, several copybooks are included to standardize and reuse code across different programs.

# Why these modules are included

The primary reason for including external modules via COPY statements is to promote code reuse and maintainability. By defining common data structures and procedures in copybooks, developers can ensure consistency across multiple programs. This approach reduces redundancy and makes it easier to update shared logic or data definitions in one place.

<SwmSnippet path="/src/chp/chp057t.CBL" line="735">

---

# Examples of COPY statements in the codebase

In the file <SwmPath>[src/chp/chp057t.CBL](src/chp/chp057t.CBL)</SwmPath>, the COPY statement <SwmToken path="src/chp/chp057t.CBL" pos="735:3:9" line-data="      *    COPY &quot;CBDATA1.CPY&quot;.">`COPY "CBDATA1.CPY"`</SwmToken> is used. This line indicates that the program is including the contents of the <SwmPath>[src/copybook_files/CPY/CBDATA1.CPY](src/copybook_files/CPY/CBDATA1.CPY)</SwmPath> copybook.

```cobol
      *    COPY "CBDATA1.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/chp/chp040.CBL" line="298">

---

Similarly, in the file <SwmPath>[src/chp/chp040.CBL](src/chp/chp040.CBL)</SwmPath>, the COPY statement <SwmToken path="src/chp/chp040.CBL" pos="298:3:9" line-data="      *    COPY &quot;CBDATA1.CPY&quot;.">`COPY "CBDATA1.CPY"`</SwmToken> is used to include the same copybook. This demonstrates the reuse of the <SwmPath>[src/copybook_files/CPY/CBDATA1.CPY](src/copybook_files/CPY/CBDATA1.CPY)</SwmPath> module across different programs.

```cobol
      *    COPY "CBDATA1.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/chp040.CBL" line="298">

---

In the file <SwmPath>[src/kello/chp040.CBL](src/kello/chp040.CBL)</SwmPath>, the COPY statement <SwmToken path="src/kello/chp040.CBL" pos="298:3:9" line-data="      *    COPY &quot;CBDATA1.CPY&quot;.">`COPY "CBDATA1.CPY"`</SwmToken> is also present, showing that this copybook is widely used in the project.

```cobol
      *    COPY "CBDATA1.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/chp057t.CBL" line="735">

---

The file <SwmPath>[src/kello/chp057t.CBL](src/kello/chp057t.CBL)</SwmPath> includes the COPY statement <SwmToken path="src/kello/chp057t.CBL" pos="735:3:9" line-data="      *    COPY &quot;CBDATA1.CPY&quot;.">`COPY "CBDATA1.CPY"`</SwmToken>, further illustrating the reuse of this external module.

```cobol
      *    COPY "CBDATA1.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/copybook_files/CPY/DESC-IMP.CPY" line="1">

---

The file <SwmPath>[src/copybook_files/CPY/DESC-IMP.CPY](src/copybook_files/CPY/DESC-IMP.CPY)</SwmPath> contains logic for printer selection based on the value of <SwmToken path="src/copybook_files/CPY/DESC-IMP.CPY" pos="1:3:5" line-data="           IF IMPRESSORA-W = 01">`IMPRESSORA-W`</SwmToken>. This copybook can be included in programs that need to handle printer-specific operations.

```cobol
           IF IMPRESSORA-W = 01
              DISPLAY DESCOND-HP UPON LPRINTER
           ELSE DISPLAY DESCOND-EP UPON LPRINTER.

```

---

</SwmSnippet>

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
