---
title: Roles of different data files and structures in financial processing
---
This document will cover the specific roles of different data files and structures in financial processing. We'll cover:

1. The purpose of key data structures
2. How these structures are used in financial processing
3. Examples of data manipulation in the codebase

# Purpose of Key Data Structures

In the Kello Imagens system, various data structures are used to handle financial processing. These structures include <SwmToken path="src/ficha2.cbl" pos="644:11:15" line-data="           move function current-date to ws-data-sys">`ws-data-sys`</SwmToken>, <SwmToken path="src/ficha2.cbl" pos="647:3:7" line-data="           move ws-data-cpu         to logacess-data">`ws-data-cpu`</SwmToken>, and <SwmToken path="src/ficha2.cbl" pos="647:11:13" line-data="           move ws-data-cpu         to logacess-data">`logacess-data`</SwmToken>. These structures are primarily used to store and manipulate date-related information, which is crucial for financial transactions.

# Usage in Financial Processing

The data structures are used extensively across multiple COBOL programs to manage dates and log access data. For instance, <SwmToken path="src/ficha2.cbl" pos="644:11:15" line-data="           move function current-date to ws-data-sys">`ws-data-sys`</SwmToken> is often used to store the current date, while <SwmToken path="src/ficha2.cbl" pos="647:3:7" line-data="           move ws-data-cpu         to logacess-data">`ws-data-cpu`</SwmToken> is used to store CPU-specific date information. <SwmToken path="src/ficha2.cbl" pos="647:11:13" line-data="           move ws-data-cpu         to logacess-data">`logacess-data`</SwmToken> is used for logging access data, which is essential for auditing and tracking purposes.

<SwmSnippet path="/src/ficha2.cbl" line="644">

---

# Examples of Data Manipulation

In this example, the current date is moved to <SwmToken path="src/ficha2.cbl" pos="644:11:15" line-data="           move function current-date to ws-data-sys">`ws-data-sys`</SwmToken>, and <SwmToken path="src/ficha2.cbl" pos="647:3:7" line-data="           move ws-data-cpu         to logacess-data">`ws-data-cpu`</SwmToken> is moved to <SwmToken path="src/ficha2.cbl" pos="647:11:13" line-data="           move ws-data-cpu         to logacess-data">`logacess-data`</SwmToken>. This demonstrates how date information is captured and logged.

```cobol
           move function current-date to ws-data-sys

           move usuario-w           to logacess-usuario
           move ws-data-cpu         to logacess-data
```

---

</SwmSnippet>

<SwmSnippet path="/src/ciep300.cbl" line="221">

---

Here, the current date is again moved to <SwmToken path="src/ciep300.cbl" pos="221:11:15" line-data="           move function current-date to ws-data-sys">`ws-data-sys`</SwmToken>, and <SwmToken path="src/ciep300.cbl" pos="224:3:7" line-data="           move ws-data-cpu         to logacess-data">`ws-data-cpu`</SwmToken> is moved to <SwmToken path="src/ciep300.cbl" pos="224:11:13" line-data="           move ws-data-cpu         to logacess-data">`logacess-data`</SwmToken>. This pattern is repeated across various programs to ensure consistent date handling.

```cobol
           move function current-date to ws-data-sys

           move usuario-w           to logacess-usuario
           move ws-data-cpu         to logacess-data
```

---

</SwmSnippet>

<SwmSnippet path="/src/rcp/rcp100.cbl" line="641">

---

This snippet shows the same operations, highlighting the importance of these data structures in maintaining accurate date records across the system.

```cobol
           move function current-date to ws-data-sys

           move usuario-w           to logacess-usuario
           move ws-data-cpu         to logacess-data
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop100.CBL" line="955">

---

Another example where the current date is moved to <SwmToken path="src/cop/cop100.CBL" pos="955:11:15" line-data="           move function current-date to ws-data-sys">`ws-data-sys`</SwmToken>, and <SwmToken path="src/cop/cop100.CBL" pos="958:3:7" line-data="           move ws-data-cpu         to logacess-data">`ws-data-cpu`</SwmToken> is moved to <SwmToken path="src/cop/cop100.CBL" pos="958:11:13" line-data="           move ws-data-cpu         to logacess-data">`logacess-data`</SwmToken>, reinforcing the standard practice of date management in financial processing.

```cobol
           move function current-date to ws-data-sys

           move usuario-w           to logacess-usuario
           move ws-data-cpu         to logacess-data
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
