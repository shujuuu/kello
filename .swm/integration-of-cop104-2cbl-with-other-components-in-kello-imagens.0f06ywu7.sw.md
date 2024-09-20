---
title: Integration of cop104-2.cbl with Other Components in Kello Imagens
---
This document will cover how the <SwmPath>[src/kello/cop104-2.cbl](src/kello/cop104-2.cbl)</SwmPath> file integrates with other components of the Kello Imagens system. We'll cover:

1. The purpose of <SwmPath>[src/kello/cop104-2.cbl](src/kello/cop104-2.cbl)</SwmPath>
2. How <SwmPath>[src/kello/cop104-2.cbl](src/kello/cop104-2.cbl)</SwmPath> interacts with other COBOL files
3. Key variables and their roles
4. Examples of integration points

<SwmSnippet path="/src/kello/cop104-2.cbl" line="6">

---

# The purpose of <SwmPath>[src/kello/cop104-2.cbl](src/kello/cop104-2.cbl)</SwmPath>

The <SwmPath>[src/kello/cop104-2.cbl](src/kello/cop104-2.cbl)</SwmPath> file is responsible for generating a specific report (Relatório 05) that lists only active contracts (status >= 50).

```cobol
      *PROGRAMA: Relatório 05
      * LISTAR APENAS OS CONTRATOS ATIVOS, OU SEJA, STATUS => 50
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-2.cbl" line="112">

---

# How <SwmPath>[src/kello/cop104-2.cbl](src/kello/cop104-2.cbl)</SwmPath> interacts with other COBOL files

The file calculates various metrics such as <SwmToken path="src/kello/cop104-2.cbl" pos="112:3:9" line-data="      *    QT-FOTOS-WK-ATUAL = QT-FORM-WK-ATUAL * prev-fotos-co05(cadastro padrao)">`QT-FOTOS-WK-ATUAL`</SwmToken>, <SwmToken path="src/kello/cop104-2.cbl" pos="120:3:7" line-data="           05  OBJ-VENDA-WK-ATUAL   PIC 9(8)V99.">`OBJ-VENDA-WK`</SwmToken>, and <SwmToken path="src/kello/cop104-2.cbl" pos="129:3:5" line-data="      *    PATROCINIO-WK = vlr-pago-wk + vlr-pagar-wk">`PATROCINIO-WK`</SwmToken>. These calculations are based on data that is likely shared or derived from other COBOL files in the system.

```cobol
      *    QT-FOTOS-WK-ATUAL = QT-FORM-WK-ATUAL * prev-fotos-co05(cadastro padrao)
           05  QT-FITAS-WK-INI      PIC 9(4).
           05  QT-FITAS-WK-ATUAL    PIC 9(4).
           05  QT-DVD-WK-INI        PIC 9(4).
           05  QT-DVD-WK-ATUAL      PIC 9(4).
           05  QT-POSTER-WK-INI     PIC 9(4).
           05  QT-POSTER-WK-ATUAL   PIC 9(4).
           05  MESANO-WK            PIC 9(6).
           05  OBJ-VENDA-WK-ATUAL   PIC 9(8)V99.
           05  OBJ-VENDA-WK-INI     PIC 9(8)V99.
      *    OBJ-VENDA-WK = QT-FOTOS-WK-ATUAL * 0,7 * preco-wk.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop102.cbl" line="76">

---

For example, <SwmPath>[src/kello/cop102.cbl](src/kello/cop102.cbl)</SwmPath> also calculates <SwmToken path="src/kello/cop102.cbl" pos="76:3:7" line-data="      *    QT-FOTOS-WK = qt-form-wk * prev-fotos-co05(cadastro padrao)">`QT-FOTOS-WK`</SwmToken> and <SwmToken path="src/kello/cop102.cbl" pos="82:3:7" line-data="           05  OBJ-VENDA-WK        PIC 9(7)V99.">`OBJ-VENDA-WK`</SwmToken>, indicating that these variables are part of a shared data model or calculation logic across multiple files.

