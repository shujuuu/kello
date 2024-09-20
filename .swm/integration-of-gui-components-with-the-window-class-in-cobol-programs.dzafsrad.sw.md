---
title: Integration of GUI components with the Window class in COBOL programs
---
This document will cover how the <SwmToken path="src/cgp006t.cbl" pos="142:3:3" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`Window`</SwmToken> class integrates GUI components within COBOL programs. We'll cover:

1. Initializing the Window class
2. Handling GUI events
3. Centralizing the window on the desktop

<SwmSnippet path="/src/cgp006t.cbl" line="140">

---

# Initializing the Window class

The <SwmToken path="src/cgp006t.cbl" pos="142:3:3" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`Window`</SwmToken> class is initialized using the <SwmToken path="src/cgp006t.cbl" pos="142:6:6" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`fromHandleWithClass`</SwmToken> method. This method takes a window handle and returns an instance of the <SwmToken path="src/cgp006t.cbl" pos="142:3:3" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`Window`</SwmToken> class, which is stored in the <SwmToken path="src/cgp006t.cbl" pos="143:3:3" line-data="                 returning janelaPrincipal">`janelaPrincipal`</SwmToken> variable.

```cobol
          move-object-handle win1 handle8
          move handle8 to wHandle
          invoke Window "fromHandleWithClass" using wHandle Window
                 returning janelaPrincipal
```

---

</SwmSnippet>

<SwmSnippet path="/src/cgp006t.cbl" line="127">

---

# Handling GUI events

The <SwmToken path="src/cgp006t.cbl" pos="111:3:7" line-data="          perform 050-processar-cobol.">`050-processar-cobol`</SwmToken> section evaluates the <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> variable to determine which GUI event to handle. Depending on the value of <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>, different sections are performed, such as <SwmToken path="src/cgp006t.cbl" pos="128:9:9" line-data="                when &quot;a&quot; perform centralizar">`centralizar`</SwmToken>, <SwmToken path="src/cgp006t.cbl" pos="129:9:13" line-data="                when &quot;2&quot; perform 060-pagina-posterior">`060-pagina-posterior`</SwmToken>, <SwmToken path="src/cgp006t.cbl" pos="130:9:13" line-data="                when &quot;3&quot; perform 070-cursor-acima">`070-cursor-acima`</SwmToken>, and <SwmToken path="src/cgp006t.cbl" pos="131:9:13" line-data="                when &quot;4&quot; perform 080-cursor-abaixo">`080-cursor-abaixo`</SwmToken>.

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

<SwmSnippet path="/src/cgp006t.cbl" line="144">

---

# Centralizing the window on the desktop

The <SwmToken path="src/cgp006t.cbl" pos="145:3:3" line-data="          invoke janelaPrincipal &quot;CentralizarNoDesktop&quot;.">`janelaPrincipal`</SwmToken> object, which is an instance of the <SwmToken path="src/cgp006t.cbl" pos="142:3:3" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`Window`</SwmToken> class, calls the <SwmToken path="src/cgp006t.cbl" pos="145:6:6" line-data="          invoke janelaPrincipal &quot;CentralizarNoDesktop&quot;.">`CentralizarNoDesktop`</SwmToken> method to centralize the window on the desktop.

```cobol

          invoke janelaPrincipal "CentralizarNoDesktop".
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
