---
title: Purpose of primary financial operation COBOL files
---
This document will explain the purpose of some primary financial operation COBOL files, specifically <SwmPath>[src/acp/acp020.CBL](src/acp/acp020.CBL)</SwmPath> and <SwmPath>[src/crp/crp053.cbl](src/crp/crp053.cbl)</SwmPath>. We'll cover:

1. The purpose of <SwmPath>[src/acp/acp020.CBL](src/acp/acp020.CBL)</SwmPath>
2. The purpose of <SwmPath>[src/crp/crp053.cbl](src/crp/crp053.cbl)</SwmPath>

<SwmSnippet path="/src/acp/Acp010.cbl" line="2">

---

# The purpose of <SwmPath>[src/acp/acp020.CBL](src/acp/acp020.CBL)</SwmPath>

The file <SwmPath>[src/acp/acp020.CBL](src/acp/acp020.CBL)</SwmPath> is used for customer service operations. It is designed to handle customer service requests and manage customer interactions. The program is identified as <SwmToken path="src/acp/Acp010.cbl" pos="3:6:6" line-data="       PROGRAM-ID. ACP010.">`ACP010`</SwmToken> and was authored by Mareli Amâncio Volpato on <SwmToken path="src/acp/Acp010.cbl" pos="5:5:9" line-data="      *DATA: 14/03/2004">`14/03/2004`</SwmToken>.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ACP010.
      *AUTORA: MARELI AMANCIO VOLPATO
      *DATA: 14/03/2004
      *DESCRIï¿½ï¿½O: Cadastro de Tipo de atendimento ï¿½ cliente
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/Acp010.cbl" line="97">

---

The main process section of <SwmPath>[src/acp/acp020.CBL](src/acp/acp020.CBL)</SwmPath> initializes the program and performs the core operations until the exit flag is set to true. This indicates that the program runs in a loop to continuously handle customer service requests.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/Acp010.cbl" line="195">

---

The <SwmToken path="src/acp/Acp010.cbl" pos="195:1:3" line-data="       VALIDAR-ASSUNTO SECTION.">`VALIDAR-ASSUNTO`</SwmToken> section validates the subject of the customer service request, ensuring that the request is properly categorized and processed.

```cobol
       VALIDAR-ASSUNTO SECTION.
           MOVE GS-ASSUNTO(1:1) TO AUX-ASSUNTO
           IF AUX-ASSUNTO NOT NUMERIC
               MOVE "Assunto Invï¿½lido" TO MENSAGEM
               MOVE "C" TO TIPO-MSG
               PERFORM EXIBIR-MENSAGEM.

       EXIBIR-MENSAGEM SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp100.cbl" line="2">

---

# The purpose of <SwmPath>[src/crp/crp053.cbl](src/crp/crp053.cbl)</SwmPath>

The file <SwmPath>[src/crp/crp053.cbl](src/crp/crp053.cbl)</SwmPath> is used for managing financial receipts. It lists all the financial titles within a specified maturity range. The program is identified as <SwmToken path="src/crp/crp100.cbl" pos="3:6:6" line-data="       PROGRAM-ID. CRP100.">`CRP100`</SwmToken> and was authored by Mareli Amâncio Volpato on <SwmToken path="src/crp/crp100.cbl" pos="4:5:9" line-data="      *DATA: 20/04/1999">`20/04/1999`</SwmToken>.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRP100.
      *DATA: 20/04/1999
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: RECEBIMENTOS DE TÍTULOS
      *FUNÇÃO: Listar todos os títulos que estiverem dentro do intervalo
      *        de vencimento. As ordens serão: Vencto, Portador, cliente
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp100.cbl" line="210">

---

The main process section of <SwmPath>[src/crp/crp053.cbl](src/crp/crp053.cbl)</SwmPath> initializes the program and performs the core operations. This section sets up the environment and prepares the program to list financial titles.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.

       INICIALIZA-PROGRAMA SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp100.cbl" line="319">

---

The <SwmToken path="src/crp/crp100.cbl" pos="319:1:3" line-data="       BAIXAR-CONTAS SECTION.">`BAIXAR-CONTAS`</SwmToken> section handles the processing of financial accounts, ensuring that all relevant financial transactions are properly recorded and managed.

```cobol
       BAIXAR-CONTAS SECTION.
           CLOSE    CRD020 CRD020B
           OPEN I-O CRD020 CRD020B

           MOVE SPACES TO MENSAGEM

           MOVE 0   TO WSINDICE
                       GS-TOTAL-SELECIONADO

           INVOKE GS-LISTVIEW-BAIXA "Size" RETURNING WSSIZE

           PERFORM WSSIZE TIMES
               ADD 1 TO WSINDICE
               INVOKE GS-LISTVIEW-BAIXA "ITEMATINDEX" USING WSINDICE
                                                  RETURNING UMITEM
               IF UMITEM <> NULL
                  INITIALIZE WSCHECKENABLE
                  INVOKE UMITEM "GETCHECKBOXVALUE"
                         RETURNING WSCHECKENABLE
                  IF WSCHECKENABLE = 1
                     INVOKE UMITEM "GETCOLUMNVALUE"
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
