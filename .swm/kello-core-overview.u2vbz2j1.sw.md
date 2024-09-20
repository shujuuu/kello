---
title: Kello Core Overview
---
Kello Core is the central part of the Kello Imagens business operations management system.

It is responsible for handling the main functionalities of the application, including automatic report generation and bank-specific EDI transactions.

The core also manages the generation of standard SBP payment slips, which are essential for the financial operations within the system.

The Kello Core is implemented in COBOL-85, ensuring compatibility with legacy systems and providing robust performance for business-critical operations.

It integrates various modules and components, such as those found in the <SwmPath>[src/kello/](src/kello/)</SwmPath> directory, to deliver comprehensive business management solutions.

<SwmSnippet path="/src/kello/cgp010.cbl" line="283">

---

The group <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> is part of the Kello Core and includes fields like <SwmToken path="src/kello/cgp010.cbl" pos="285:3:5" line-data="           05  ALBUM-KELLO     PIC 9999.9999 BLANK WHEN ZEROS.">`ALBUM-KELLO`</SwmToken> which are used in the core functionalities.

```cobol
       01  KELLO1.
           05  FILLER          PIC X(10)   VALUE SPACES.
           05  ALBUM-KELLO     PIC 9999.9999 BLANK WHEN ZEROS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cgp010.cbl" line="289">

---

The group <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> is another part of the Kello Core and includes fields like <SwmToken path="src/kello/cgp010.cbl" pos="291:3:5" line-data="           05  ENDERECO-KELLO  PIC X(26)   VALUE SPACES.">`ENDERECO-KELLO`</SwmToken> which are used in the core functionalities.

```cobol
       01  KELLO2.
           05  FILLER          PIC X(10)   VALUE SPACES.
           05  ENDERECO-KELLO  PIC X(26)   VALUE SPACES.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
