---
title: Integration of Dialog System Functions into COBOL Programs
---
This document will cover how Dialog System functions are integrated into COBOL programs. We'll cover:

1. Overview of Dialog System functions
2. Integration points in COBOL programs
3. Example functions and their usage

# Overview of Dialog System functions

Dialog System functions in COBOL programs are used to manage user interfaces and interactions. These functions typically involve calling external routines to handle dialog boxes, user inputs, and other UI elements.

# Integration points in COBOL programs

Dialog System functions are integrated into COBOL programs at various points where user interaction is required. These functions are often called within specific sections of the COBOL code to handle tasks such as displaying messages, processing user inputs, and updating the UI.

<SwmSnippet path="/src/log002.cbl" line="407">

---

# Integration points in COBOL programs

The function <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> is an example of how Dialog System functions are integrated into COBOL programs. It evaluates the <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable and performs different actions based on its value, including calling other sections that handle specific tasks.

```cobol
       060-processar-cobol section.
           move spaces to mensagem
           evaluate fun-cobol
              when "A" perform 070-instanciar-Janela
                       perform montar-listview

              when "C" perform 060a-criticar-campo
              when "S" perform sugestao
              when "L" perform carregar-consulta
              when "e" perform tratar-eventos
              when "+" perform evento-alterados

           end-evaluate.
           move spaces to fun-cobol.
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="366">

---

The <SwmToken path="src/log002.cbl" pos="367:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> function is called within the <SwmToken path="src/log002.cbl" pos="368:1:7" line-data="       030-rotina-principal-fim.">`030-rotina-principal-fim`</SwmToken> section, which is part of the main routine of the program. This shows how Dialog System functions are integrated into the main flow of the COBOL program.

```cobol
           perform 050-call-dialog-system.
           perform 060-processar-cobol.
       030-rotina-principal-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/ccp/ccplog.cbl" line="550">

---

The <SwmToken path="src/ccp/ccplog.cbl" pos="550:1:5" line-data="       CALL-DIALOG-SYSTEM SECTION.">`CALL-DIALOG-SYSTEM`</SwmToken> function is another example of integrating Dialog System functions into COBOL programs. It calls the external routine <SwmToken path="src/ccp/ccplog.cbl" pos="551:4:4" line-data="           CALL &quot;DSRUN&quot; USING DS-CONTROL-BLOCK, GS-DATA-BLOCK.">`DSRUN`</SwmToken> using control and data blocks, and handles any errors that occur during the call.

```cobol
       CALL-DIALOG-SYSTEM SECTION.
           CALL "DSRUN" USING DS-CONTROL-BLOCK, GS-DATA-BLOCK.
           IF NOT DS-NO-ERROR
              MOVE DS-ERROR-CODE TO DISPLAY-ERROR-NO
              DISPLAY "DS ERROR NO:  " DISPLAY-ERROR-NO
             GO FINALIZAR-PROGRAMA
           END-IF.
```

---

</SwmSnippet>

<SwmSnippet path="/src/ccp/ccplog.cbl" line="275">

---

The <SwmToken path="src/ccp/ccplog.cbl" pos="276:3:7" line-data="           PERFORM CALL-DIALOG-SYSTEM.">`CALL-DIALOG-SYSTEM`</SwmToken> function is used within the <SwmToken path="src/ccp/ccplog.cbl" pos="3:6:6" line-data="       PROGRAM-ID. CCPLOG.">`CCPLOG`</SwmToken> section, demonstrating its integration into the program's flow.

```cobol
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/ccp/ccplog.cbl" line="288">

---

The <SwmToken path="src/ccp/ccplog.cbl" pos="289:3:7" line-data="           PERFORM CALL-DIALOG-SYSTEM.">`CALL-DIALOG-SYSTEM`</SwmToken> function is also used within the <SwmToken path="src/cop/cop106.cbl" pos="304:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section to display error messages.

```cobol
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/ccp/ccplog.cbl" line="314">

---

