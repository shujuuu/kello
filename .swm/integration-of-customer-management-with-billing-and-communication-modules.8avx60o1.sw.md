---
title: Integration of Customer Management with billing and communication modules
---
This document will cover how Customer Management integrates with billing and communication modules. We'll cover:

1. Overview of Customer Management
2. Integration with Billing Module
3. Integration with Communication Module

# Overview of Customer Management

Customer Management in Kello Imagens is responsible for handling customer data, including personal information, account details, and interaction history. This module serves as the central repository for all customer-related information, ensuring that other modules can access and utilize this data efficiently.

# Integration with Billing Module

The integration between Customer Management and the Billing Module ensures that all billing-related activities are accurately linked to the correct customer accounts. This includes generating invoices, processing payments, and managing account balances. The Customer Management module provides the necessary customer data to the Billing Module, which then uses this information to perform its functions.

# Integration with Billing Module

In the `billing.cbl` file, the function `generate_invoice` retrieves customer data from the Customer Management module to create invoices. This ensures that each invoice is associated with the correct customer account.

# Integration with Communication Module

The Communication Module relies on the Customer Management module to obtain contact information and communication preferences for each customer. This integration allows the system to send notifications, updates, and other communications to customers based on their preferences and contact details stored in the Customer Management module.

# Integration with Communication Module

In the `communication.cbl` file, the function `send_notification` accesses customer contact information from the Customer Management module to send out notifications. This ensures that messages are sent to the correct recipients using their preferred communication channels.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
