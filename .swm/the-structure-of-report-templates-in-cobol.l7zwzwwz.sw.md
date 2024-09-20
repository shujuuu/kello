---
title: The structure of report templates in COBOL
---
This document will cover the structure of report templates in COBOL, which includes:

1. Defining the report template structure
2. Using the report template in COBOL programs.

# Defining the report template structure

In COBOL, report templates are typically defined using a combination of data division entries and procedure division logic. The data division is used to declare the structure of the report, including headers, footers, and detail lines. The procedure division contains the logic to populate and format these sections.

<SwmSnippet path="/src/log002.cbl" line="407">

---

# Defining the report template structure

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section in <SwmPath>[src/log002.cbl](src/log002.cbl)</SwmPath> demonstrates how different report sections are processed based on the value of <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. This section evaluates the function code and performs the corresponding section to handle different parts of the report.

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

The <SwmToken path="src/log002.cbl" pos="424:1:5" line-data="       060a-criticar-campo section.">`060a-criticar-campo`</SwmToken> section in <SwmPath>[src/log002.cbl](src/log002.cbl)</SwmPath> shows how specific fields are validated and processed. This is part of the logic that would be used to populate and format the report template.

```cobol
       060a-criticar-campo section.
           evaluate campo-critica
              when "EF-DATA-INI"   PERFORM 060A-CRITICAR-DTINI
              when "EF-DATA-FIM"   PERFORM 060A-CRITICAR-DTFIM
           end-evaluate.
```

---

</SwmSnippet>

# Using the report template in COBOL programs

Once the report template is defined, it can be used in COBOL programs to generate reports. The procedure division will contain the logic to populate the report with data, format it, and output it to the desired medium (e.g., screen, printer, file).

<SwmSnippet path="/src/mtp062a.cbl" line="565">

---

# Using the report template in COBOL programs

The <SwmToken path="src/mtp062a.cbl" pos="565:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section in <SwmPath>[src/mtp062a.cbl](src/mtp062a.cbl)</SwmPath> shows how different report sections are processed based on the value of <SwmToken path="src/mtp062a.cbl" pos="566:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. This section includes logic for centralizing, criticizing, suggesting, navigating, including, and printing labels, which are all parts of the report generation process.

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

<SwmSnippet path="/src/mtp062a.cbl" line="807">

---

The <SwmToken path="src/mtp062a.cbl" pos="807:1:3" line-data="       110-criticar section.">`110-criticar`</SwmToken> section in <SwmPath>[src/mtp062a.cbl](src/mtp062a.cbl)</SwmPath> demonstrates how specific fields are validated and processed. This is part of the logic that would be used to populate and format the report template.

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

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
