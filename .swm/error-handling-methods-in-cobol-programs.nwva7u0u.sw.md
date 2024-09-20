---
title: Error handling methods in COBOL programs
---
This document will cover the methods used for error handling across COBOL programs. We'll cover:

1. Error handling using the <SwmToken path="src/cgp006t.cbl" pos="127:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement
2. Error handling using the <SwmToken path="src/cgp006t.cbl" pos="128:7:7" line-data="                when &quot;a&quot; perform centralizar">`perform`</SwmToken> statement
3. Error handling using specific sections for error messages.

<SwmSnippet path="/src/cgp006t.cbl" line="127">

---

# Error handling using the <SwmToken path="src/cgp006t.cbl" pos="127:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement

The <SwmToken path="src/cgp006t.cbl" pos="127:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement is used to handle different cases based on the value of <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. Each <SwmToken path="src/cgp006t.cbl" pos="128:1:1" line-data="                when &quot;a&quot; perform centralizar">`when`</SwmToken> clause represents a different scenario, and the corresponding <SwmToken path="src/cgp006t.cbl" pos="128:7:7" line-data="                when &quot;a&quot; perform centralizar">`perform`</SwmToken> statement is executed. This allows for structured and readable error handling.

```cobol
           evaluate fun-cobol
                when "a" perform centralizar
                when "2" perform 060-pagina-posterior
                when "3" perform 070-cursor-acima
                when "4" perform 080-cursor-abaixo
                when "5" perform 100-tratar-captura
                when "A" perform exibir-mensagem
           end-evaluate.
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="409">

---

Another example of using the <SwmToken path="src/log002.cbl" pos="409:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement for error handling. Here, different actions are performed based on the value of <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>, including calling other sections like <SwmToken path="src/log002.cbl" pos="410:9:13" line-data="              when &quot;A&quot; perform 070-instanciar-Janela">`070-instanciar-Janela`</SwmToken> and <SwmToken path="src/log002.cbl" pos="413:9:13" line-data="              when &quot;C&quot; perform 060a-criticar-campo">`060a-criticar-campo`</SwmToken>.

```cobol
           evaluate fun-cobol
              when "A" perform 070-instanciar-Janela
                       perform montar-listview

              when "C" perform 060a-criticar-campo
              when "S" perform sugestao
              when "L" perform carregar-consulta
              when "e" perform tratar-eventos
              when "+" perform evento-alterados

           end-evaluate.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="153">

---

# Error handling using the <SwmToken path="src/cgp006t.cbl" pos="155:1:1" line-data="              perform 090-ler-pagina-posterior">`perform`</SwmToken> statement

The <SwmToken path="src/cgp006t.cbl" pos="155:1:1" line-data="              perform 090-ler-pagina-posterior">`perform`</SwmToken> statement is used to call specific sections of code that handle errors. For example, if the condition <SwmToken path="src/cgp006t.cbl" pos="153:3:17" line-data="           if st-cgd006 = &quot;00&quot; or &quot;02&quot;">`st-cgd006 = "00" or "02"`</SwmToken> is not met, the <SwmToken path="src/cgp006t.cbl" pos="159:3:5" line-data="                 perform mensagem-003.">`mensagem-003`</SwmToken> section is performed to handle the error.

```cobol
           if st-cgd006 = "00" or "02"
              move "N" to ja
              perform 090-ler-pagina-posterior
              move 1 to linha
           else
              if ja = "N"
                 perform mensagem-003.
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="479">

---

In this example, the <SwmToken path="src/log002.cbl" pos="483:1:1" line-data="              perform listar-por-usuario">`perform`</SwmToken> statement is used to handle different error scenarios by calling sections like <SwmToken path="src/log002.cbl" pos="483:3:7" line-data="              perform listar-por-usuario">`listar-por-usuario`</SwmToken>, <SwmToken path="src/log002.cbl" pos="486:3:7" line-data="                 perform listar-por-arquivo">`listar-por-arquivo`</SwmToken>, and <SwmToken path="src/log002.cbl" pos="489:3:7" line-data="                    perform listar-por-operacao">`listar-por-operacao`</SwmToken>. If none of these conditions are met, an error message is moved to <SwmToken path="src/log002.cbl" pos="492:16:16" line-data="      -                  &quot; arquivo ou uma operaçã&quot; to mensagem">`mensagem`</SwmToken> and displayed.

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
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp062b.cbl" line="562">

---

# Error handling using specific sections for error messages

Specific sections like <SwmToken path="src/mtp/mtp062b.cbl" pos="562:1:3" line-data="       200-sugestao section.">`200-sugestao`</SwmToken> are used to handle errors by moving error messages to the <SwmToken path="src/mtp/mtp062b.cbl" pos="563:12:12" line-data="           move &quot;Sugestão Inexistente!&quot; to mensagem">`mensagem`</SwmToken> variable and displaying them. This approach centralizes error handling and makes the code more maintainable.

```cobol
       200-sugestao section.
           move "Sugestão Inexistente!" to mensagem
           move "C" to tipo-msg
           perform 140-exibir-mensagem.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp062b.cbl" line="569">

---

Another example of using a specific section (<SwmToken path="src/mtp/mtp062b.cbl" pos="569:1:3" line-data="       210-navegacao section.">`210-navegacao`</SwmToken>) to handle errors by moving an error message to <SwmToken path="src/mtp/mtp062b.cbl" pos="570:12:12" line-data="           move &quot;Navegacão Inexistente!&quot; to mensagem">`mensagem`</SwmToken> and displaying it. This ensures that all error handling logic is contained within dedicated sections.

```cobol
       210-navegacao section.
           move "Navegacão Inexistente!" to mensagem
           move "C" TO TIPO-MSG
           perform 140-exibir-mensagem.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
