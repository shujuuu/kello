---
title: How the CORPO-PROGRAMA section processes data and handles conditions
---
This document will cover data evaluation and conditional processing in the <SwmToken path="src/kello/oep010.cbl" pos="209:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section. We'll cover:

1. The purpose of the <SwmToken path="src/kello/oep010.cbl" pos="209:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section
2. How data evaluation is performed
3. Conditional processing within the section

# The purpose of the <SwmToken path="src/kello/oep010.cbl" pos="209:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section

The <SwmToken path="src/kello/oep010.cbl" pos="209:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section is a critical part of the COBOL programs in the Kello Imagens system. It handles the main logic for data evaluation and conditional processing based on various flags and conditions. This section is responsible for executing different operations such as saving data, loading data, printing reports, and more, depending on the state of specific flags.

<SwmSnippet path="/src/kello/oep010.cbl" line="209">

---

# How data evaluation is performed

The <SwmToken path="src/kello/oep010.cbl" pos="209:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section uses the EVALUATE statement to perform data evaluation. The EVALUATE statement is similar to a switch-case statement in other programming languages. It checks the value of a condition and executes the corresponding WHEN clause. For example, when <SwmToken path="src/kello/oep010.cbl" pos="211:3:7" line-data="               WHEN GS-CENTRALIZA-TRUE">`GS-CENTRALIZA-TRUE`</SwmToken> is true, the CENTRALIZAR procedure is performed.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                    PERFORM SALVAR-DADOS
                    IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS
                    ELSE PERFORM GRAVA-DADOS
                    END-IF
      *             MOVE GS-CONTRATO TO NR-CONTRATO-W
                    PERFORM LIMPAR-DADOS
      *             IF GS-TIPO-GRAVACAO <> 1
      *                 MOVE NR-CONTRATO-W TO GS-CONTRATO
      *             END-IF
                    MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-LOAD-FLG-TRUE
                    PERFORM CARREGAR-DADOS
               WHEN GS-EXCLUI-FLG-TRUE
                    PERFORM EXCLUI
                    PERFORM LIMPAR-DADOS
               WHEN GS-CLR-FLG-TRUE
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="314">

---

In this example, the <SwmToken path="src/oep/oep053.cbl" pos="314:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section evaluates multiple conditions using the EVALUATE statement. Depending on the value of the flags such as <SwmToken path="src/oep/oep053.cbl" pos="316:3:7" line-data="               WHEN GS-CENTRALIZA-TRUE">`GS-CENTRALIZA-TRUE`</SwmToken>, <SwmToken path="src/oep/oep053.cbl" pos="318:3:9" line-data="               WHEN GS-PRINTER-FLG-TRUE">`GS-PRINTER-FLG-TRUE`</SwmToken>, and others, it performs different procedures like CENTRALIZAR, <SwmToken path="src/oep/oep053.cbl" pos="319:3:7" line-data="                    PERFORM ZERA-VARIAVEIS-REL">`ZERA-VARIAVEIS-REL`</SwmToken>, <SwmToken path="src/oep/oep053.cbl" pos="322:3:5" line-data="                       PERFORM IMPRIME-RELATORIO">`IMPRIME-RELATORIO`</SwmToken>, and more.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-PRINTER-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS-REL
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
               WHEN GS-VERIFICA-DATA-TRUE
                    PERFORM VERIFICA-INT-DATA
           END-EVALUATE
           PERFORM CLEAR-FLAGS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep020.cbl" line="183">

---

# Conditional processing within the section

Conditional processing in the <SwmToken path="src/oep/oep020.cbl" pos="183:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section is handled by the EVALUATE statement and various PERFORM statements. For instance, when <SwmToken path="src/oep/oep020.cbl" pos="187:3:9" line-data="               WHEN GS-SAVE-FLG-TRUE">`GS-SAVE-FLG-TRUE`</SwmToken> is true, the <SwmToken path="src/oep/oep020.cbl" pos="188:3:5" line-data="                   PERFORM SALVAR-DADOS">`SALVAR-DADOS`</SwmToken> procedure is performed. If <SwmToken path="src/oep/oep020.cbl" pos="189:3:7" line-data="                   IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS">`GS-TIPO-GRAVACAO`</SwmToken> equals 1, the <SwmToken path="src/oep/oep020.cbl" pos="189:15:17" line-data="                   IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS">`REGRAVA-DADOS`</SwmToken> procedure is performed; otherwise, the <SwmToken path="src/oep/oep020.cbl" pos="190:5:7" line-data="                   ELSE PERFORM GRAVA-DADOS">`GRAVA-DADOS`</SwmToken> procedure is executed. This allows the program to handle different scenarios dynamically based on the state of the flags.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   PERFORM SALVAR-DADOS
                   IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS
                   ELSE PERFORM GRAVA-DADOS
                   END-IF
                   PERFORM LIMPAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-EXCLUI-FLG-TRUE
                   PERFORM EXCLUI
                   PERFORM LIMPAR-DADOS
               WHEN GS-CLR-FLG-TRUE
                   PERFORM LIMPAR-DADOS
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/oep020x.cbl" line="190">

---

Another example of conditional processing is seen here. The <SwmToken path="src/kello/oep020x.cbl" pos="190:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section evaluates conditions and performs corresponding actions such as CENTRALIZAR, <SwmToken path="src/kello/oep020x.cbl" pos="195:3:5" line-data="                   PERFORM SALVAR-DADOS">`SALVAR-DADOS`</SwmToken>, <SwmToken path="src/kello/oep020x.cbl" pos="196:15:17" line-data="                   IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS">`REGRAVA-DADOS`</SwmToken>, <SwmToken path="src/kello/oep020x.cbl" pos="197:5:7" line-data="                   ELSE PERFORM GRAVA-DADOS">`GRAVA-DADOS`</SwmToken>, <SwmToken path="src/kello/oep020x.cbl" pos="199:3:5" line-data="                   PERFORM LIMPAR-DADOS">`LIMPAR-DADOS`</SwmToken>, and more. This structure ensures that the program can handle various operations based on the current state and input data.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   PERFORM SALVAR-DADOS
                   IF GS-TIPO-GRAVACAO = 1 PERFORM REGRAVA-DADOS
                   ELSE PERFORM GRAVA-DADOS
                   END-IF
                   PERFORM LIMPAR-DADOS
                   MOVE "SET-POSICAO-CURSOR1" TO DS-PROCEDURE
               WHEN GS-EXCLUI-FLG-TRUE
                   PERFORM EXCLUI
                   PERFORM LIMPAR-DADOS
               WHEN GS-CLR-FLG-TRUE
                   PERFORM LIMPAR-DADOS
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