The <SwmToken path="src/ccp/ccplog.cbl" pos="315:3:7" line-data="           PERFORM CALL-DIALOG-SYSTEM">`CALL-DIALOG-SYSTEM`</SwmToken> function is used within the <SwmToken path="src/ccp/ccplog.cbl" pos="265:5:7" line-data="               WHEN GS-GERAR-RELATORIO-TRUE">`GERAR-RELATORIO`</SwmToken> section to handle report generation.

```cobol
           MOVE "TELA-AGUARDA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM
```

---

</SwmSnippet>

<SwmSnippet path="/src/ccp/ccplog.cbl" line="395">

---

The <SwmToken path="src/ccp/ccplog.cbl" pos="396:3:7" line-data="                PERFORM CALL-DIALOG-SYSTEM">`CALL-DIALOG-SYSTEM`</SwmToken> function is used within the <SwmToken path="src/log002.cbl" pos="530:3:5" line-data="                               perform mover-dados">`mover-dados`</SwmToken> section to handle data movement.

```cobol
                MOVE "TELA-AGUARDA1"    TO DS-PROCEDURE
                PERFORM CALL-DIALOG-SYSTEM
```

---

</SwmSnippet>

# Example functions and their usage

Here are some example functions and their usage in integrating Dialog System functions into COBOL programs:

<SwmSnippet path="/src/log002.cbl" line="424">

---

# Example functions and their usage

The <SwmToken path="src/log002.cbl" pos="424:1:5" line-data="       060a-criticar-campo section.">`060a-criticar-campo`</SwmToken> function is called by <SwmToken path="src/log002.cbl" pos="367:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> to handle field validation based on the <SwmToken path="src/log002.cbl" pos="425:3:5" line-data="           evaluate campo-critica">`campo-critica`</SwmToken> variable.

```cobol
       060a-criticar-campo section.
           evaluate campo-critica
              when "EF-DATA-INI"   PERFORM 060A-CRITICAR-DTINI
              when "EF-DATA-FIM"   PERFORM 060A-CRITICAR-DTFIM
           end-evaluate.
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="479">

---

The <SwmToken path="src/log002.cbl" pos="479:1:3" line-data="       carregar-consulta section.">`carregar-consulta`</SwmToken> function is called by <SwmToken path="src/log002.cbl" pos="367:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> to load query results into a list view. It performs various checks and updates the UI accordingly.

```cobol
       carregar-consulta section.
           invoke acp-listview "DeleteAll"

           if acp-usuario <> spaces
              perform listar-por-usuario
           else
              if acp-arquivo <> spaces
                 perform listar-por-arquivo
              else
                 if acp-operacao <> spaces
                    perform listar-por-operacao
                 else
                    move "Informar pelo menos o nome de um usuário ou um
      -                  " arquivo ou uma operaçã" to mensagem
                    move "C" to tipo-msg
                    perform 140-exibir-mensagem
                 end-if
              end-if
           end-if

           perform mostrar-fonte-favorita
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop106.cbl" line="238">

---

The <SwmToken path="src/cop/cop106.cbl" pos="238:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> function initializes the program, setting up necessary data blocks and calling external routines as needed.

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
           MOVE "CGD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CAD004"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD004.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop106.cbl" line="327">

---

The <SwmToken path="src/cop/cop106.cbl" pos="327:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> function contains the main logic of the program, including calls to various Dialog System functions to handle user interactions and data processing.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
                    PERFORM VERIFICAR-SENHA-STATUS
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    PERFORM GRAVA-WORK
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-CHAMAR-POP-UP-TRUE
                    PERFORM CHAMAR-POPUP
               WHEN GS-LE-DESCRICAO-TRUE
                    PERFORM LE-DESCRICAO
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop106.cbl" line="304">

---

The <SwmToken path="src/cop/cop106.cbl" pos="304:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> function is used to load and display error messages using Dialog System functions.

```cobol
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-COD106 <> "00"
              MOVE "ERRO ABERTURA COD106: "  TO GS-MENSAGEM-ERRO
              MOVE ST-COD106 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
