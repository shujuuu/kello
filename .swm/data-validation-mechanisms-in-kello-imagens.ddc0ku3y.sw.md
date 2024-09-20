---
title: Data Validation Mechanisms in Kello Imagens
---
This document will cover how data validation is done in the system. We'll cover:

1. Validating dates using <SwmToken path="src/gr/GRVDAT1.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRVDAT1.">`GRVDAT1`</SwmToken>
2. Validating data limits using <SwmToken path="src/kello/cpp022.CBL" pos="1462:3:7" line-data="           PERFORM VALIDA-DATA-LIMITE.">`VALIDA-DATA-LIMITE`</SwmToken>
3. Validating dates using <SwmToken path="src/kello/cpp022.CBL" pos="1857:7:7" line-data="                   MOVE 2         TO GRTIME-TYPE">`GRTIME`</SwmToken>

<SwmSnippet path="/src/gr/GRVDAT1.CBL" line="1">

---

# Validating dates using <SwmToken path="src/gr/GRVDAT1.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRVDAT1.">`GRVDAT1`</SwmToken>

The program <SwmToken path="src/gr/GRVDAT1.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRVDAT1.">`GRVDAT1`</SwmToken> is responsible for validating dates. It is called using the format <SwmToken path="src/gr/GRVDAT1.CBL" pos="9:6:14" line-data="                      *   Formato: CALL &quot;GRVDAT&quot; USING DDMMAA         *">`CALL "GRVDAT" USING DDMMAA`</SwmToken>. If the date is invalid, the variable <SwmToken path="src/gr/GRVDAT1.CBL" pos="9:14:14" line-data="                      *   Formato: CALL &quot;GRVDAT&quot; USING DDMMAA         *">`DDMMAA`</SwmToken> will be zeroed.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    GRVDAT1.
       AUTHOR.        COBOLware Services Ltda.
       DATE-WRITTEN.  23/04/89.
       SECURITY.      *************************************************
                      *                                               *
                      *   Verifica validade de uma data               *
                      *                                               *
                      *   Formato: CALL "GRVDAT" USING DDMMAA         *
                      *                                               *
                      *   Se a data invalida DDMMAA sera zerada       *
                      *                                               *
                      *                                               *
                      *                                               *
                      *                                               *
                      *                                               *
                      *                                               *
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       DATA DIVISION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/gr/GRDIAS1.CBL" line="57">

---

The program <SwmToken path="src/gr/GRDIAS1.CBL" pos="58:4:4" line-data="           CALL &quot;GRVDAT1&quot; USING  GRDIAS-AAMMDD-INICIAL">`GRVDAT1`</SwmToken> is used in <SwmPath>[src/gr/GRDIAS1.CBL](src/gr/GRDIAS1.CBL)</SwmPath> to validate dates. For example, <SwmToken path="src/gr/GRDIAS1.CBL" pos="57:1:1" line-data="           CALL &quot;GRIDAT1&quot; USING  GRDIAS-AAMMDD-FINAL">`CALL`</SwmToken>` `<SwmToken path="src/gr/GRDIAS1.CBL" pos="58:4:4" line-data="           CALL &quot;GRVDAT1&quot; USING  GRDIAS-AAMMDD-INICIAL">`GRVDAT1`</SwmToken>` `<SwmToken path="src/gr/GRDIAS1.CBL" pos="57:7:7" line-data="           CALL &quot;GRIDAT1&quot; USING  GRDIAS-AAMMDD-FINAL">`USING`</SwmToken>` `<SwmToken path="src/gr/GRDIAS1.CBL" pos="58:9:13" line-data="           CALL &quot;GRVDAT1&quot; USING  GRDIAS-AAMMDD-INICIAL">`GRDIAS-AAMMDD-INICIAL`</SwmToken> validates the initial date.

```cobol
           CALL "GRIDAT1" USING  GRDIAS-AAMMDD-FINAL
           CALL "GRVDAT1" USING  GRDIAS-AAMMDD-INICIAL
           CALL "GRVDAT1" USING  GRDIAS-AAMMDD-FINAL
           CALL "GRIDAT2" USING  GRDIAS-AAMMDD-INICIAL
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpp022.CBL" line="2708">

---

# Validating data limits using <SwmToken path="src/kello/cpp022.CBL" pos="2711:1:5" line-data="       VALIDA-DATA-LIMITE SECTION.">`VALIDA-DATA-LIMITE`</SwmToken>

The section <SwmToken path="src/kello/cpp022.CBL" pos="2711:1:5" line-data="       VALIDA-DATA-LIMITE SECTION.">`VALIDA-DATA-LIMITE`</SwmToken> checks if the movement or due date is less than a specified limit. If the date is invalid, an error message is generated and the <SwmToken path="src/kello/cpp022.CBL" pos="2716:3:5" line-data="              PERFORM ERRO-GRAVACAO">`ERRO-GRAVACAO`</SwmToken> routine is performed.

```cobol
                  IF DATA-MOV-PAGAR-PF10 NOT = ZEROS
                     MOVE "10" TO ST-PFD010
                  ELSE PERFORM EXIBE-PROGRAMACAO.
       VALIDA-DATA-LIMITE SECTION.
      *    VERIFICA SE DATA DE MOVTO OU VENCTO < 19950101
           IF DATA-MOVTO-CP20 < DATA-LIMITE
              MOVE "DATA-MOVTO-INV:"  TO CPP020-MENSAGEM-ERRO(15: 15)
              MOVE DATA-MOVTO-CP20 TO CPP020-MENSAGEM-ERRO(30: 08)
              PERFORM ERRO-GRAVACAO
           END-IF

           IF DATA-VENCTO-CP20 < DATA-LIMITE
              MOVE "DATA-VENCTO-INV:"  TO CPP020-MENSAGEM-ERRO(15: 15)
              MOVE DATA-VENCTO-CP20 TO CPP020-MENSAGEM-ERRO(30: 08)
              PERFORM ERRO-GRAVACAO
           END-IF.

       EXIBE-PROGRAMACAO SECTION.
           MOVE "TELA-PROGRAMACAO" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE CPP020-COD-FORN TO FORNECEDOR-PF10.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpp022.CBL" line="1461">

