---
title: System-specific configurations defined in SPECIAL-NAMES and their usage
---
This document will cover the system-specific configurations defined in the <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph and how they are used. We'll cover:

1. What is <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken>
2. Common configurations in <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken>
3. How these configurations are used in the codebase.

# What is <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken>

The <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph in COBOL is used to define system-specific configurations and special names that are used throughout the program. This can include settings for decimal points, class controls, and printer assignments.

# Common configurations in <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken>

In the provided context, the <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph includes several common configurations:

- <SwmToken path="src/conpro.cbl" pos="9:1:7" line-data="       DECIMAL-POINT IS COMMA.">`DECIMAL-POINT IS COMMA`</SwmToken>: This configuration changes the default decimal point from a period to a comma.
- <SwmToken path="src/conpro.cbl" pos="10:1:3" line-data="       class-control.">`class-control`</SwmToken>: This is used to define class names for GUI elements. For example, <SwmToken path="src/conpro.cbl" pos="11:1:1" line-data="           Window             is class &quot;wclass&quot;.">`Window`</SwmToken>` is class `<SwmToken path="src/conpro.cbl" pos="11:8:8" line-data="           Window             is class &quot;wclass&quot;.">`wclass`</SwmToken> and <SwmToken path="src/chp/chp040.CBL" pos="13:1:1" line-data="           AListview           is class &quot;alistview&quot;.">`AListview`</SwmToken>` is class `<SwmToken path="src/chp/chp040.CBL" pos="13:1:1" line-data="           AListview           is class &quot;alistview&quot;.">`AListview`</SwmToken>.
- <SwmToken path="src/chp/chp010.cbl" pos="11:1:5" line-data="         PRINTER IS LPRINTER.">`PRINTER IS LPRINTER`</SwmToken>: This assigns the logical printer name to a physical printer.

<SwmSnippet path="/src/conpro.cbl" line="8">

---

# Common configurations in <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken>

In this file, the <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph defines the decimal point as a comma and sets up a class control for a window.

```cobol
       SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.
       class-control.
           Window             is class "wclass".
```

---

</SwmSnippet>

<SwmSnippet path="/src/chp/chp010.cbl" line="9">

---

Here, the <SwmToken path="src/chp/chp010.cbl" pos="9:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph includes a printer assignment and class control for a window.

```cobol
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
           Window             is class "wclass".
```

---

</SwmSnippet>

<SwmSnippet path="/src/chp/chp040.CBL" line="8">

---

This file includes an additional class control for a list view in the <SwmToken path="src/chp/chp040.CBL" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph.

```cobol
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
           Window              is class "wclass"
           AListview           is class "alistview".
```

---

</SwmSnippet>

# How these configurations are used in the codebase

The configurations defined in the <SwmToken path="src/conpro.cbl" pos="8:1:3" line-data="       SPECIAL-NAMES.">`SPECIAL-NAMES`</SwmToken> paragraph are used throughout the COBOL program to ensure consistency and proper functionality. For example:

- The <SwmToken path="src/conpro.cbl" pos="9:1:7" line-data="       DECIMAL-POINT IS COMMA.">`DECIMAL-POINT IS COMMA`</SwmToken> setting ensures that all numeric values use a comma as the decimal separator, which is important for locales that use this format.
- The <SwmToken path="src/conpro.cbl" pos="10:1:3" line-data="       class-control.">`class-control`</SwmToken> settings are used to manage GUI elements, ensuring that windows and list views are properly instantiated and controlled.
- The <SwmToken path="src/chp/chp010.cbl" pos="11:1:5" line-data="         PRINTER IS LPRINTER.">`PRINTER IS LPRINTER`</SwmToken> setting ensures that print jobs are sent to the correct printer.

<SwmSnippet path="/src/cop/COP004T.CBL" line="8">

---

# How these configurations are used in the codebase

This file shows the use of the decimal point configuration and class control for a window.

```cobol
       DECIMAL-POINT IS COMMA.
       class-control.
           Window             is class "wclass".
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
