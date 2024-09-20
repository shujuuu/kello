---
title: Steps in SBP Payment Slip Generation
---
This document will cover the steps involved in SBP payment slip generation, focusing on:

1. Compliance checks
2. Templating.

# Compliance checks

Compliance checks are a crucial part of the SBP payment slip generation process. These checks ensure that the payment slips adhere to the regulatory standards set by the banking authorities. The compliance checks typically involve validating the format of the payment slip, verifying the accuracy of the data, and ensuring that all mandatory fields are filled correctly. This step helps in preventing errors and ensuring that the payment slips are legally compliant.

# Compliance checks

The compliance checks are implemented in the `src/compliance_checks.cbl` file. This section of the code validates the format and mandatory fields of the payment slip.

# Templating

Templating is the process of creating a standard layout for the SBP payment slips. This involves defining the structure and design of the payment slip, including the placement of fields such as the payer's information, payment details, and bank information. Templating ensures consistency across all payment slips and simplifies the generation process by using a predefined template.

# Templating

The templating logic is implemented in the `src/templating.cbl` file. This section of the code defines the layout and structure of the SBP payment slips.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
