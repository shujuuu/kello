---
title: Reason for and Differences in the Copy of cop104.cbl
---
This document will cover the reasons for creating a copy of the original <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> file and the differences between the original and the copied versions. We'll cover:

1. Why a copy of the original <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> file was created
2. Differences between the original and copied versions

# Why a copy of the original <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> file was created

A copy of the original <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> file was created to facilitate testing and development without affecting the production version. This allows developers to make changes, run tests, and debug the program in an isolated environment. The copied versions, <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> and <SwmPath>[tests/BUILD/cop104-2.cbl](tests/BUILD/cop104-2.cbl)</SwmPath>, are located in the <SwmPath>[tests/BUILD/](tests/BUILD/)</SwmPath> directory, indicating their use for testing purposes.

<SwmSnippet path="/tests/BUILD/cop104.cbl" line="6">

---

# Differences between the original and copied versions

The copied version <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> includes additional comments and modifications for testing purposes. For example, lines 6-8 contain comments that describe the program and its function, similar to the original but with added details for clarity.

```cobol
      *PROGRAMA: Relatório 05
      * LISTAR APENAS OS CONTRATOS ATIVOS, OU SEJA, STATUS => 50
      * - CONTRATOS A EXECUTAR SÃO OS CONTRATOS QUE NÃO FORAM VENDIDOS
```

---

</SwmSnippet>

<SwmSnippet path="/tests/BUILD/cop104.cbl" line="990">

---

Lines 990-999 in <SwmPath>[tests/BUILD/cop104.cbl](tests/BUILD/cop104.cbl)</SwmPath> include conditional display statements for debugging, which are not present in the original file. These lines help developers verify the values of certain variables during execution.

```cobol
*          IF USUARIO-W = "ANDER"
*             DISPLAY ERASE AT 0101
*             DISPLAY "GS-OP-FILTRO = " AT 0101
*             DISPLAY  GS-OP-FILTRO     AT 0125
*
*             DISPLAY "GS-BRINDE    = " AT 0201
*             DISPLAY  GS-BRINDES       AT 0225
*
*             STOP " "
*          END-IF
```

---

</SwmSnippet>

<SwmSnippet path="/tests/BUILD/cop104-2.cbl" line="1313">

---

In <SwmPath>[tests/BUILD/cop104-2.cbl](tests/BUILD/cop104-2.cbl)</SwmPath>, lines 1313-1335 include a new block of code added on <SwmToken path="tests/BUILD/cop104-2.cbl" pos="1329:14:18" line-data="      *&gt;Alteração a Pedido do Anderson dia 20/04/2010">`20/04/2010`</SwmToken>, as indicated by the comments. This block handles specific conditions and includes additional debugging information.

```cobol
      *>Bloco Novo
                       IF QT-FORM-WK-ATUAL = 0
                          MOVE QTDE-FORM-CO40  TO QT-FORM-WK-ATUAL
      *                ELSE
      *                   display "nr-contrato-co40 = " QT-FORM-WK-ATUAL
      *                           " QTDE-FORM-CO40 = " QTDE-FORM-CO40
      *                           STOP " "
                       END-IF

                       IF QTDE-FORM-INI-CO40 NOT > 0
                          MOVE QTDE-FORM-CO40 TO QT-FORM-WK-INI
                       ELSE
                          MOVE QTDE-FORM-INI-CO40 TO QT-FORM-WK-INI
                       END-IF
      *>Fim do Bloco Novo

      *>Alteração a Pedido do Anderson dia 20/04/2010
      *                MOVE QTDE-FORM-CO40        TO QT-FORM-WK-ATUAL
      *                IF QTDE-FORM-INI-CO40 NOT > 0
      *                   MOVE QTDE-FORM-CO40     TO QT-FORM-WK-INI
      *                ELSE
```

---

</SwmSnippet>

<SwmSnippet path="/tests/BUILD/cop104-2.cbl" line="1908">

---

Lines 1908-1931 in <SwmPath>[tests/BUILD/cop104-2.cbl](tests/BUILD/cop104-2.cbl)</SwmPath> show commented-out code and newly added computations for percentage calculations, which are not present in the original file. These changes were made on <SwmToken path="tests/BUILD/cop104-2.cbl" pos="1908:6:10" line-data="      *COMENTADO DIA 18/08/2011">`18/08/2011`</SwmToken>, as noted in the comments.

```cobol
      *COMENTADO DIA 18/08/2011
      *       MOVE 100                  TO GS-PERC-FOTO-PRODUZ
      ******************************************************************

              COMPUTE DIVISAO-W ROUNDED = GS-FOTO-PRODUZ /
                                (GS-FOTO-PRODUZ + GS-FOTO-EM-TRANSITO)
              COMPUTE PERC-W ROUNDED= DIVISAO-W * 100
              MOVE PERC-W TO GS-PERC-FOTO-PRODUZ
      *> CRIADO AGORA DIA 18/08/2011


              COMPUTE DIVISAO-W ROUNDED = GS-FOTO-PERD /
                                (GS-FOTO-PRODUZ + GS-FOTO-EM-TRANSITO)
              COMPUTE PERC-W ROUNDED= DIVISAO-W * 100
              MOVE PERC-W               TO GS-PERC-FOTO-PERD

              COMPUTE DIVISAO-W ROUNDED = GS-FOTO-EM-TRANSITO /
                            (GS-FOTO-PRODUZ + GS-FOTO-EM-TRANSITO)
              COMPUTE PERC-W ROUNDED= DIVISAO-W * 100
              MOVE PERC-W               TO GS-PERC-FOTO-EM-TRANSITO

```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
