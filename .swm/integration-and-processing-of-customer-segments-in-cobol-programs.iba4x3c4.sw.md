---
title: Integration and Processing of Customer Segments in COBOL Programs
---
This document will cover how Customer Segments are integrated and processed within COBOL programs. We'll cover:

1. Integration of Customer Segments
2. Processing Customer Segments

# Integration of Customer Segments

Customer Segments are integrated into COBOL programs through various sections and functions that handle different operations. These segments are typically identified and processed based on specific keys or criteria.

<SwmSnippet path="/src/cgp006t.cbl" line="126">

---

# Integration of Customer Segments

The <SwmToken path="src/cgp006t.cbl" pos="126:1:5" line-data="       050-processar-cobol section.">`050-processar-cobol`</SwmToken> section evaluates the <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable and performs different operations based on its value. This section is crucial for integrating various functionalities, including those related to Customer Segments.

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
```

---

</SwmSnippet>

<SwmSnippet path="/src/log002.cbl" line="407">

---

In the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section, the <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable is evaluated to determine which operation to perform. This includes functions like <SwmToken path="src/log002.cbl" pos="415:9:11" line-data="              when &quot;L&quot; perform carregar-consulta">`carregar-consulta`</SwmToken>, which can be used to load customer data for processing.

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
```

---

</SwmSnippet>

# Processing Customer Segments

Once integrated, Customer Segments are processed through various COBOL sections that handle specific tasks such as data validation, navigation, and suggestions.

<SwmSnippet path="/src/log002.cbl" line="424">

---

# Processing Customer Segments

The <SwmToken path="src/log002.cbl" pos="424:1:5" line-data="       060a-criticar-campo section.">`060a-criticar-campo`</SwmToken> section evaluates the <SwmToken path="src/log002.cbl" pos="425:3:5" line-data="           evaluate campo-critica">`campo-critica`</SwmToken> variable to perform specific validation tasks. This is an example of how Customer Segments are processed for data integrity.

```cobol
       060a-criticar-campo section.
           evaluate campo-critica
              when "EF-DATA-INI"   PERFORM 060A-CRITICAR-DTINI
              when "EF-DATA-FIM"   PERFORM 060A-CRITICAR-DTFIM
           end-evaluate.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp062b.cbl" line="569">

---

The <SwmToken path="src/mtp/mtp062b.cbl" pos="569:1:3" line-data="       210-navegacao section.">`210-navegacao`</SwmToken> section handles navigation-related tasks, which can include navigating through different Customer Segments.

```cobol
       210-navegacao section.
           move "Navegacão Inexistente!" to mensagem
           move "C" TO TIPO-MSG
           perform 140-exibir-mensagem.
```

---

</SwmSnippet>

<SwmSnippet path="/src/mtp/mtp062b.cbl" line="562">

---

The <SwmToken path="src/mtp/mtp062b.cbl" pos="562:1:3" line-data="       200-sugestao section.">`200-sugestao`</SwmToken> section processes suggestions, which can be related to Customer Segments. It moves a message to the <SwmToken path="src/mtp/mtp062b.cbl" pos="563:12:12" line-data="           move &quot;Sugestão Inexistente!&quot; to mensagem">`mensagem`</SwmToken> variable and performs the <SwmToken path="src/mtp/mtp062b.cbl" pos="565:3:7" line-data="           perform 140-exibir-mensagem.">`140-exibir-mensagem`</SwmToken> section to display it.

```cobol
       200-sugestao section.
           move "Sugestão Inexistente!" to mensagem
           move "C" to tipo-msg
           perform 140-exibir-mensagem.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