```cobol
      *    QT-FOTOS-WK = qt-form-wk * prev-fotos-co05(cadastro padrao)
           05  MESANO-WK           PIC 9(6).
           05  ASSINATURA-WK       PIC 9(8).
           05  PRECO-WK            PIC 9(7)V99.
      *    se mesano-wk < 199506 preço-wk = 8,00
      *    senão                 preço-wk = 11,00
           05  OBJ-VENDA-WK        PIC 9(7)V99.
      *    OBJ-VENDA-WK = qt-fotos-wk * 0,7 * preco-wk.
           05  VLR-PAGO-WK         PIC 9(7)V99.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104.cbl" line="112">

---

Similarly, <SwmPath>[src/kello/cop104.cbl](src/kello/cop104.cbl)</SwmPath> performs the same calculations, reinforcing the idea that these files share common logic and data structures.

```cobol
      *    QT-FOTOS-WK-ATUAL = QT-FORM-WK-ATUAL * prev-fotos-co05(cadastro padrao)
           05  QT-FITAS-WK-INI      PIC 9(4).
           05  QT-FITAS-WK-ATUAL    PIC 9(4).
           05  QT-DVD-WK-INI        PIC 9(4).
           05  QT-DVD-WK-ATUAL      PIC 9(4).
           05  QT-POSTER-WK-INI     PIC 9(4).
           05  QT-POSTER-WK-ATUAL   PIC 9(4).
           05  MESANO-WK            PIC 9(6).
           05  OBJ-VENDA-WK-ATUAL   PIC 9(8)V99.
           05  OBJ-VENDA-WK-INI     PIC 9(8)V99.
      *    OBJ-VENDA-WK = QT-FOTOS-WK-ATUAL * 0,7 * preco-wk.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-2.cbl" line="129">

---

# Key variables and their roles

Variables like <SwmToken path="src/kello/cop104-2.cbl" pos="129:3:5" line-data="      *    PATROCINIO-WK = vlr-pago-wk + vlr-pagar-wk">`PATROCINIO-WK`</SwmToken> and <SwmToken path="src/kello/cop104-2.cbl" pos="132:3:7" line-data="      *    PAT-FORM-W = patrocinio-wk / QT-FORM-WK-ATUAL">`PAT-FORM-W`</SwmToken> are used to calculate sponsorship amounts and their distribution. These variables are crucial for the financial calculations in the report.

```cobol
      *    PATROCINIO-WK = vlr-pago-wk + vlr-pagar-wk
           05  PAT-FORM-WK-ATUAL    PIC 9(6)V99.
           05  PAT-FORM-WK-INI      PIC 9(6)V99.
      *    PAT-FORM-W = patrocinio-wk / QT-FORM-WK-ATUAL
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-2.cbl" line="1178">

---

Conditional logic based on <SwmToken path="src/kello/cop104-2.cbl" pos="1178:5:7" line-data="      *                              IF STATUS-CO40 &lt; 50">`STATUS-CO40`</SwmToken> is used to filter contracts, ensuring that only active contracts are included in the report.

```cobol
      *                              IF STATUS-CO40 < 50
      *                                 CONTINUE
      *                              ELSE
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-2.cbl" line="1316">

---

# Examples of integration points

The file includes display statements for debugging or logging purposes, such as displaying the contract number and form quantity. This helps in verifying the integration and data flow between different components.

```cobol
      *                ELSE
      *                   display "nr-contrato-co40 = " QT-FORM-WK-ATUAL
      *                           " QTDE-FORM-CO40 = " QTDE-FORM-CO40
      *                           STOP " "
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-2.cbl" line="1438">

---

Error handling and messaging are also integrated, as seen in the <SwmToken path="src/kello/cop104-2.cbl" pos="1438:3:5" line-data="      *                      INVALID KEY">`INVALID KEY`</SwmToken> section where specific messages are moved to <SwmToken path="src/kello/cop104-2.cbl" pos="1439:15:15" line-data="      *                      MOVE &quot;MTD020 Não Encontrado&quot; TO MENSAGEM">`MENSAGEM`</SwmToken> and displayed.

```cobol
      *                      INVALID KEY
      *                      MOVE "MTD020 Não Encontrado" TO MENSAGEM
      *                      MOVE "C"                     TO TIPO-MSG
      *                      PERFORM EXIBIR-MENSAGEM
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
