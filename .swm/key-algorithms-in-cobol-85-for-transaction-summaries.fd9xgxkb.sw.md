---
title: Key algorithms in COBOL-85 for transaction summaries
---
This document will cover the key algorithms and methods employed in COBOL-85 for creating detailed transaction summaries, which includes:

1. The role of the <SwmToken path="src/mtp062a.cbl" pos="535:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> function
2. Key sub-functions called within <SwmToken path="src/mtp062a.cbl" pos="535:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken>

<SwmSnippet path="/src/mtp062a.cbl" line="565">

---

# The role of the <SwmToken path="src/mtp062a.cbl" pos="565:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> function

The <SwmToken path="src/mtp062a.cbl" pos="565:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> function is a central processing section that evaluates the <SwmToken path="src/mtp062a.cbl" pos="566:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable and performs various operations based on its value. This function is crucial for orchestrating different tasks required for transaction processing.

```cobol
       060-processar-cobol section.
           evaluate fun-cobol
               when "a" perform centralizar
               when "C" perform 110-criticar
               when "S" perform 200-sugestao
               when "N" perform 210-navegacao
               when "I" perform 500-incluir
               when "P" if tipo-etiqueta = 1
                           perform 800-etiqueta-numerica
                        else
                           perform 700-imprimir-etiqueta
                        end-if
               when "A" perform 061-anterior
               when "F" perform 062-proximo
               when "L" open output work
                        close       work
                        move 0 to etiquetas-movidas
                        move 1 to numero-pagina
                        move 1 to aux-numero-pagina
                        initialize pagina1
                        perform 063-carregar-pagina
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp062a.cbl" line="534">

---

The <SwmToken path="src/mtp062a.cbl" pos="535:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> function is invoked within the <SwmToken path="src/mtp062a.cbl" pos="536:1:7" line-data="       030-rotina-principal-fim.">`030-rotina-principal-fim`</SwmToken> section, indicating its role in the main routine of the program.

```cobol
           perform 050-call-dialog-system.
           perform 060-processar-cobol.
       030-rotina-principal-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp062a.cbl" line="807">

---

# Key sub-functions called within <SwmToken path="src/mtp062a.cbl" pos="535:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken>

The <SwmToken path="src/mtp062a.cbl" pos="807:1:3" line-data="       110-criticar section.">`110-criticar`</SwmToken> section is called within <SwmToken path="src/mtp062a.cbl" pos="535:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> to handle various types of data validation and criticism based on the <SwmToken path="src/mtp062a.cbl" pos="809:3:5" line-data="           evaluate    campo-critica">`campo-critica`</SwmToken> variable.

```cobol
       110-criticar section.
           move    spaces to mensagem.
           evaluate    campo-critica
               when "EF-CONTRATO"      perform 111-criticar-contrato
               when "EF-ALBUM-INI"     perform 112-criticar-album-ini
               when "EF-ALBUM-FIM"     perform 113-criticar-album-fim
               when "EF-QTDE-COPIAS"   perform 114-criticar-qtde-cop
               when "REGISTRO"         perform 111-criticar-contrato
                                          thru 114-criticar-qtde-cop
           end-evaluate.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp062a.cbl" line="873">

---

The <SwmToken path="src/mtp062a.cbl" pos="873:1:3" line-data="       200-sugestao section.">`200-sugestao`</SwmToken> section is called to handle suggestions, moving a predefined message to the <SwmToken path="src/mtp062a.cbl" pos="874:12:12" line-data="           move &quot;Sugestão Inexistente!&quot; to mensagem">`mensagem`</SwmToken> variable and setting the <SwmToken path="src/mtp062a.cbl" pos="875:9:11" line-data="           move &quot;C&quot; to tipo-msg">`tipo-msg`</SwmToken> variable.

```cobol
       200-sugestao section.
           move "Sugestão Inexistente!" to mensagem
           move "C" to tipo-msg
           perform 140-exibir-mensagem.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp062a.cbl" line="880">

---

The <SwmToken path="src/mtp062a.cbl" pos="880:1:3" line-data="       210-navegacao section.">`210-navegacao`</SwmToken> section is called to handle navigation-related tasks, setting appropriate messages and types.

```cobol
       210-navegacao section.
           move "Navegacão Inexistente!" to mensagem
           move "C" TO TIPO-MSG
           perform 140-exibir-mensagem.
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="407">

---

Another variant of the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> function in <SwmPath>[src/log002.cbl](src/log002.cbl)</SwmPath> includes additional operations like <SwmToken path="src/log002.cbl" pos="410:9:13" line-data="              when &quot;A&quot; perform 070-instanciar-Janela">`070-instanciar-Janela`</SwmToken> and <SwmToken path="src/log002.cbl" pos="411:3:5" line-data="                       perform montar-listview">`montar-listview`</SwmToken>, showing the flexibility and reuse of this function across different modules.

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

<SwmSnippet path="/src/log002.cbl" line="424">

---

The <SwmToken path="src/log002.cbl" pos="424:1:5" line-data="       060a-criticar-campo section.">`060a-criticar-campo`</SwmToken> section is called within <SwmToken path="src/mtp062a.cbl" pos="535:3:7" line-data="           perform 060-processar-cobol.">`060-processar-cobol`</SwmToken> to handle field-specific validations.

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

The <SwmToken path="src/log002.cbl" pos="479:1:3" line-data="       carregar-consulta section.">`carregar-consulta`</SwmToken> section is called to load consultation data, demonstrating the function's role in data retrieval and display.

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

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
