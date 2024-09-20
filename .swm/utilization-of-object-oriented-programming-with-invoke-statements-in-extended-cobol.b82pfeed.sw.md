---
title: >-
  Utilization of object-oriented programming with invoke statements in Extended
  COBOL
---
This document will cover how to utilize object-oriented programming with invoke statements in Extended COBOL. We'll cover:

1. What is the <SwmToken path="src/cxp/cxp001.CBL" pos="9:1:3" line-data="       class-control.">`class-control`</SwmToken> paragraph
2. How to define classes in COBOL
3. How to use the <SwmToken path="src/cxp/cxp001.CBL" pos="170:1:1" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`invoke`</SwmToken> statement to call methods

<SwmSnippet path="/src/cxp/cxp001.CBL" line="9">

---

# What is the <SwmToken path="src/cxp/cxp001.CBL" pos="9:1:3" line-data="       class-control.">`class-control`</SwmToken> paragraph

The <SwmToken path="src/cxp/cxp001.CBL" pos="9:1:3" line-data="       class-control.">`class-control`</SwmToken> paragraph is used to declare classes in COBOL. In this example, the <SwmToken path="src/cxp/cxp001.CBL" pos="10:1:1" line-data="           Window             is class &quot;wclass&quot;.">`Window`</SwmToken> class is declared as <SwmToken path="src/cxp/cxp001.CBL" pos="10:8:8" line-data="           Window             is class &quot;wclass&quot;.">`wclass`</SwmToken>.

```cobol
       class-control.
           Window             is class "wclass".
```

---

</SwmSnippet>

# How to define classes in COBOL

In Extended COBOL, classes are defined using the <SwmToken path="src/cxp/cxp001.CBL" pos="9:1:3" line-data="       class-control.">`class-control`</SwmToken> paragraph. This paragraph is part of the <SwmToken path="src/cxp/cxp001.CBL" pos="8:1:3" line-data="       ENVIRONMENT DIVISION.">`ENVIRONMENT DIVISION`</SwmToken>. For example, <SwmToken path="src/cxp/cxp001.CBL" pos="10:1:1" line-data="           Window             is class &quot;wclass&quot;.">`Window`</SwmToken>` is class `<SwmToken path="src/cxp/cxp001.CBL" pos="10:8:8" line-data="           Window             is class &quot;wclass&quot;.">`wclass`</SwmToken> declares a class named <SwmToken path="src/cxp/cxp001.CBL" pos="10:1:1" line-data="           Window             is class &quot;wclass&quot;.">`Window`</SwmToken> with the class identifier <SwmToken path="src/cxp/cxp001.CBL" pos="10:8:8" line-data="           Window             is class &quot;wclass&quot;.">`wclass`</SwmToken>.

# How to use the <SwmToken path="src/cxp/cxp001.CBL" pos="170:1:1" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`invoke`</SwmToken> statement to call methods

The <SwmToken path="src/cxp/cxp001.CBL" pos="170:1:1" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`invoke`</SwmToken> statement in COBOL is used to call methods on objects. This is similar to calling methods in other object-oriented languages. For example, if you have an object `myWindow` of class <SwmToken path="src/cxp/cxp001.CBL" pos="10:1:1" line-data="           Window             is class &quot;wclass&quot;.">`Window`</SwmToken>, you can call its method <SwmToken path="src/cxp/cxp001.CBL" pos="112:1:1" line-data="           OPEN INPUT CAD002 CXD020.">`OPEN`</SwmToken> using <SwmToken path="src/cxp/cxp001.CBL" pos="170:1:1" line-data="          invoke Window &quot;fromHandleWithClass&quot; using wHandle Window">`invoke`</SwmToken>` myWindow `<SwmToken path="src/cxp/cxp001.CBL" pos="112:1:1" line-data="           OPEN INPUT CAD002 CXD020.">`OPEN`</SwmToken>.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
