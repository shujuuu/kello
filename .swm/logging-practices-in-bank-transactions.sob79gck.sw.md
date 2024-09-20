---
title: Logging Practices in Bank Transactions
---
This document will cover the practices for logging bank transactions, which includes:

1. Initializing the program
2. Main processing
3. Error handling.

<SwmSnippet path="/src/oep/oep030.cbl" line="266">

---

# Initializing the program

The <SwmToken path="src/oep/oep030.cbl" pos="266:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the program by accepting parameters from the command line, setting up various data blocks, and preparing the environment for processing bank transactions.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE HORA-REL TO HORA-RELA
           MOVE EMISSAO-REL TO EMISSAO-RELA.
           MOVE DATA-INV TO DATA-MOVTO-W DATA-MOVTO-REL.
           CALL "GRIDAT2"  USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CGD001" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CGD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010.
           MOVE "CGD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD020.
           MOVE "CXD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CXD020.
           MOVE "CAD018" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CAD018.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp020.cbl" line="272">

---

Similarly, the <SwmToken path="src/crp/crp020.cbl" pos="272:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section in <SwmToken path="src/oep/oep030.cbl" pos="680:4:4" line-data="                 MOVE &quot;CRP020&quot;    TO LOG3-PROGRAMA">`CRP020`</SwmToken> performs the same initialization tasks, ensuring that the environment is ready for processing.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE HORA-REL TO HORA-RELA
           MOVE EMISSAO-REL TO EMISSAO-RELA.
           MOVE DATA-INV TO DATA-MOVTO-W DATA-MOVTO-REL.
           CALL "GRIDAT2"  USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CGD001" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CGD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010.
           MOVE "CGD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD020.
           MOVE "CXD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CXD020.
           MOVE "CAD018" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CAD018.
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep030.cbl" line="395">

---

# Main processing

The <SwmToken path="src/oep/oep030.cbl" pos="395:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section handles the main processing logic. It evaluates different conditions and performs actions such as saving data, loading data, and excluding records.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   IF GS-PARCELA = 1 PERFORM GRAVA-PARCELAS
                   ELSE
                    PERFORM SALVAR-DADOS
                    IF GS-TIPO-GRAVACAO = 1
                       PERFORM REGRAVA-DADOS
                       PERFORM GRAVA-ANOTACAO
                    ELSE
                       PERFORM GRAVA-DADOS
                       PERFORM GRAVA-ANOTACAO-PRE-DEFINIDA
                    END-IF
                   END-IF
                   PERFORM LIMPAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-LOAD-FLG-TRUE
                   PERFORM CARREGAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp020.cbl" line="401">

---

In <SwmToken path="src/oep/oep030.cbl" pos="680:4:4" line-data="                 MOVE &quot;CRP020&quot;    TO LOG3-PROGRAMA">`CRP020`</SwmToken>, the <SwmToken path="src/crp/crp020.cbl" pos="401:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section also handles the main processing logic, performing similar actions based on evaluated conditions.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   MOVE "S" TO PRIMEIRA
                   IF GS-PARCELA = 1 PERFORM GRAVA-PARCELAS
                   ELSE
                    PERFORM SALVAR-DADOS
                    IF GS-TIPO-GRAVACAO = 1
                       PERFORM REGRAVA-DADOS
                       PERFORM GRAVA-ANOTACAO
                    ELSE
                       PERFORM GRAVA-DADOS
                       PERFORM GRAVA-ANOTACAO-PRE-DEFINIDA
                    END-IF
                   END-IF
                   PERFORM LIMPAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-LOAD-FLG-TRUE
                   PERFORM CARREGAR-DADOS
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep030.cbl" line="889">

---

# Error handling

The <SwmToken path="src/oep/oep030.cbl" pos="889:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section is responsible for error handling. It loads the error message and displays it to the user.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET
           MOVE "EXIBE-ERRO"  TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1             TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/crp/crp020.cbl" line="895">

---

In <SwmToken path="src/oep/oep030.cbl" pos="680:4:4" line-data="                 MOVE &quot;CRP020&quot;    TO LOG3-PROGRAMA">`CRP020`</SwmToken>, the <SwmToken path="src/crp/crp020.cbl" pos="895:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section performs the same error handling tasks, ensuring that any issues are communicated to the user.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET
           MOVE "EXIBE-ERRO"  TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1             TO ERRO-W.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
