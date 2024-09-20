---
title: Generation of SBP Payment Slips
---
This document will cover the process of generating SBP payment slips, which includes:

1. Overview of SBP payment slips
2. Steps to generate SBP payment slips
3. Code references for generating SBP payment slips.

# Overview of SBP payment slips

SBP payment slips are standardized documents used for processing payments through the Brazilian Payment System (Sistema de Pagamentos Brasileiro - SBP). These slips contain essential information such as the payer's details, payment amount, due date, and a barcode for easy processing by banks.

# Steps to generate SBP payment slips

The process of generating SBP payment slips involves several steps:

1. Collecting necessary data: This includes gathering information about the payer, payment amount, due date, and other relevant details.
2. Formatting the data: The collected data needs to be formatted according to the SBP standards.
3. Generating the barcode: A barcode is generated based on the formatted data, which is used for processing the payment slip by banks.
4. Creating the payment slip document: The formatted data and barcode are combined to create the final payment slip document, which can be printed or sent electronically.

# Code references for generating SBP payment slips

The code in `src/sbp_payment_slip.cbl` handles the collection and formatting of data for SBP payment slips. It includes procedures for gathering payer details, payment amount, and due date, as well as formatting this information according to SBP standards.

The code in `src/sbp_barcode_generator.cbl` is responsible for generating the barcode based on the formatted data. This barcode is essential for the processing of the payment slip by banks.

The code in `src/sbp_payment_slip_document.cbl` combines the formatted data and generated barcode to create the final SBP payment slip document. This document can be printed or sent electronically to the payer.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
