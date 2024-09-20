---
title: Initialization in INICIALIZA-PROGRAMA
---
This document will cover the initialization procedures in <SwmToken path="src/logacess.cbl" pos="159:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>, focusing on file handling and data setup. We'll cover:

1. File Handling
2. Data Setup

<SwmSnippet path="/src/logacess.cbl" line="159">

---

# File Handling

The <SwmToken path="src/logacess.cbl" pos="159:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section handles file operations for the <SwmToken path="src/logacess.cbl" pos="171:4:4" line-data="           MOVE &quot;LOGACESS&quot; TO ARQ-REC. MOVE EMPRESA-REF TO">`LOGACESS`</SwmToken> file. It opens the file in <SwmToken path="src/logacess.cbl" pos="173:3:5" line-data="           OPEN I-O   LOGACESS">`I-O`</SwmToken> mode, closes it, and then reopens it in INPUT mode. If an error occurs during the file opening, an error message is displayed using the <SwmToken path="src/logacess.cbl" pos="180:3:5" line-data="              PERFORM EXIBIR-MENSAGEM">`EXIBIR-MENSAGEM`</SwmToken> procedure.

```cobol
       INICIALIZA-PROGRAMA SECTION.
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
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206-a.cbl" line="185">

---

In <SwmToken path="src/rep/rep206-a.cbl" pos="185:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>, multiple files such as <SwmToken path="src/rep/rep206-a.cbl" pos="197:4:4" line-data="           MOVE &quot;CAD010&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.">`CAD010`</SwmToken>, <SwmToken path="src/rep/rep206-a.cbl" pos="198:4:4" line-data="           MOVE &quot;CAD012&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD012.">`CAD012`</SwmToken>, <SwmToken path="src/rep/rep206-a.cbl" pos="199:4:4" line-data="           MOVE &quot;COD001&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD001.">`COD001`</SwmToken>, <SwmToken path="src/rep/rep206-a.cbl" pos="200:4:4" line-data="           MOVE &quot;COD003&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD003.">`COD003`</SwmToken>, <SwmToken path="src/rep/rep206-a.cbl" pos="201:4:4" line-data="           MOVE &quot;COD040&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.">`COD040`</SwmToken>, <SwmToken path="src/rep/rep206-a.cbl" pos="202:4:4" line-data="           MOVE &quot;RED100&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED100.">`RED100`</SwmToken>, <SwmToken path="src/rep/rep206-a.cbl" pos="203:4:4" line-data="           MOVE &quot;RED101&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED101.">`RED101`</SwmToken>, and <SwmToken path="src/rep/rep206-a.cbl" pos="204:4:4" line-data="           MOVE &quot;RED206&quot;  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED206.">`RED206`</SwmToken> are opened in INPUT mode. If any file fails to open, an error message is generated and displayed using the <SwmToken path="src/rep/rep206-a.cbl" pos="217:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> procedure.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CAD010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.
           MOVE "CAD012"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD012.
           MOVE "COD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD001.
           MOVE "COD003"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD003.
           MOVE "COD040"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "RED100"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED100.
           MOVE "RED101"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED101.
           MOVE "RED206"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED206.
           ACCEPT VARIA-W FROM TIME.
```

---

</SwmSnippet>

<SwmSnippet path="/src/logacess.cbl" line="160">

---

# Data Setup

The <SwmToken path="src/logacess.cbl" pos="159:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes various data blocks and control blocks. It sets the version numbers and moves company-related data into specific fields.

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
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep206-a.cbl" line="186">

---

In <SwmToken path="src/logacess.cbl" pos="159:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>, data blocks and control blocks are initialized, and version numbers are set. Company-related data is moved into specific fields, and the current time is accepted into <SwmToken path="src/rep/rep206-a.cbl" pos="205:3:5" line-data="           ACCEPT VARIA-W FROM TIME.">`VARIA-W`</SwmToken>.

```cobol
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CAD010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.
           MOVE "CAD012"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD012.
           MOVE "COD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD001.
           MOVE "COD003"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD003.
           MOVE "COD040"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "RED100"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED100.
           MOVE "RED101"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED101.
           MOVE "RED206"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-RED206.
           ACCEPT VARIA-W FROM TIME.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
