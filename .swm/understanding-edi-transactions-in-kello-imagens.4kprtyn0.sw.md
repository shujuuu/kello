---
title: Understanding EDI transactions in Kello Imagens
---
This document will cover the specifics of EDI transactions in Kello Imagens, including:

1. What EDI transactions are
2. How EDI transactions are implemented in Kello Imagens
3. Key components and files involved in EDI transactions

# What EDI transactions are

Electronic Data Interchange (EDI) is a standardized method for exchanging business information and transactions between organizations electronically. It replaces traditional paper-based documents with digital equivalents, enabling faster, more accurate, and efficient data exchange.

# How EDI transactions are implemented in Kello Imagens

In Kello Imagens, EDI transactions are implemented using COBOL-85. The system handles various types of business transactions, such as automatic report generation and bank-specific EDI transactions. The implementation involves defining data structures, processing logic, and communication protocols to ensure seamless data exchange with external systems.

# Key components and files involved in EDI transactions

Several key components and files are involved in the implementation of EDI transactions in Kello Imagens. These include COBOL source files, copybooks, and compiled objects. Below are some of the relevant files and their roles:

<SwmSnippet path="/src/kello/cop041.cbl" line="284">

---

# Key components and files involved in EDI transactions

The file <SwmPath>[src/kello/cop041.cbl](src/kello/cop041.cbl)</SwmPath> contains the definition of the <SwmToken path="src/kello/cop041.cbl" pos="78:3:5" line-data="           05  EMP-REFERENCIA.">`EMP-REFERENCIA`</SwmToken> structure, which is used in EDI transactions. This structure includes fields for program reference and employee record.

```cobol
           END-READ.

      *    INITIALIZE REG-MTD019
      *    MOVE GS-CONTRATO        TO CONTRATO-MT19
      *    START MTD019 KEY IS NOT LESS ALBUM-MT19 INVALID KEY
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cgp010a.cbl" line="294">

---

The file <SwmPath>[src/kello/cgp010a.cbl](src/kello/cgp010a.cbl)</SwmPath> defines the <SwmToken path="src/kello/cgp010a.cbl" pos="296:3:5" line-data="           05  CEP-KELLO       PIC 99.999.999.">`CEP-KELLO`</SwmToken> variable, which is part of the address information used in EDI transactions. This variable includes fields for postal code and city.

```cobol
       01  KELLO3.
           05  FILLER          PIC X(10)   VALUE SPACES.
           05  CEP-KELLO       PIC 99.999.999.
           05  FILLER          PIC X(02)   VALUE SPACES.
           05  CIDADE-KELLO    PIC X(31)   VALUE SPACES.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop055.cbl" line="284">

---

The file <SwmPath>[src/kello/cop055.cbl](src/kello/cop055.cbl)</SwmPath> also contains the <SwmToken path="src/kello/cop041.cbl" pos="78:3:5" line-data="           05  EMP-REFERENCIA.">`EMP-REFERENCIA`</SwmToken> structure, similar to <SwmPath>[src/kello/cop041.cbl](src/kello/cop041.cbl)</SwmPath>. This redundancy ensures that the structure is available in different parts of the system where EDI transactions are processed.

```cobol
           move "COP055"            to logacess-programa
           move "ABERTO"            to logacess-status
           move "10" to fs-logacess
           perform until fs-logacess = "00"
                write reg-logacess invalid key
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
