---
title: Roles of acp100.cbl and acp900.cbl in Accounts Control
---
This document will cover the specific roles of key COBOL programs like <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath> and <SwmPath>[src/acp/acp900.cbl](src/acp/acp900.cbl)</SwmPath> within Accounts Control. We'll cover:

1. The role of <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath>
2. The role of <SwmPath>[src/acp/acp900.cbl](src/acp/acp900.cbl)</SwmPath>
3. How these programs interact within the Accounts Control module.

<SwmSnippet path="/src/acp/acp100.cbl" line="6">

---

# The role of <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath>

The <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath> program is responsible for handling customer service transactions. It includes various operations such as verifying subjects, loading data, and handling different types of customer interactions.

```cobol
      *FUNÇÃO: Movimento de ATENDIMENTO A CLIENTE
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp100.cbl" line="490">

---

The program performs various tasks based on different flags. For example, it loads data when <SwmToken path="src/acp/acp100.cbl" pos="490:5:11" line-data="      *        WHEN GS-CARREGA-SB-TRUE">`GS-CARREGA-SB-TRUE`</SwmToken> is true, clears data when <SwmToken path="src/acp/acp100.cbl" pos="492:5:11" line-data="      *        WHEN GS-CARREGA-SEQ-TRUE">`GS-CARREGA-SEQ-TRUE`</SwmToken> is true, and validates types when <SwmToken path="src/acp/acp100.cbl" pos="522:5:11" line-data="      *        WHEN GS-VALIDA-TIPO-TRUE">`GS-VALIDA-TIPO-TRUE`</SwmToken> is true.

```cobol
      *        WHEN GS-CARREGA-SB-TRUE
      *             PERFORM CARREGAR-SB
      *        WHEN GS-CARREGA-SEQ-TRUE
      *             PERFORM LIMPAR-DADOS
      *             PERFORM CARREGA-ULT-SEQ
      *        WHEN GS-CARREGA-DISPLAY-TRUE
      *             PERFORM CARREGAR-DISPLAY
      *        WHEN GS-CARREGA-HISTORICO-TRUE
      *             PERFORM CARREGAR-HISTORICO
      *        WHEN GS-EXCLUI-FLG-TRUE
      *             PERFORM EXCLUI
      *             PERFORM LIMPAR-DADOS
      *        WHEN GS-CLR-FLG-TRUE
      *             PERFORM LIMPAR-DADOS
      *        WHEN GS-ALTERA-DADOS-TRUE
      *             PERFORM INVERTE-DATA-MOVTO
      *             MOVE DATA-MOVTO-I     TO DATAMOV-AC100
      *             MOVE GS-SEQ           TO SEQ-AC100
      *
      *             START ACD100 KEY IS = CHAVE-AC100
      *               INVALID KEY
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp100.cbl" line="1637">

---

The <SwmToken path="src/acp/acp100.cbl" pos="1637:2:4" line-data="      *VERIFICAR-ASSUNTO SECTION.">`VERIFICAR-ASSUNTO`</SwmToken> section evaluates the subject and calls different sub-programs like <SwmToken path="src/acp/acp100.cbl" pos="1653:6:6" line-data="      *    CALL &quot;ACP110&quot; USING PASSAR-STRING-1">`ACP110`</SwmToken>, <SwmToken path="src/acp/acp900.cbl" pos="422:4:4" line-data="           CALL &quot;ACP120&quot; USING PASSAR-STRING-1">`ACP120`</SwmToken>, <SwmToken path="src/acp/acp900.cbl" pos="429:4:4" line-data="           CALL &quot;ACP130&quot; USING PASSAR-STRING-1">`ACP130`</SwmToken>, <SwmToken path="src/acp/acp100.cbl" pos="1674:6:6" line-data="      *    CALL &quot;ACP140&quot; USING PASSAR-STRING-1">`ACP140`</SwmToken>, and <SwmToken path="src/acp/acp100.cbl" pos="1681:6:6" line-data="      *    CALL &quot;ACP150&quot; USING PASSAR-STRING-1">`ACP150`</SwmToken> based on the subject type.

