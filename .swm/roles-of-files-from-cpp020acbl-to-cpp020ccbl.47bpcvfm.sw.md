---
title: Roles of Files from cpp020a.cbl to cpp020c.cbl
---
This document will cover the specific roles of the files from <SwmPath>[src/cpp/cpp020a.cbl](src/cpp/cpp020a.cbl)</SwmPath> to <SwmPath>[src/cpp/cpp020c.cbl](src/cpp/cpp020c.cbl)</SwmPath> in the Kello Imagens system. We'll cover:

1. The purpose of each file
2. Key functionalities and processes handled by these files
3. How these files interact with each other and the system

<SwmSnippet path="/src/cpp/cpp020a.cbl" line="4">

---

# Purpose of Each File

The file <SwmPath>[src/cpp/cpp020a.cbl](src/cpp/cpp020a.cbl)</SwmPath> is responsible for handling the 'Movimento de contas a pagar' (Accounts Payable Movements). It includes functionalities for managing permanent accounts, such as inclusion, alteration, suspension, and cancellation of accounts.

```cobol
      *AUTORA: MARELI AMANCIO VOLPATO
      *DATA: 13/07/1998
      *FUNÇÃO: Movimento de contas a pagar
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020b.cbl" line="4">

---

The file <SwmPath>[src/cpp/cpp020b.cbl](src/cpp/cpp020b.cbl)</SwmPath> also deals with 'Movimento de contas a pagar' (Accounts Payable Movements). It shares similar responsibilities with <SwmPath>[src/cpp/cpp020a.cbl](src/cpp/cpp020a.cbl)</SwmPath>, focusing on the same set of operations for permanent accounts.

```cobol
      *AUTORA: MARELI AMANCIO VOLPATO
      *DATA: 13/07/1998
      *FUNÇÃO: Movimento de contas a pagar
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020c.cbl" line="1">

---

The file <SwmPath>[src/cpp/cpp020c.cbl](src/cpp/cpp020c.cbl)</SwmPath> continues the handling of 'Movimento de contas a pagar' (Accounts Payable Movements). It includes additional functionalities and processes related to the management of permanent accounts.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CPP020C.
      *AUTORA: MARELI AMANCIO VOLPATO
      *DATA: 13/07/1998
      *FUNÇÃO: Movimento de contas a pagar
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020a.cbl" line="8">

---

# Key Functionalities and Processes

In <SwmPath>[src/cpp/cpp020a.cbl](src/cpp/cpp020a.cbl)</SwmPath>, the inclusion process involves adding 13 months of entries (one definitive and 12 provisional). It checks for existing entries with the same supplier/document key and status, preventing duplicates. Alterations update 12 entries, and suspensions or exclusions remove 12 entries.

```cobol
      *-Para lançamento de contas permanentes - Caso seja inclusão -
      * incluir 13 meses(sendo o 1o.mês definitivo os demais previsto),
      * e verificar se existe a chave=fornecedor/docto e situação = 0 ou
      * = 1, caso afirmativo
      * não permitir a inclusão(solicitar mudança no nr.docto)
      * caso Alteração - alterar os 12 lançamentos c/ os novos dados
      * caso exclusão/suspensão- excluir/suspender os 12 lançamentos
      * Em caso de alteração de previsto p/ definitivo incluir uma
      * parcela(tendo assim sempre 12 prevista). E em caso de alteraçao
      * perguntar se a alteração é em uma parcela ou em todas)
      * Caso cancelamento - não permitir
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020b.cbl" line="8">

---

Similarly, <SwmPath>[src/cpp/cpp020b.cbl](src/cpp/cpp020b.cbl)</SwmPath> handles the inclusion, alteration, suspension, and exclusion of permanent accounts. It ensures that the operations are consistent across the system.

```cobol
      *-Para lançamento de contas permanentes - Caso seja inclusão -
      * incluir 13 meses(sendo o 1o.mês definitivo os demais previsto),
      * e verificar se existe a chave=fornecedor/docto e situação = 0 ou
      * = 1, caso afirmativo
      * não permitir a inclusão(solicitar mudança no nr.docto)
      * caso Alteração - alterar os 12 lançamentos c/ os novos dados
      * caso exclusão/suspensão- excluir/suspender os 12 lançamentos
      * Em caso de alteração de previsto p/ definitivo incluir uma
      * parcela(tendo assim sempre 12 prevista). E em caso de alteraçao
      * perguntar se a alteração é em uma parcela ou em todas)
      * Caso cancelamento - não permitir
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020c.cbl" line="7">

---

The file <SwmPath>[src/cpp/cpp020c.cbl](src/cpp/cpp020c.cbl)</SwmPath> also manages the inclusion, alteration, suspension, and exclusion of permanent accounts. It includes additional checks and processes to maintain data integrity.

```cobol
      *-Para lançamento de contas permanentes - Caso seja inclusão -
      * incluir 13 meses(sendo o 1o.mês definitivo os demais previsto),
      * e verificar se existe a chave=fornecedor/docto e situação = 0 ou
      * = 1, caso afirmativo
      * não permitir a inclusão(solicitar mudança no nr.docto)
      * caso Alteração - alterar os 12 lançamentos c/ os novos dados
      * caso exclusão/suspensão- excluir/suspender os 12 lançamentos
      * Em caso de alteração de previsto p/ definitivo incluir uma
      * parcela(tendo assim sempre 12 prevista). E em caso de alteraçao
      * perguntar se a alteração é em uma parcela ou em todas)
      * Caso cancelamento - não permitir
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020a.cbl" line="214">

---

# Interaction with the System

In <SwmPath>[src/cpp/cpp020a.cbl](src/cpp/cpp020a.cbl)</SwmPath>, the <SwmToken path="src/cpp/cpp020a.cbl" pos="214:11:13" line-data="      *    ACCEPT PARAMETROS-W FROM COMMAND-LINE.">`COMMAND-LINE`</SwmToken> parameters are accepted and processed to perform various operations on the accounts.

```cobol
      *    ACCEPT PARAMETROS-W FROM COMMAND-LINE.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020b.cbl" line="218">

---

Similarly, <SwmPath>[src/cpp/cpp020b.cbl](src/cpp/cpp020b.cbl)</SwmPath> accepts <SwmToken path="src/cpp/cpp020b.cbl" pos="218:11:13" line-data="      *    ACCEPT PARAMETROS-W FROM COMMAND-LINE.">`COMMAND-LINE`</SwmToken> parameters to execute the required operations on the accounts.

```cobol
      *    ACCEPT PARAMETROS-W FROM COMMAND-LINE.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp020c.cbl" line="242">

---

In <SwmPath>[src/cpp/cpp020c.cbl](src/cpp/cpp020c.cbl)</SwmPath>, the linkage section and procedure division handle the interaction with other parts of the system, ensuring that the operations on accounts are executed correctly.

```cobol
       LINKAGE SECTION.
       PROCEDURE DIVISION.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
