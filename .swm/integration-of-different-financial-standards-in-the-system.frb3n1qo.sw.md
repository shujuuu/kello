---
title: Integration of different financial standards in the system
---
This document will cover how different financial standards like EDI transactions and SBP payment slips are integrated into the Kello Imagens system. We'll cover:

1. Overview of EDI Transactions
2. Overview of SBP Payment Slips
3. Integration Process

# Overview of EDI Transactions

Electronic Data Interchange (EDI) is a standard for exchanging business documents between organizations electronically. In the context of Kello Imagens, EDI transactions are used for bank-specific transactions, ensuring that data is transferred securely and efficiently between the system and financial institutions.

# Overview of SBP Payment Slips

SBP (Standard Bank Payment) payment slips are standardized documents used for processing payments. These slips contain all necessary information for a transaction, including payer details, amount, and due date. In Kello Imagens, SBP payment slips are generated automatically to streamline the payment process.

# Integration Process

The integration of EDI transactions and SBP payment slips in Kello Imagens involves several steps to ensure seamless operation and compliance with financial standards.

# Integration Process

The file `edi.cbl` contains the COBOL code responsible for handling EDI transactions. This includes parsing incoming EDI files, validating their content, and processing the transactions.

The file `sbp.cbl` contains the COBOL code for generating SBP payment slips. This includes formatting the slip according to the standard and populating it with transaction data.

The integration process ensures that both EDI transactions and SBP payment slips are handled correctly by the system. This involves validating the data, processing the transactions, and generating the necessary documents. By automating these processes, Kello Imagens improves efficiency and reduces the risk of errors.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
