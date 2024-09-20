---
title: How data validation for customer records is implemented
---
This document will cover how data validation is implemented for customer records in the Kello Imagens system. We'll cover:

1. Date validation
2. Validation process in customer records

<SwmSnippet path="/src/gr/GRVDAT1.CBL" line="1">

---

# Date validation

The program <SwmToken path="src/gr/GRVDAT1.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRVDAT1.">`GRVDAT1`</SwmToken> is responsible for validating dates. It checks if a given date is valid and zeroes out the date if it is invalid. The program is called using <SwmToken path="src/gr/GRVDAT1.CBL" pos="9:6:14" line-data="                      *   Formato: CALL &quot;GRVDAT&quot; USING DDMMAA         *">`CALL "GRVDAT" USING DDMMAA`</SwmToken>.

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

<SwmSnippet path="/src/gr/GRVDAT1.CBL" line="1">

---

The <SwmToken path="src/gr/GRVDAT1.CBL" pos="22:1:5" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE SECTION`</SwmToken> in <SwmToken path="src/gr/GRVDAT1.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRVDAT1.">`GRVDAT1`</SwmToken> contains the necessary variables for date validation, including <SwmToken path="src/gr/GRVDAT1.CBL" pos="26:3:5" line-data="              10 FIM-MES OCCURS 12 PIC  9(002).">`FIM-MES`</SwmToken> which holds the end-of-month values for validation purposes.

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

<SwmSnippet path="/src/kello/cpp022.CBL" line="1840">

---

# Validation process in customer records

In the <SwmToken path="src/kello/cpp022.CBL" pos="1844:1:3" line-data="       INCLUI-PERMANENTE SECTION.">`INCLUI-PERMANENTE`</SwmToken> section of <SwmPath>[src/kello/cpp022.CBL](src/kello/cpp022.CBL)</SwmPath>, the date validation process is invoked. The date is moved to <SwmToken path="src/kello/cpp022.CBL" pos="1846:11:13" line-data="           MOVE DATA-VENCTO-CP20      TO DATA-WI.">`DATA-WI`</SwmToken> and then validated using <SwmToken path="src/kello/cpp022.CBL" pos="1725:1:11" line-data="           CALL &quot;GRTIME&quot; USING PARAMETROS-GRTIME">`CALL "GRTIME" USING PARAMETROS-GRTIME`</SwmToken>. If the date is invalid, it is zeroed out.

```cobol
                         END-WRITE
                   END-WRITE
              END-IF
           END-PERFORM.
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
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
