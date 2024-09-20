---
title: Error handling and logging implementation
---
This document will cover how error handling and logging are implemented in the system. We'll cover:

1. Error Handling Mechanism
2. Logging Mechanism

<SwmSnippet path="/src/logacess.cbl" line="160">

---

# Error Handling Mechanism

The error handling mechanism is initiated in the <SwmToken path="src/logacess.cbl" pos="155:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> section. Here, the system attempts to open the <SwmToken path="src/logacess.cbl" pos="171:4:4" line-data="           MOVE &quot;LOGACESS&quot; TO ARQ-REC. MOVE EMPRESA-REF TO">`LOGACESS`</SwmToken> file. If the file status (<SwmToken path="src/logacess.cbl" pos="177:3:5" line-data="           IF FS-LOGACESS &lt;&gt; &quot;00&quot;">`FS-LOGACESS`</SwmToken>) is not '00', an error message is moved to <SwmToken path="src/logacess.cbl" pos="178:15:15" line-data="              MOVE &quot;ERRO ABERTURA LOGACESS: &quot;  TO MENSAGEM">`MENSAGEM`</SwmToken>, and the error flag <SwmToken path="src/logacess.cbl" pos="163:11:13" line-data="           MOVE ZEROS TO PAG-W ERRO-W.">`ERRO-W`</SwmToken> is set to 1. The <SwmToken path="src/logacess.cbl" pos="180:3:5" line-data="              PERFORM EXIBIR-MENSAGEM">`EXIBIR-MENSAGEM`</SwmToken> function is then performed to display the error message.

```cobol
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           ACCEPT VARIA-W FROM TIME.
           COPY "CBDATA1.CPY".
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE VERSION-NO         TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "LOGACESS" TO ARQ-REC. MOVE EMPRESA-REF TO
                                                        ARQUIVO-LOGACESS
           OPEN I-O   LOGACESS
           CLOSE      LOGACESS
           OPEN INPUT LOGACESS
           MOVE 1 TO GRAVA-W.
           IF FS-LOGACESS <> "00"
              MOVE "ERRO ABERTURA LOGACESS: "  TO MENSAGEM
              MOVE "C" TO TIPO-MSG
              PERFORM EXIBIR-MENSAGEM
```

---

</SwmSnippet>

<SwmSnippet path="/src/logacess.cbl" line="177">

---

The specific error handling code checks the file status and sets the error message and type. If an error occurs, it performs the <SwmToken path="src/logacess.cbl" pos="180:3:5" line-data="              PERFORM EXIBIR-MENSAGEM">`EXIBIR-MENSAGEM`</SwmToken> function to display the error.

```cobol
           IF FS-LOGACESS <> "00"
              MOVE "ERRO ABERTURA LOGACESS: "  TO MENSAGEM
              MOVE "C" TO TIPO-MSG
              PERFORM EXIBIR-MENSAGEM
              MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/logacess.cbl" line="160">

---

# Logging Mechanism

The logging mechanism is also part of the <SwmToken path="src/logacess.cbl" pos="155:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> section. It involves opening the <SwmToken path="src/logacess.cbl" pos="171:4:4" line-data="           MOVE &quot;LOGACESS&quot; TO ARQ-REC. MOVE EMPRESA-REF TO">`LOGACESS`</SwmToken> file for <SwmToken path="src/logacess.cbl" pos="14:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> operations. The file is first opened in <SwmToken path="src/logacess.cbl" pos="173:3:5" line-data="           OPEN I-O   LOGACESS">`I-O`</SwmToken> mode and then closed and reopened in input mode. This ensures that the log file is ready for reading and writing operations.

```cobol
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           ACCEPT VARIA-W FROM TIME.
           COPY "CBDATA1.CPY".
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE VERSION-NO         TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "LOGACESS" TO ARQ-REC. MOVE EMPRESA-REF TO
                                                        ARQUIVO-LOGACESS
           OPEN I-O   LOGACESS
           CLOSE      LOGACESS
           OPEN INPUT LOGACESS
           MOVE 1 TO GRAVA-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/logacess.cbl" line="173">

---

The log file <SwmToken path="src/logacess.cbl" pos="173:7:7" line-data="           OPEN I-O   LOGACESS">`LOGACESS`</SwmToken> is opened for <SwmToken path="src/logacess.cbl" pos="14:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> operations, closed, and then reopened in input mode. This sequence ensures that the log file is properly initialized for subsequent logging activities.

```cobol
           OPEN I-O   LOGACESS
           CLOSE      LOGACESS
           OPEN INPUT LOGACESS
           MOVE 1 TO GRAVA-W.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
