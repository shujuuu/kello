---
title: Handling Bank-Specific EDI Transactions Securely and Efficiently
---
This document will cover how bank-specific EDI transactions are handled securely and efficiently. We'll cover:

1. Initialization of the program
2. Main processing of the program
3. Error handling and messaging

<SwmSnippet path="/src/oep/oep030.cbl" line="266">

---

# Initialization of the program

The <SwmToken path="src/oep/oep030.cbl" pos="266:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the program by accepting parameters from the command line and setting up various data blocks and control blocks. This ensures that the program starts with a clean and controlled environment.

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

Similarly, the <SwmToken path="src/crp/crp020.cbl" pos="272:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section in <SwmToken path="src/oep/oep030.cbl" pos="680:4:4" line-data="                 MOVE &quot;CRP020&quot;    TO LOG3-PROGRAMA">`CRP020`</SwmToken> initializes the program by accepting parameters and setting up necessary data blocks. This is crucial for maintaining consistency and reliability across different program executions.

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

# Main processing of the program

The <SwmToken path="src/oep/oep030.cbl" pos="395:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section handles the main processing logic. It evaluates various conditions and performs corresponding actions such as saving data, loading data, and excluding records. This section ensures that the core functionalities are executed efficiently.

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

In <SwmToken path="src/oep/oep030.cbl" pos="680:4:4" line-data="                 MOVE &quot;CRP020&quot;    TO LOG3-PROGRAMA">`CRP020`</SwmToken>, the <SwmToken path="src/crp/crp020.cbl" pos="401:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section also evaluates conditions and performs actions like saving and loading data. This section is essential for executing the main business logic of the program.

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

# Error handling and messaging

The <SwmToken path="src/oep/oep030.cbl" pos="889:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section is responsible for loading error messages and displaying them to the user. This ensures that any issues encountered during processing are communicated effectively, allowing for prompt resolution.

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

Similarly, the <SwmToken path="src/crp/crp020.cbl" pos="895:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section in <SwmToken path="src/oep/oep030.cbl" pos="680:4:4" line-data="                 MOVE &quot;CRP020&quot;    TO LOG3-PROGRAMA">`CRP020`</SwmToken> handles error messaging. This consistency in error handling across different programs ensures a reliable user experience.

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
