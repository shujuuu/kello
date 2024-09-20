---
title: Accounts Control Overview
---
Accounts Control refers to the management and oversight of financial accounts within the Kello Imagens system.

It involves handling various operations related to accounts, such as tracking account balances, processing transactions, and generating financial reports.

The functionality is implemented using COBOL-85, with specific programs and copybooks dedicated to different aspects of accounts management.

For instance, the <SwmPath>[src/acp/](src/acp/)</SwmPath> directory contains multiple COBOL programs and copybooks that are likely involved in different operations related to accounts control.

These programs and copybooks work together to ensure accurate and efficient management of financial data, supporting the overall business operations of Kello Imagens.

<SwmSnippet path="/src/acp/ACP100/DSLANG.CPY" line="13">

---

## Steps to Use Accounts Control

This section outlines the steps to use the vocabulary for Accounts Control, providing guidance on how to interact with the system.

```cobol
      *> Please use and evaluate Early Release features     *
      *> and tell Micro Focus what you think. However,      *
      *> do not rely on these features being supported      *
      *> in future products from Micro Focus.               *
      *>                                                    *
      *>----------------------------------------------------*
      *>                                                    *
      *>                                                    *
      *> Including this copyfile will allow selected        *
      *> Dialog System functions to be embedded in          *
      *> your COBOL program.                                *
      *>                                                    *
      *> The syntax, and number of parameters for each      *
      *> function is the same as in Dialog system.          *
      *> However the types of parameters allowed is not     *
      *> as extensive.                                      *
      *>                                                    *
      *> e.g. any function which returns an integer         *
      *>      value, i.e. GET-LIST-ITEM-STATE,              *
      *>      expects the return variable to be a           *
      *>      PIC 9(8) COMP-X data item.                    *
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/ACP100/DS-CNTRL.MF" line="4">

---

## Dialog System Control Block

This file includes the Dialog System Control Block, which is essential for managing the control flow and constants used in Accounts Control operations.

```mf
      *  Dialog System Control Block (Using Micro Focus Constants).
      *
      *  For use with Dialog System Version 2.
      *
      *****************************************************************

       01  DS-CONTROL-BLOCK.
           03  DS-VERSION-NUMBERS.
               05  DS-DATA-BLOCK-VERSION-NO    PIC 9(8) COMP-5.
               05  DS-VERSION-NO               PIC 9(2) COMP-X.
               05  FILLER                      PIC X.
           03  DS-OUTPUT-FIELDS.
               05  DS-SYSTEM-ERROR.
                 07  DS-ERROR-CODE             PIC 9(4) COMP-5.
                   88  DS-NO-ERROR               VALUE 0.
                   88  DS-NOT-INITIALISED        VALUE 1.
                   88  DS-CANNOT-OPEN-SET        VALUE 2.
                   88  DS-ERROR-READING-FILE     VALUE 3.
                   88  DS-INVALID-SET            VALUE 4.
                   88  DS-CANNOT-CREATE-PANEL    VALUE 5.
                   88  DS-DYNAMIC-ERROR          VALUE 6.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
