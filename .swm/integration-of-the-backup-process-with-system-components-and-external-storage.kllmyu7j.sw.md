---
title: Integration of the backup process with system components and external storage
---
This document will cover how the backup process integrates with other system components and external storage solutions. We'll cover:

1. Integration with system components
2. Integration with external storage solutions

# Integration with system components

The backup process in Kello Imagens is designed to seamlessly integrate with various system components. This is achieved through the use of the <SwmToken path="src/kello/itau.cbl" pos="91:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION in COBOL, which includes several COPY statements to import necessary modules and configurations. For example, in the file <SwmPath>[src/kello/itau.cbl](src/kello/itau.cbl)</SwmPath>, the <SwmToken path="src/kello/itau.cbl" pos="91:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION includes COPY statements for modules like <SwmToken path="src/kello/itau.cbl" pos="92:3:3" line-data="           COPY IMPRESSORA.">`IMPRESSORA`</SwmToken>, <SwmToken path="src/kello/itau.cbl" pos="93:4:6" line-data="           COPY &quot;ITAU.CPB&quot;.">`ITAU.CPB`</SwmToken>, <SwmToken path="src/kello/itau.cbl" pos="94:4:6" line-data="           COPY &quot;ITAU.CPY&quot;.">`ITAU.CPY`</SwmToken>, <SwmPath>[src/acp/ACP100/DS-CNTRL.MF](src/acp/ACP100/DS-CNTRL.MF)</SwmPath>, and <SwmPath>[src/acp/ACP100/CBPRINT.CPY](src/acp/ACP100/CBPRINT.CPY)</SwmPath>. These modules provide the necessary functionality for handling data and generating reports, which are crucial for the backup process.

<SwmSnippet path="/src/kello/itau.cbl" line="91">

---

# Integration with system components

The <SwmToken path="src/kello/itau.cbl" pos="91:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION in <SwmPath>[src/kello/itau.cbl](src/kello/itau.cbl)</SwmPath> includes COPY statements for various modules that are essential for the backup process.

```cobol
       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "ITAU.CPB".
           COPY "ITAU.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
```

---

</SwmSnippet>

Similarly, other files like <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath>, <SwmPath>[src/alt/altsbra2.cbl](src/alt/altsbra2.cbl)</SwmPath>, and <SwmPath>[src/kello/altsbra2.cbl](src/kello/altsbra2.cbl)</SwmPath> also include <SwmToken path="src/kello/itau.cbl" pos="91:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTIONS with COPY statements for different modules. These modules ensure that the backup process can access and manage data from various parts of the system, making it an integral part of the overall system architecture.

<SwmSnippet path="/src/banks/itau.cbl" line="91">

---

The <SwmToken path="src/banks/itau.cbl" pos="91:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION in <SwmPath>[src/banks/itau.cbl](src/banks/itau.cbl)</SwmPath> includes COPY statements for various modules that are essential for the backup process.

```cobol
       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "ITAU.CPB".
           COPY "ITAU.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
```

---

</SwmSnippet>

<SwmSnippet path="/src/alt/altsbra2.cbl" line="31">

---

The <SwmToken path="src/alt/altsbra2.cbl" pos="31:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION in <SwmPath>[src/alt/altsbra2.cbl](src/alt/altsbra2.cbl)</SwmPath> includes COPY statements for various modules that are essential for the backup process.

```cobol
       WORKING-STORAGE SECTION.
           COPY "ALTSBRAD.CPB".
           COPY "ALTSBRAD.CPY".
           COPY "DS-CNTRL.MF".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/altsbra2.cbl" line="31">

---

The <SwmToken path="src/kello/altsbra2.cbl" pos="31:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION in <SwmPath>[src/kello/altsbra2.cbl](src/kello/altsbra2.cbl)</SwmPath> includes COPY statements for various modules that are essential for the backup process.

```cobol
       WORKING-STORAGE SECTION.
           COPY "ALTSBRAD.CPB".
           COPY "ALTSBRAD.CPY".
           COPY "DS-CNTRL.MF".
```

---

</SwmSnippet>

# Integration with external storage solutions

The backup process also integrates with external storage solutions to ensure data is securely stored and can be easily retrieved when needed. This is typically done through EDI (Electronic Data Interchange) transactions and standard SBP (Sistema de Boletos de Pagamento) payment slip generation. These features are implemented in the COBOL code and are crucial for automating the backup and storage process.

# Integration with external storage solutions

For example, the file <SwmPath>[src/kello/itau.cbl](src/kello/itau.cbl)</SwmPath> includes definitions for various data fields and control areas that are used to manage EDI transactions and payment slips. These fields ensure that data is correctly formatted and transmitted to external storage solutions, making the backup process efficient and reliable.

<SwmSnippet path="/src/kello/itau.cbl" line="88">

---

# Integration with external storage solutions

The <SwmToken path="src/kello/itau.cbl" pos="91:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> SECTION in <SwmPath>[src/kello/itau.cbl](src/kello/itau.cbl)</SwmPath> includes definitions for various data fields and control areas that are used to manage EDI transactions and payment slips.

```cobol
           05 ACESSO-DATA       PIC 9(08).
           05 ACESSO-HORARIO    PIC 9(08).

       WORKING-STORAGE SECTION.
           COPY IMPRESSORA.
           COPY "ITAU.CPB".
           COPY "ITAU.CPY".
           COPY "DS-CNTRL.MF".
           COPY "CBPRINT.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  AREAS-DE-TRABALHO.
           05 ERRO-1                 PIC XX     VALUE SPACES.
           05 ST-CAD001              PIC XX     VALUE SPACES.
           05 ST-CAD010              PIC XX     VALUE SPACES.
           05 ST-CAD018              PIC XX     VALUE SPACES.
           05 ST-CRD020              PIC XX     VALUE SPACES.
           05 ST-CGD001              PIC XX     VALUE SPACES.
           05 ST-CGD010              PIC XX     VALUE SPACES.
           05 ST-CGD011              PIC XX     VALUE SPACES.
           05 ST-CRD200              PIC XX     VALUE SPACES.
```

---

</SwmSnippet>

By integrating with these external storage solutions, the backup process in Kello Imagens ensures that all critical business data is securely stored and can be easily accessed when needed. This integration is a key part of the system's overall reliability and robustness.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
