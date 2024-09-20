---
title: Implementing Business Logic in the Procedure Division of cop104-2.cbl
---
This document will cover how the business logic is implemented in the Procedure Division of <SwmPath>[src/cop/cop104-2.cbl](src/cop/cop104-2.cbl)</SwmPath>. We'll cover:

1. Initialization of the program
2. Main processing logic
3. Error handling and messaging

<SwmSnippet path="/src/cop/cop104-2.cbl" line="647">

---

# Initialization of the program

The <SwmToken path="src/cop/cop104-2.cbl" pos="647:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes the program by accepting <SwmToken path="src/cop/cop104-2.cbl" pos="648:9:11" line-data="           ACCEPT PARAMETROS-W FROM COMMAND-LINE.">`COMMAND-LINE`</SwmToken> parameters, copying necessary data, and setting up various control blocks and paths. This sets the stage for the main processing logic.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CAD004"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD004.
           MOVE "CGD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CAD010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.
           MOVE "CAD012"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD012.
           MOVE "COD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD001.
           MOVE "COD002"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD002.
           MOVE "COD005"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD005.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop104-2.cbl" line="642">

---

The <SwmToken path="src/cop/cop104-2.cbl" pos="642:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> section calls <SwmToken path="src/cop/cop104-2.cbl" pos="643:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> to perform the initialization and then enters the main processing loop by calling <SwmToken path="src/cop/cop104-2.cbl" pos="644:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> until the exit flag is set.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop104-2.cbl" line="765">

---

# Main processing logic

The <SwmToken path="src/cop/cop104-2.cbl" pos="765:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main business logic. It uses an <SwmToken path="src/cop/cop104-2.cbl" pos="766:1:3" line-data="           EVALUATE TRUE">`EVALUATE TRUE`</SwmToken> statement to handle different conditions and perform corresponding actions such as centralizing data, verifying status, printing reports, and handling various flags.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
                    PERFORM VERIFICAR-SENHA-STATUS
               WHEN GS-PRINTER-FLG-TRUE
                    PERFORM IMPRIME-RELATORIO
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    MOVE "Deseja Realmente Carregar os Dados ?" TO
                    MENSAGEM
                    MOVE "Q" TO TIPO-MSG
                    PERFORM EXIBIR-MENSAGEM
                    IF RESP-MSG = "S"
                       PERFORM GRAVA-WORK
                       PERFORM ZERA-VARIAVEIS
                       PERFORM CARREGA-LISTA
                    END-IF
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-LE-REGIAO-TRUE
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop104-2.cbl" line="807">

---

The <SwmToken path="src/cop/cop104-2.cbl" pos="807:1:5" line-data="       VERIFICAR-SENHA-STATUS SECTION.">`VERIFICAR-SENHA-STATUS`</SwmToken> section is called within <SwmToken path="src/cop/cop104-2.cbl" pos="644:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> to verify user status by reading from the <SwmToken path="src/cop/cop104-2.cbl" pos="808:5:5" line-data="           OPEN INPUT CAD004">`CAD004`</SwmToken> file and enabling or disabling objects based on the result.

```cobol
       VERIFICAR-SENHA-STATUS SECTION.
           OPEN INPUT CAD004
           MOVE COD-USUARIO-W      TO COD-USUARIO-CA004
           MOVE "SENHA48"          TO PROGRAMA-CA004
           READ CAD004 INVALID KEY
               DISABLE-OBJECT PB9
           NOT INVALID KEY
               ENABLE-OBJECT PB9.

           CLOSE CAD004.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop104-2.cbl" line="2288">

---

The <SwmToken path="src/cop/cop104-2.cbl" pos="2288:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> section is responsible for printing reports. It loops until the required number of copies (<SwmToken path="src/cop/cop104-2.cbl" pos="2290:9:11" line-data="           PERFORM UNTIL QUANTIDADE = GS-COPIAS">`GS-COPIAS`</SwmToken>) is printed.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE 0 TO QUANTIDADE
           PERFORM UNTIL QUANTIDADE = GS-COPIAS
               ADD 1 TO QUANTIDADE
               PERFORM IMPRIMIR
           END-PERFORM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop104-2.cbl" line="952">

---

# Error handling and messaging

The <SwmToken path="src/cop/cop104-2.cbl" pos="952:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section handles error messaging by performing <SwmToken path="src/cop/cop104-2.cbl" pos="953:3:5" line-data="           PERFORM LOAD-SCREENSET.">`LOAD-SCREENSET`</SwmToken>, setting the procedure to <SwmToken path="src/cop/cop104-2.cbl" pos="954:4:6" line-data="           MOVE &quot;EXIBE-ERRO&quot; TO DS-PROCEDURE.">`EXIBE-ERRO`</SwmToken>, and calling the dialog system to display the error.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop104-2.cbl" line="846">

---

The <SwmToken path="src/cop/cop104-2.cbl" pos="776:3:5" line-data="                    PERFORM EXIBIR-MENSAGEM">`EXIBIR-MENSAGEM`</SwmToken> section is used to display messages to the user. It calls the <SwmToken path="src/cop/cop104-2.cbl" pos="774:1:1" line-data="                    MENSAGEM">`MENSAGEM`</SwmToken> program with the message type and content, then clears the message after displaying it.

```cobol
           MOVE SPACES      TO GS-LINHA-STATUS
           MOVE "LER-LINHA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM

           PERFORM UNTIL GS-LINHA-STATUS = SPACES
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