---

The section <SwmToken path="src/kello/cpp022.CBL" pos="1462:3:7" line-data="           PERFORM VALIDA-DATA-LIMITE.">`VALIDA-DATA-LIMITE`</SwmToken> is called multiple times in <SwmPath>[src/kello/cpp022.CBL](src/kello/cpp022.CBL)</SwmPath> to ensure data validity before performing operations like rewriting records.

```cobol
       SUSPENDE-CANCELA SECTION.
           PERFORM VALIDA-DATA-LIMITE.
           REWRITE REG-CPD020 NOT INVALID KEY
               MOVE USUARIO-W   TO LOG3-USUARIO
               MOVE FUNCTION CURRENT-DATE TO WS-DATA-SYS
               MOVE WS-DATA-CPU TO LOG3-DATA
               ACCEPT WS-HORA-SYS FROM TIME
               MOVE WS-HORA-SYS TO LOG3-HORAS
               MOVE "A"         TO LOG3-OPERACAO
               MOVE "CPD020"    TO LOG3-ARQUIVO
               MOVE "CPP022"    TO LOG3-PROGRAMA
               MOVE REG-CPD020  TO LOG3-REGISTRO
               WRITE REG-LOG003
               END-WRITE.

           MOVE FORNEC-CP20 TO NOMINAL-A-CB100.
           MOVE SEQ-CP20 TO SEQ-CTA-PAGAR-CB100.
           START CBD100 KEY IS = ALT2-CB100
              INVALID KEY CONTINUE
              NOT INVALID KEY
                READ CBD100 NEXT RECORD
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpp022.CBL" line="1844">

---

# Validating dates using <SwmToken path="src/kello/cpp022.CBL" pos="1857:7:7" line-data="                   MOVE 2         TO GRTIME-TYPE">`GRTIME`</SwmToken>

The section <SwmToken path="src/kello/cpp022.CBL" pos="1844:1:3" line-data="       INCLUI-PERMANENTE SECTION.">`INCLUI-PERMANENTE`</SwmToken> uses the <SwmToken path="src/kello/cpp022.CBL" pos="1857:7:7" line-data="                   MOVE 2         TO GRTIME-TYPE">`GRTIME`</SwmToken> program to validate dates. The call <SwmToken path="src/kello/cpp022.CBL" pos="1862:1:11" line-data="                   CALL &quot;GRTIME&quot; USING PARAMETROS-GRTIME">`CALL "GRTIME" USING PARAMETROS-GRTIME`</SwmToken> checks if the date is valid. If the final date is zero, it indicates an invalid date.

```cobol
       INCLUI-PERMANENTE SECTION.
           MOVE CPP020-COD-FORN       TO FORNEC-CP21.
           MOVE DATA-VENCTO-CP20      TO DATA-WI.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 12
                   ADD 1 TO MES-WI
                   IF MES-WI > 12
                      MOVE 1 TO MES-WI  ADD 1 TO ANO-WI
                   END-IF

                   PERFORM ATUALIZA-SEQ-CPD021

                   MOVE SEQ-CP21  TO SEQ-CP20
                   MOVE 1         TO PREV-DEF-CP20
                   MOVE 2         TO GRTIME-TYPE
                   MOVE 7         TO GRTIME-FUNCTION
                   MOVE DATA-WI   TO DATA-VENCTO-CP20 GRTIME-DATE
                                     DATA-WII
      *            VERIFICA SE DATA VALIDA
                   CALL "GRTIME" USING PARAMETROS-GRTIME
                   CANCEL "GRTIME"
                   IF GRTIME-DATE-FINAL = ZEROS
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpp022.CBL" line="2574">

---

The section <SwmToken path="src/kello/cpp022.CBL" pos="2575:3:5" line-data="              PERFORM INCLUI-PERMANENTE.">`INCLUI-PERMANENTE`</SwmToken> is performed when the account type is 1, ensuring that date validation is part of the permanent inclusion process.

```cobol
           IF TIPO-CONTA-CP20 = 1
              PERFORM INCLUI-PERMANENTE.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
