---
title: Overview of Bank Transactions
---
Bank Transactions refer to the handling of electronic data interchange (EDI) transactions specific to banks.

These transactions are managed through COBOL programs that generate and process bank-specific files.

The files <SwmPath>[app/last_known_compilation/compiler_control_files/RITAU.LST](app/last_known_compilation/compiler_control_files/RITAU.LST)</SwmPath> and <SwmPath>[app/last_known_compilation/compiler_control_files/HSBC.LST](app/last_known_compilation/compiler_control_files/HSBC.LST)</SwmPath> are examples of bank-specific transaction files.

The COBOL programs <SwmPath>[src/banks/ritau2.cbl](src/banks/ritau2.cbl)</SwmPath> and <SwmPath>[src/banks/hsbc.cbl](src/banks/hsbc.cbl)</SwmPath> are responsible for processing these transactions.

## Bank-Specific Files

The file <SwmPath>[app/last_known_compilation/compiler_control_files/RITAU.LST](app/last_known_compilation/compiler_control_files/RITAU.LST)</SwmPath> is an example of a bank-specific transaction file used for processing transactions with a particular bank.

## COBOL Programs for Processing

The COBOL program <SwmPath>[src/banks/ritau2.cbl](src/banks/ritau2.cbl)</SwmPath> is responsible for processing transactions for the bank associated with the <SwmPath>[app/last_known_compilation/compiler_control_files/RITAU.LST](app/last_known_compilation/compiler_control_files/RITAU.LST)</SwmPath> file.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
