---
title: Performance Optimization in Accounts Receivable COBOL Programs
---
This document will cover how performance optimization is achieved in the Accounts Receivable COBOL programs. We'll cover:

1. Efficient data handling
2. Optimized control flow
3. Use of COBOL sections and paragraphs

<SwmSnippet path="/src/cgp006t.cbl" line="148">

---

# Efficient data handling

The <SwmToken path="src/cgp006t.cbl" pos="160:1:5" line-data="       060-pagina-posterior-fim.">`060-pagina-posterior`</SwmToken> section demonstrates efficient data handling by unlocking and initializing records, and using conditional logic to handle different states. This ensures that only necessary data is processed, reducing overhead.

```cobol
           unlock CGD006
           initialize reg-CGD006
           move "N" to exibe-pagina
           move string-1(1:6) to codigo-cg06
           start cgd006 key is not less chave-cg06
           if st-cgd006 = "00" or "02"
              move "N" to ja
              perform 090-ler-pagina-posterior
              move 1 to linha
           else
              if ja = "N"
                 perform mensagem-003.
       060-pagina-posterior-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="164">

---

The <SwmToken path="src/cgp006t.cbl" pos="177:1:5" line-data="       070-cursor-acima-fim.">`070-cursor-acima`</SwmToken> section efficiently handles data by moving and starting records based on specific keys. This targeted approach minimizes unnecessary data processing.

```cobol
           move "N" to exibe-pagina
           move string-1(1:6)   to codigo-cg06
           move tab-banco(1)    to banco-cg06
           move tab-agencia(1)  to agencia-cg06
           move tab-nr-conta(1) to nr-conta-cg06
           start cgd006 key is less than chave-cg06
           if st-cgd006 = "00" or "02"
              move "N" to ja
              perform 090-ler-pagina-posterior
              move 1 to linha
           else
              if ja = "N"
                 perform mensagem-002.
       070-cursor-acima-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="181">

---

The <SwmToken path="src/cgp006t.cbl" pos="194:1:5" line-data="       080-cursor-abaixo-fim.">`080-cursor-abaixo`</SwmToken> section further optimizes data handling by using conditional checks and performing specific actions based on the state of the data. This ensures that only relevant data is processed.

```cobol
           move "N" to exibe-pagina
           move string-1(1:6)   to codigo-cg06
           move tab-banco(1)    to banco-cg06
           move tab-agencia(1)  to agencia-cg06
           move tab-nr-conta(1) to nr-conta-cg06
           start CGD006 key is greater than chave-cg06
           if ST-CGD006 = "00" or "02"
              move "N" to ja
              perform 090-ler-pagina-posterior
              move 12 to linha
           else
              if ja = "N"
                 perform mensagem-003.
       080-cursor-abaixo-fim.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="127">

---

# Optimized control flow

The <SwmToken path="src/cgp006t.cbl" pos="136:1:5" line-data="       050-processar-cobol-fim.">`050-processar-cobol`</SwmToken> section uses the <SwmToken path="src/cgp006t.cbl" pos="127:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement to control the flow of the program based on the value of <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. This structured approach allows for efficient branching and reduces the complexity of the control flow.

```cobol
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
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="139">

---

# Use of COBOL sections and paragraphs

The <SwmToken path="src/cgp006t.cbl" pos="139:1:1" line-data="       CENTRALIZAR SECTION.">`CENTRALIZAR`</SwmToken> section demonstrates the use of COBOL sections and paragraphs to modularize the code. This modular approach allows for better organization and reusability of code, which can lead to performance improvements.

```cobol
       CENTRALIZAR SECTION.
          move-object-handle win1 handle8
          move handle8 to wHandle
          invoke Window "fromHandleWithClass" using wHandle Window
                 returning janelaPrincipal

          invoke janelaPrincipal "CentralizarNoDesktop".
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="407">

---

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section in <SwmPath>[src/log002.cbl](src/log002.cbl)</SwmPath> shows how different actions are performed based on the value of <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. This modular approach helps in optimizing the performance by executing only the necessary code.

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

<SwmSnippet path="/src/mtp/mtp062b.cbl" line="240">

---

The <SwmToken path="src/mtp/mtp062b.cbl" pos="240:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section in <SwmPath>[src/mtp/mtp062b.cbl](src/mtp/mtp062b.cbl)</SwmPath> uses the <SwmToken path="src/mtp/mtp062b.cbl" pos="241:1:1" line-data="           evaluate fun-cobol">`evaluate`</SwmToken> statement to handle different cases efficiently. This reduces the complexity and improves the performance of the program.

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

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
