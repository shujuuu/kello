---
title: 'Roles of .cpy, .gs, and .lst files in the Kello system'
---
This document will cover the role of <SwmToken path="src/cpp/cpp052.cbl" pos="185:4:5" line-data="          COPY IMPRESSORA.CPY.">`.CPY`</SwmToken> files in the system, including their purpose, usage, and examples from the codebase.

# Purpose of .cpy Files

.cpy files in COBOL are copybooks, which are used to include common code across multiple programs. They typically contain data definitions, file descriptions, and other reusable code segments. This helps in maintaining consistency and reducing redundancy in the codebase.

# Usage of .cpy Files

In the Kello Imagens system, <SwmToken path="src/cpp/cpp052.cbl" pos="185:4:5" line-data="          COPY IMPRESSORA.CPY.">`.CPY`</SwmToken> files are used extensively to define constants, data structures, and other reusable components. These files are included in COBOL programs using the <SwmToken path="src/cpp/cpp052.cbl" pos="185:1:1" line-data="          COPY IMPRESSORA.CPY.">`COPY`</SwmToken> statement, which allows the code within the copybook to be inserted into the program at compile time.

<SwmSnippet path="/src/kello/cop050.cpy" line="1">

---

# Usage of .cpy Files

The file <SwmPath>[src/kello/cop050.cpy](src/kello/cop050.cpy)</SwmPath> defines a set of system constants and control values. The <SwmToken path="src/kello/cop050.cpy" pos="1:1:10" line-data="      $IF SYS-CONSTANTS NOT DEFINED">`$IF SYS-CONSTANTS NOT DEFINED`</SwmToken> directive ensures that these constants are only defined once, preventing redefinition errors.

```cobol
      $IF SYS-CONSTANTS NOT DEFINED
       01  SYS-CONSTANTS.
           03  SYS-NULL       PIC 9(8) COMP-X VALUE H"01000000".
           03  SYS-CONTROL    PIC 9(8) COMP-X VALUE H"02000000".
           03  SYS-WINDOW     PIC 9(8) COMP-X VALUE H"03000000".
      $END
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop050.cpy" line="10">

---

This section of <SwmPath>[src/kello/cop050.cpy](src/kello/cop050.cpy)</SwmPath> defines various constants used throughout the system. Each constant is defined with a specific value, which can be referenced in COBOL programs that include this copybook.

```cobol
       03  PRINCIPAL                       PIC 9(8) COMP-X VALUE 1.
       03  GBOX1                           PIC 9(8) COMP-X VALUE 2.
       03  D-CONTRATO                      PIC 9(8) COMP-X VALUE 3.
       03  EF9                             PIC 9(8) COMP-X VALUE 4.
       03  D-CURSO                         PIC 9(8) COMP-X VALUE 5.
       03  EF10                            PIC 9(8) COMP-X VALUE 6.
       03  EF4                             PIC 9(8) COMP-X VALUE 7.
       03  EF15                            PIC 9(8) COMP-X VALUE 8.
       03  EF2                             PIC 9(8) COMP-X VALUE 9.
       03  EF3                             PIC 9(8) COMP-X VALUE 10.
       03  EF5                             PIC 9(8) COMP-X VALUE 11.
       03  EF6                             PIC 9(8) COMP-X VALUE 12.
       03  EF8                             PIC 9(8) COMP-X VALUE 13.
       03  SB6                             PIC 9(8) COMP-X VALUE 14.
       03  SB3                             PIC 9(8) COMP-X VALUE 15.
       03  EF11                            PIC 9(8) COMP-X VALUE 16.
       03  EF21                            PIC 9(8) COMP-X VALUE 17.
       03  EF14                            PIC 9(8) COMP-X VALUE 18.
       03  EF7                             PIC 9(8) COMP-X VALUE 19.
       03  EF48                            PIC 9(8) COMP-X VALUE 20.
       03  MLE2                            PIC 9(8) COMP-X VALUE 21.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp052.cbl" line="185">

---

In the file <SwmPath>[src/cpp/cpp052.cbl](src/cpp/cpp052.cbl)</SwmPath>, the <SwmToken path="src/cpp/cpp052.cbl" pos="185:1:5" line-data="          COPY IMPRESSORA.CPY.">`COPY IMPRESSORA.CPY`</SwmToken> statement is used to include the contents of the <SwmToken path="src/cpp/cpp052.cbl" pos="185:3:5" line-data="          COPY IMPRESSORA.CPY.">`IMPRESSORA.CPY`</SwmToken> copybook. This allows the program to use the data definitions and constants defined in the copybook.

```cobol
          COPY IMPRESSORA.CPY.

       PROCEDURE DIVISION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop040.cpy" line="1">

---

Similar to <SwmPath>[src/kello/cop050.cpy](src/kello/cop050.cpy)</SwmPath>, the <SwmPath>[src/kello/cop040.cpy](src/kello/cop040.cpy)</SwmPath> file also defines system constants and control values, ensuring they are only defined once.

```cobol
      $IF SYS-CONSTANTS NOT DEFINED
       01  SYS-CONSTANTS.
           03  SYS-NULL       PIC 9(8) COMP-X VALUE H"01000000".
           03  SYS-CONTROL    PIC 9(8) COMP-X VALUE H"02000000".
           03  SYS-WINDOW     PIC 9(8) COMP-X VALUE H"03000000".
      $END
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop040.cpy" line="10">

---

This section of <SwmPath>[src/kello/cop040.cpy](src/kello/cop040.cpy)</SwmPath> defines additional constants used in the system, each with a specific value for reference in COBOL programs.

```cobol
       03  PRINCIPAL                       PIC 9(8) COMP-X VALUE 1.
       03  GBOX1                           PIC 9(8) COMP-X VALUE 2.
       03  D-CONTRATO                      PIC 9(8) COMP-X VALUE 3.
       03  EF5                             PIC 9(8) COMP-X VALUE 4.
       03  EF14                            PIC 9(8) COMP-X VALUE 5.
       03  EF7                             PIC 9(8) COMP-X VALUE 6.
       03  D-CIDADE                        PIC 9(8) COMP-X VALUE 7.
       03  EF20                            PIC 9(8) COMP-X VALUE 8.
       03  SB3                             PIC 9(8) COMP-X VALUE 9.
       03  EF13                            PIC 9(8) COMP-X VALUE 10.
       03  EF21                            PIC 9(8) COMP-X VALUE 11.
       03  EF23                            PIC 9(8) COMP-X VALUE 12.
       03  EF22                            PIC 9(8) COMP-X VALUE 13.
       03  EF27                            PIC 9(8) COMP-X VALUE 14.
       03  EF6                             PIC 9(8) COMP-X VALUE 15.
       03  EF15                            PIC 9(8) COMP-X VALUE 16.
       03  EF28                            PIC 9(8) COMP-X VALUE 17.
       03  EF32                            PIC 9(8) COMP-X VALUE 18.
       03  EF33                            PIC 9(8) COMP-X VALUE 19.
       03  SB6                             PIC 9(8) COMP-X VALUE 20.
       03  EF9                             PIC 9(8) COMP-X VALUE 21.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
