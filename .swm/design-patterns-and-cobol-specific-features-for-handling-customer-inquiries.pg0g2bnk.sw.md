---
title: Design Patterns and COBOL-Specific Features for Handling Customer Inquiries
---
This document will cover how customer inquiries and issues are handled efficiently in the Kello Imagens system. We'll cover:

1. Design patterns used
2. COBOL-specific features employed
3. Examples and use cases.

# Design patterns used

In the Kello Imagens system, several design patterns are employed to handle customer inquiries and issues efficiently. One of the primary patterns used is the **Command Pattern**. This pattern encapsulates a request as an object, thereby allowing for parameterization of clients with queues, requests, and operations. It also provides support for undoable operations. This is particularly useful in a CRM-like application where customer inquiries and issues need to be tracked, managed, and potentially rolled back if necessary.

# COBOL-specific features employed

COBOL-85, the language used in Kello Imagens, has several features that are leveraged to handle customer inquiries and issues efficiently. One such feature is the **Indexed Files**. Indexed files allow for fast retrieval of records based on a key, which is essential for quickly accessing customer records and their inquiry history. Another feature is the **Report Writer** module, which is used for generating automatic reports based on customer inquiries and issues. This helps in maintaining a clear and organized record of all customer interactions.

# Examples and use cases

Consider a scenario where a customer raises an issue regarding a transaction. The system uses the Command Pattern to encapsulate this request, allowing it to be queued and processed asynchronously. The inquiry is stored in an indexed file, making it easy to retrieve and update as needed. If the issue requires generating a report, the Report Writer module is used to create a detailed report of the transaction and the steps taken to resolve the issue. This report can then be sent to the customer for their records.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
