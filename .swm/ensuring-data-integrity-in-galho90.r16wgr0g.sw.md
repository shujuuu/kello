---
title: Ensuring Data Integrity in GALHO90
---
This document will cover the process for ensuring data integrity in the Kello Imagens system, which includes:

1. Validating dates
2. Refreshing text and data
3. Handling invalid data.

<SwmSnippet path="/src/gr/GRVDAT1.CBL" line="1">

---

# Validating dates

The program <SwmToken path="src/gr/GRVDAT1.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRVDAT1.">`GRVDAT1`</SwmToken> is responsible for validating dates. It checks the validity of a date in the format <SwmToken path="src/gr/GRVDAT1.CBL" pos="9:14:14" line-data="                      *   Formato: CALL &quot;GRVDAT&quot; USING DDMMAA         *">`DDMMAA`</SwmToken>. If the date is invalid, it will reset the date to zero.

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

The <SwmToken path="src/gr/GRDIAS1.CBL" pos="58:4:4" line-data="           CALL &quot;GRVDAT1&quot; USING  GRDIAS-AAMMDD-INICIAL">`GRVDAT1`</SwmToken> program is called multiple times in <SwmPath>[src/gr/GRDIAS1.CBL](src/gr/GRDIAS1.CBL)</SwmPath> to validate initial and final dates. This ensures that the dates used in the system are valid.

```cobol
           CALL "GRIDAT1" USING  GRDIAS-AAMMDD-FINAL
           CALL "GRVDAT1" USING  GRDIAS-AAMMDD-INICIAL
           CALL "GRVDAT1" USING  GRDIAS-AAMMDD-FINAL
           CALL "GRIDAT2" USING  GRDIAS-AAMMDD-INICIAL
```

---

</SwmSnippet>

<SwmSnippet path="/src/sistema.cbl" line="64">

---

# Refreshing text and data

The variable <SwmToken path="src/sistema.cbl" pos="66:3:11" line-data="       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.">`REFRESH-TEXT-AND-DATA-PROC`</SwmToken> is defined to handle the process of refreshing text and data. This is crucial for maintaining the integrity of the data displayed and processed by the system.

```cobol
           COPY "DS-CNTRL.MF".
           COPY "CPTIME.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  VARIAVEIS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/alt/altseqbr.CBL" line="33">

---

The <SwmToken path="src/alt/altseqbr.CBL" pos="35:3:11" line-data="       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.">`REFRESH-TEXT-AND-DATA-PROC`</SwmToken> variable is also used in <SwmPath>[src/alt/altseqbr.CBL](src/alt/altseqbr.CBL)</SwmPath>, indicating its importance across different modules for ensuring data integrity.

```cobol
           COPY "ALTSEQBR.CPY".
           COPY "DS-CNTRL.MF".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  VARIAVEIS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpp022.CBL" line="1840">

---

# Handling invalid data

In <SwmPath>[src/kello/cpp022.CBL](src/kello/cpp022.CBL)</SwmPath>, the system checks if the date is valid using the <SwmToken path="src/kello/cpp022.CBL" pos="1857:7:7" line-data="                   MOVE 2         TO GRTIME-TYPE">`GRTIME`</SwmToken> call. If the date is invalid, it sets a default value. This is part of the system's strategy to handle and correct invalid data entries.

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
