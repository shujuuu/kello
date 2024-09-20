---
title: Functionalities Implemented in cpp051.cbl to cpp063.cbl
---
This document will cover the functionalities implemented in the COBOL files from <SwmPath>[src/cpp/cpp051.cbl](src/cpp/cpp051.cbl)</SwmPath> to `cpp063.cbl`. We'll cover:

1. Overview of each file's purpose
2. Key functionalities and their implementations
3. Specific sections and their roles

# Overview of each file's purpose

The files <SwmPath>[src/cpp/cpp051.cbl](src/cpp/cpp051.cbl)</SwmPath> to `cpp063.cbl` implement various functionalities related to accounts payable, supplier statements, loan renegotiations, and payment reports. Each file has a specific purpose, such as listing open accounts payable, generating supplier statements, and handling loan renegotiations.

<SwmSnippet path="/src/cpp/cpp051.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp051.cbl](src/cpp/cpp051.cbl)</SwmPath> - Open Accounts Payable

This file lists all titles within the due date range, ordered by due date, bearer, supplier, and supplier type, and value.

```cobol
      *DATA: 21/07/1998
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: CONTAS A PAGAR EM ABERTO
      *FUNÇÃO: Listar todos os títulos que estiverem dentro do intervalo
      *        de vencimento. As ordens serão: Vencto, Portador, Forne-
      *        cedor e tipo-fornecedor, valor.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp051.cbl" line="695">

---

The section calculates the total overdue, total to be due, and total for the period based on the due date and current date.

```cobol
      *          READ WORK INVALID KEY
      *               INITIALIZE REG-WORK
      *          END-READ
      *
      *          IF VENCTO-WK < DATA-DIA-I
      *             COMPUTE CPP051-TOTAL-VENCIDO = CPP051-TOTAL-VENCIDO
      *                                          - VALOR-WK
      *          ELSE
      *             COMPUTE CPP051-TOTAL-AVENCER = CPP051-TOTAL-AVENCER
      *                                          - VALOR-WK
      *          END-IF
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp052.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp052.cbl](src/cpp/cpp052.cbl)</SwmPath> - Supplier Statement

This file generates an individual supplier statement listing all titles with status 0 (to pay) and 2 (paid) within the requested movement interval.

```cobol
      *DATA: 28/07/1998
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *FUNÇÃO: Extrato de Fornecedor individual
      *        Listar todos os títulos com situação = 0(pagar) e 2(pago)
      *        dentro do intervalo de movimento solicitado.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp052.cbl" line="590">

---

This section calculates the final date using the <SwmToken path="src/cpp/cpp052.cbl" pos="590:15:15" line-data="      *    MOVE CPP052-VENCTO2   TO CPP052-EMISSAO3 GRTIME-DATE.">`GRTIME`</SwmToken> function and updates the emission date.

```cobol
      *    MOVE CPP052-VENCTO2   TO CPP052-EMISSAO3 GRTIME-DATE.
      *    MOVE 1                TO GRTIME-TYPE GRTIME-FUNCTION.
      *    MOVE 30               TO GRTIME-DAYS.
      *    CALL "GRTIME" USING PARAMETROS-GRTIME.
      *    MOVE GRTIME-DATE-FINAL TO CPP052-VENCTO3.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp053.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp053.cbl](src/cpp/cpp053.cbl)</SwmPath> - Payment Bulletin

This file lists all titles that were paid within the requested movement interval, only listing titles with status 2 (paid).

```cobol
      *DATA: 23/07/1998
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *RELATÓRIO: Boletim de Pagamento
      *FUNÇÃO: Listar todos os títulos que foram pagos no intervalo
      *        de movimento solicitado. Lista apenas os títulos com
      *        situação = 2(pago)
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp053.cbl" line="268">

---

This section reads the records and writes them to the work file if they meet the criteria (status 2 and within the movement interval).

```cobol
       GRAVA-WORK SECTION.
           PERFORM INVERTE-DATA.
           IF ST-WORK NOT = "35"
              CLOSE       WORK
              DELETE FILE WORK.

           ACCEPT VARIA-W FROM TIME.

           OPEN OUTPUT WORK.
           CLOSE       WORK.
           OPEN I-O    WORK.

           INITIALIZE TOTAL-VALOR
                      TOTAL-PAGO

           MOVE "TELA-AGUARDA" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 0              TO SEQ-WK.
      *    MOVE 2              TO SITUACAO-CP20.
      *    MOVE MOVTO-INI      TO DATA-MOVTO-CP20.
      *    START CPD020 KEY IS NOT < ALT3-CP20 INVALID KEY
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp056.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp056.cbl](src/cpp/cpp056.cbl)</SwmPath> - Loan Renegotiation

