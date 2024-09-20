---
title: Testing and Integration Processes for COBOL Programs in Bank Transactions
---
This document will cover the testing and integration processes for COBOL programs, which includes:

1. Unit Testing
2. Integration Testing
3. Continuous Integration

# Unit Testing

Unit testing in COBOL involves testing individual sections or paragraphs of the COBOL program to ensure they work as expected. This can be done by creating test cases that provide specific inputs and verify the outputs. For example, in the <SwmPath>[src/cgp006t.cbl](src/cgp006t.cbl)</SwmPath> file, the <SwmToken path="src/cgp006t.cbl" pos="126:1:5" line-data="       050-processar-cobol section.">`050-processar-cobol`</SwmToken> section can be tested by providing different values for <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> and verifying that the correct sections are performed.

<SwmSnippet path="/src/cgp006t.cbl" line="126">

---

# Unit Testing

The <SwmToken path="src/cgp006t.cbl" pos="126:1:5" line-data="       050-processar-cobol section.">`050-processar-cobol`</SwmToken> section evaluates the value of <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> and performs different sections based on its value. This can be unit tested by providing different values for <SwmToken path="src/cgp006t.cbl" pos="127:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> and verifying that the correct sections are executed.

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

# Integration Testing

Integration testing involves testing the interaction between different sections or programs to ensure they work together as expected. This can be done by creating test cases that simulate real-world scenarios and verify the outputs. For example, in the <SwmPath>[src/log002.cbl](src/log002.cbl)</SwmPath> file, the <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section calls several other sections, which can be tested together to ensure they work correctly.

<SwmSnippet path="/src/log002.cbl" line="407">

---

# Integration Testing

The <SwmToken path="src/log002.cbl" pos="407:1:5" line-data="       060-processar-cobol section.">`060-processar-cobol`</SwmToken> section calls several other sections based on the value of <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken>. This can be integration tested by providing different values for <SwmToken path="src/log002.cbl" pos="409:3:5" line-data="           evaluate fun-cobol">`fun-cobol`</SwmToken> and verifying that the correct sections are executed and work together as expected.

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

# Continuous Integration

Continuous Integration (CI) involves automatically running tests whenever changes are made to the codebase to ensure that new changes do not break existing functionality. This can be set up using CI tools like Jenkins or GitHub Actions, which can run COBOL tests and report the results. For example, a CI pipeline can be set up to run unit and integration tests for the COBOL programs whenever changes are pushed to the repository.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