```cobol
      *VERIFICAR-ASSUNTO SECTION.
      *    EVALUATE AUX-ASSUNTO
      *        WHEN 1  PERFORM CHAMAR-MIN
      *        WHEN 2  PERFORM CHAMAR-DCR
      *        WHEN 3  PERFORM CHAMAR-OS
      *        WHEN 4  PERFORM CHAMAR-DPT
      *        WHEN 5  PERFORM CHAMAR-MEMO
      *        WHEN OTHER MOVE "Problema com relação ao Assunto" TO
      *                   MENSAGEM
      *                   MOVE "C" TO TIPO-MSG
      *                   PERFORM EXIBIR-MENSAGEM.
      *
      *CHAMAR-MIN SECTION.
      *    MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
      *    MOVE SPACES TO PASSAR-STRING-1
      *    STRING TIPO-CADASTRO WS-DATA-CPU AUX-SEQ INTO PASSAR-STRING-1
      *    CALL "ACP110" USING PASSAR-STRING-1
      *    CANCEL "ACP110".
      *
      *CHAMAR-DCR SECTION.
      *    MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp900.cbl" line="3">

---

# The role of <SwmPath>[src/acp/acp900.cbl](src/acp/acp900.cbl)</SwmPath>

The <SwmPath>[src/acp/acp900.cbl](src/acp/acp900.cbl)</SwmPath> program also handles customer service transactions but focuses more on the movement of customer service data. It includes operations for initializing programs, verifying subjects, and loading historical data.

```cobol
       PROGRAM-ID. ACP100.
       AUTHOR. MARELI AMANCIO VOLPATO.
       DATE-WRITTEN. 04/04/2004.
      *FUNÇÃO: Movimento de ATENDIMENTO A CLIENTE
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp900.cbl" line="411">

---

Similar to <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath>, this program also calls various sub-programs like <SwmToken path="src/acp/acp900.cbl" pos="415:4:4" line-data="           CALL &quot;ACP110&quot; USING PASSAR-STRING-1">`ACP110`</SwmToken>, <SwmToken path="src/acp/acp900.cbl" pos="422:4:4" line-data="           CALL &quot;ACP120&quot; USING PASSAR-STRING-1">`ACP120`</SwmToken>, <SwmToken path="src/acp/acp900.cbl" pos="429:4:4" line-data="           CALL &quot;ACP130&quot; USING PASSAR-STRING-1">`ACP130`</SwmToken>, <SwmToken path="src/acp/acp100.cbl" pos="1674:6:6" line-data="      *    CALL &quot;ACP140&quot; USING PASSAR-STRING-1">`ACP140`</SwmToken>, and <SwmToken path="src/acp/acp100.cbl" pos="1681:6:6" line-data="      *    CALL &quot;ACP150&quot; USING PASSAR-STRING-1">`ACP150`</SwmToken> based on the subject type.

```cobol
       CHAMAR-MIN SECTION.
           MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
           MOVE SPACES TO PASSAR-STRING-1
           STRING TIPO-CADASTRO WS-DATA-CPU AUX-SEQ INTO PASSAR-STRING-1
           CALL "ACP110" USING PASSAR-STRING-1
           CANCEL "ACP110".

       CHAMAR-DCR SECTION.
           MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
           MOVE SPACES TO PASSAR-STRING-1
           STRING TIPO-CADASTRO WS-DATA-CPU AUX-SEQ INTO PASSAR-STRING-1
           CALL "ACP120" USING PASSAR-STRING-1
           CANCEL "ACP120".

       CHAMAR-OS SECTION.
           MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
           MOVE SPACES TO PASSAR-STRING-1
           STRING TIPO-CADASTRO WS-DATA-CPU AUX-SEQ INTO PASSAR-STRING-1
           CALL "ACP130" USING PASSAR-STRING-1
           CANCEL "ACP130".

```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/acp900.cbl" line="497">

---

The program includes sections for loading historical data, displaying data, and handling various customer service operations.

```cobol
       CARREGAR-HISTORICO SECTION.
           OPEN OUTPUT WORK  CLOSE WORK  OPEN I-O WORK.

           INITIALIZE REG-ACD100

           MOVE GS-CLIENTE TO CLIENTE-AC100

           START ACD100 KEY IS NOT LESS CLI-AC010 INVALID KEY
               MOVE "10" TO ST-ACD100.

           PERFORM UNTIL ST-ACD100 = "10"
               READ ACD100 NEXT RECORD AT END
                   MOVE "10" TO ST-ACD100
               NOT AT END
                   IF GS-CLIENTE <> CLIENTE-AC100
                      MOVE "10" TO ST-ACD100
                   ELSE
                      MOVE DATAMOV-AC100   TO DATA-WK
                      MOVE SEQ-AC100       TO SEQUENCIA-WK
                      MOVE 2               TO CLASSIF-WK
                      MOVE 0               TO SEQ-WK
```

---

</SwmSnippet>

# Interaction within Accounts Control

Both <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath> and <SwmPath>[src/acp/acp900.cbl](src/acp/acp900.cbl)</SwmPath> play crucial roles in the Accounts Control module by handling different aspects of customer service transactions. While <SwmPath>[src/acp/acp100.cbl](src/acp/acp100.cbl)</SwmPath> focuses on verifying subjects and performing specific tasks based on flags, <SwmPath>[src/acp/acp900.cbl](src/acp/acp900.cbl)</SwmPath> deals with the movement and historical data of customer service transactions. These programs interact with various sub-programs to perform their respective tasks, ensuring smooth operation within the Accounts Control module.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
