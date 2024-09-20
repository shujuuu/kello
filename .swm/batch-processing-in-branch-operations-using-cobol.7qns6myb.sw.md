---
title: Batch Processing in Branch Operations Using COBOL
---
This document will cover how batch processing is handled in branch operations using COBOL. We'll cover:

1. The role of the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section
2. How different operations are evaluated and performed
3. Examples of batch processing in different COBOL files.

# The role of the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section is a central part of batch processing in branch operations. It evaluates the <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable and performs different operations based on its value. This section is used in various COBOL files to handle different batch processing tasks.

<SwmSnippet path="/src/log002.cbl" line="407">

---

# The role of the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section evaluates the <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable and performs different operations based on its value. For example, when <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> is 'A', it performs <SwmToken path="src/log002.cbl" pos="410:9:13" line-data="              when &quot;A&quot; perform 070-instanciar-Janela">`070-instanciar-Janela`</SwmToken> and <SwmToken path="src/log002.cbl" pos="411:3:5" line-data="                       perform montar-listview">`montar-listview`</SwmToken>.

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

# How different operations are evaluated and performed

Within the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section, different operations are performed based on the value of <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. This is done using the <SwmToken path="src/log002.cbl" pos="409:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement, which acts like a switch-case statement in other programming languages.

<SwmSnippet path="/src/log002.cbl" line="424">

---

# How different operations are evaluated and performed

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section calls <SwmToken path="src/log002.cbl" pos="424:1:5" line-data="       060a-criticar-campo section.">`060a-criticar-campo`</SwmToken> when <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> is 'C'. This section evaluates the <SwmToken path="src/log002.cbl" pos="425:3:5" line-data="           evaluate campo-critica">`campo-critica`</SwmToken> variable and performs specific operations based on its value.

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

The <SwmToken path="src/log002.cbl" pos="479:1:3" line-data="       carregar-consulta section.">`carregar-consulta`</SwmToken> section is called when <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> is 'L'. It performs various operations to list data based on user, file, or operation.

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

# Examples of batch processing in different COBOL files

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section is used in various COBOL files to handle batch processing tasks. Here are some examples:

<SwmSnippet path="/src/kello/mtp062.CBL" line="234">

---

# Examples of batch processing in different COBOL files

In <SwmPath>[src/kello/mtp062.CBL](src/kello/mtp062.CBL)</SwmPath>, the <SwmToken path="src/kello/mtp062.CBL" pos="234:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section evaluates <SwmToken path="src/kello/mtp062.CBL" pos="235:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> and performs operations like <SwmToken path="src/kello/mtp062.CBL" pos="236:9:9" line-data="               when &quot;a&quot; perform centralizar">`centralizar`</SwmToken>, <SwmToken path="src/kello/mtp062.CBL" pos="237:9:11" line-data="               when &quot;C&quot; perform 110-criticar">`110-criticar`</SwmToken>, <SwmToken path="src/kello/mtp062.CBL" pos="238:9:11" line-data="               when &quot;S&quot; perform 200-sugestao">`200-sugestao`</SwmToken>, and more.

```cobol
       060-processar-cobol section.
           evaluate fun-cobol
               when "a" perform centralizar
               when "C" perform 110-criticar
               when "S" perform 200-sugestao
               when "N" perform 210-navegacao
               when "I" perform 500-incluir
               when "P" perform 700-imprimir-etiqueta
                        move spaces to arq-explorer
                           STRING
                        '"c:\program files\internet explorer\"'
      -                 'iexplore.exe file:///c:/tempsis/'
                                  usuario-w ".HTM" into arq-explorer
                        move "CHAMAR-EXPLORER" to ds-procedure
                        perform 050-call-dialog-system
               when "A" perform 061-anterior
               when "F" perform 062-proximo
               when "L" open output work
                        close       work
                        move 0 to etiquetas-movidas
                        move 1 to numero-pagina
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp062b.cbl" line="240">

---

In <SwmPath>[src/mtp/mtp062b.cbl](src/mtp/mtp062b.cbl)</SwmPath>, the <SwmToken path="src/mtp/mtp062b.cbl" pos="240:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section performs operations like <SwmToken path="src/mtp/mtp062b.cbl" pos="242:9:9" line-data="               when &quot;a&quot; perform centralizar">`centralizar`</SwmToken>, <SwmToken path="src/mtp/mtp062b.cbl" pos="243:9:11" line-data="               when &quot;C&quot; perform 110-criticar">`110-criticar`</SwmToken>, <SwmToken path="src/mtp/mtp062b.cbl" pos="244:9:11" line-data="               when &quot;S&quot; perform 200-sugestao">`200-sugestao`</SwmToken>, <SwmToken path="src/mtp/mtp062b.cbl" pos="245:9:11" line-data="               when &quot;N&quot; perform 210-navegacao">`210-navegacao`</SwmToken>, and more.

```cobol
       060-processar-cobol section.
           evaluate fun-cobol
               when "a" perform centralizar
               when "C" perform 110-criticar
               when "S" perform 200-sugestao
               when "N" perform 210-navegacao
               when "I" perform 500-incluir
               when "P"
      *                 if tipo-etiqueta = 1
      *                    perform 800-etiqueta-numerica
      *                 else
                           perform 700-imprimir-etiqueta
      *                 end-if

                        move spaces to arq-explorer
                           STRING
                        '"C:\Program Files (x86)\Google\Chrome\Applicati
      -                 'on\"' 'chrome file:///c:/tempsis/'
                                  usuario-w ".HTM" into arq-explorer

      *                 '"c:\program files\internet explorer\"'
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="126">

---

In <SwmPath>[src/cgp006t.cbl](src/cgp006t.cbl)</SwmPath>, the <SwmToken path="src/cgp006t.cbl" pos="126:1:5" line-data="       050-processar-cobol section.">`050-processar-cobol`</SwmToken> section evaluates <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> and performs operations like <SwmToken path="src/cgp006t.cbl" pos="128:9:9" line-data="                when &quot;a&quot; perform centralizar">`centralizar`</SwmToken>, <SwmToken path="src/cgp006t.cbl" pos="129:9:13" line-data="                when &quot;2&quot; perform 060-pagina-posterior">`060-pagina-posterior`</SwmToken>, <SwmToken path="src/cgp006t.cbl" pos="130:9:13" line-data="                when &quot;3&quot; perform 070-cursor-acima">`070-cursor-acima`</SwmToken>, and more.

```cobol
       050-processar-cobol section.
           evaluate fun-cobol
                when "a" perform centralizar
                when "2" perform 060-pagina-posterior
                when "3" perform 070-cursor-acima
                when "4" perform 080-cursor-abaixo
                when "5" perform 100-tratar-captura
                when "A" perform exibir-mensagem
           end-evaluate.
           move spaces to fun-cobol.
       050-processar-cobol-fim.
           exit.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