This file lists all titles within the due date range, ordered by due date, bearer, supplier, and supplier type, and value. Only documents of type 'forecasted' and supplier type 3 (loans) are listed.

```cobol
      *DATA: 16/09/1998
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: Renegociação de Emprestimos - Sem retirada
      *FUNÇÃO: Listar todos os títulos que estiverem dentro do intervalo
      *        de vencimento. As ordens serão: Vencto, Portador, Forne-
      *        cedor e tipo-fornecedor, valor.
      *        Só serão listados doctos do tipo previsto e tipo-forn = 3
      *        Emprestimos.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp056.cbl" line="415">

---

This section moves the transaction date to the cash movement date.

```cobol
       GRAVA-CAIXA SECTION.
           MOVE DATA-MOVTO-I         TO DATA-MOV-CX100.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp057.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp057.cbl](src/cpp/cpp057.cbl)</SwmPath> - Loan Renegotiation without Automatic Withdrawal

This file handles the automatic renegotiation of all documents that are of type 'forecasted' and supplier type 3, with a due date less than or equal to the current date.

```cobol
      *DATA: 08/10/1998
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: Renegociação de Emprestimos - Sem retirada automático
      *FUNÇÃO: serão renegociados de forma automatica todos os doctos
      *        que são do tipo previsto e tipo-forn = 3, e a data de
      *        vencto <= data-dia.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp057.cbl" line="291">

---

This section moves the transaction date to the cash movement date.

```cobol
       ACHA-SEQ-CAIXA SECTION.
           MOVE DATA-DIA-INV         TO DATA-MOV-CX100.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp060.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp060.cbl](src/cpp/cpp060.cbl)</SwmPath> - Results Apportionment Report

This file generates a report of all movements within a requested interval of days. The account considered 100% is account <SwmToken path="src/cpp/cpp060.cbl" pos="9:9:15" line-data="      *        será a conta 1.01.00.00(260)-Entrada de recursos. As">`1.01.00.00`</SwmToken> (260) - Resource Entry. Percentages are rounded.

```cobol
      *DATA: 17/03/1999
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *RELATÓRIO: Relatório de Apuração de Resultados - Caixa - Int.dias
      *FUNÇÃO: Relaciona todo o movimento dentro de um intervalo de
      *        dias solicitado. A conta a ser considerada 100%
      *        será a conta 1.01.00.00(260)-Entrada de recursos. As
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp060.cbl" line="338">

---

This section evaluates the degree and totals the cash.

```cobol
       TOTALIZA-CAIXA SECTION.
           EVALUATE GRAU-WK
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp061.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp061.cbl](src/cpp/cpp061.cbl)</SwmPath> - Open Accounts Payable

This file lists all titles within the due date range, ordered by due date, bearer, supplier, and supplier type, and value.

```cobol
      *DATA: 21/07/1998
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: CONTAS A PAGAR EM ABERTO
      *FUNÇÃO: Listar todos os títulos que estiverem dentro do intervalo
      *        de vencimento. As ordens serão: Vencto, Portador, Forne-
      *        cedor e tipo-fornecedor, valor.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp061.cbl" line="557">

---

This section reads the supplier details and updates the description fields.

```cobol
      *    MOVE DATA-MOVTO-W       TO GS-DATA-MOVTO.
      *    MOVE FORNEC-CP20        TO GS-COD-FORN CODIGO-CG01.
      *    READ CGD001 INVALID KEY MOVE "****" TO NOME-CG01.
      *    MOVE NOME-CG01          TO GS-DESCR-FORN.
      *    MOVE TIPO-FORN-CP20     TO GS-TIPO-FORN CODIGO-TIPO.
      *    READ CAD019 INVALID KEY MOVE "****" TO NOME-TIPO.
      *    MOVE NOME-TIPO          TO GS-DESCR-TIPO-FORN.
      *    MOVE PORTADOR-CP20      TO GS-PORTADOR PORTADOR.
      *    READ CAD018 INVALID KEY MOVE "******" TO NOME-PORT.
      *    MOVE NOME-PORT          TO GS-DESCR-PORTADOR.
      *    MOVE NR-DOCTO-CP20      TO GS-NR-DOCTO.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp062.cbl" line="4">

---

# <SwmPath>[src/cpp/cpp062.cbl](src/cpp/cpp062.cbl)</SwmPath> - Total Accounts Payable

This file calculates the total accounts payable.

```cobol
      *DATA: 13/11/2000
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: TOTAL DE CONTAS A PAGAR
```

---

</SwmSnippet>

<SwmSnippet path="/src/cpp/cpp062.cbl" line="167">

---

This section calculates the total and updates the screen procedure.

```cobol
       CALCULA-TOTAL SECTION.
           MOVE "TELA-AGUARDA" TO DS-PROCEDURE.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
