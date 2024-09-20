---
title: How the IMPRIME-RELATORIO section formats and executes report printing
---
This document will cover how the <SwmToken path="src/oep/oep053.cbl" pos="835:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> section formats and executes report printing. We'll cover:

1. Initializing the report
2. Ordering the data
3. Generating the header
4. Moving data to the report
5. Finalizing the report

<SwmSnippet path="/src/oep/oep053.cbl" line="834">

---

# Initializing the report

The <SwmToken path="src/oep/oep053.cbl" pos="835:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> section starts by initializing the page counter <SwmToken path="src/oep/oep053.cbl" pos="836:7:9" line-data="           MOVE ZEROS TO PAG-W.">`PAG-W`</SwmToken> to zero.

```cobol
      *-------------------------------------------------------
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO PAG-W.

```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="838">

---

It then includes a copy of the CONDENSA section and initializes the <SwmToken path="src/oep/oep053.cbl" pos="840:3:5" line-data="           INITIALIZE REG-WORK">`REG-WORK`</SwmToken> area.

```cobol
           COPY CONDENSA.

           INITIALIZE REG-WORK
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="841">

---

# Ordering the data

The ORDEM section is performed to order the data based on the value of <SwmToken path="src/oep/oep053.cbl" pos="651:3:5" line-data="           EVALUATE GS-ORDEM">`GS-ORDEM`</SwmToken>.

```cobol
           PERFORM ORDEM
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="650">

---

The ORDEM section evaluates <SwmToken path="src/oep/oep053.cbl" pos="651:3:5" line-data="           EVALUATE GS-ORDEM">`GS-ORDEM`</SwmToken> and sets the appropriate order key and description.

```cobol
       ORDEM SECTION.
           EVALUATE GS-ORDEM
             WHEN 1
                MOVE "CONTRATO" TO GS-DESCR-ORDEM
                START WORK KEY IS NOT < CONTRATO-WK INVALID KEY
                      MOVE "10" TO ST-WORK
             WHEN 2
                MOVE "CIDADE" TO GS-DESCR-ORDEM
                START WORK KEY IS NOT < CIDADE-WK INVALID KEY
                      MOVE "10" TO ST-WORK
             WHEN 3
                MOVE "PADRÃO" TO GS-DESCR-ORDEM
                START WORK KEY IS NOT < PADRAO-WK INVALID KEY
                      MOVE "10" TO ST-WORK
             WHEN 4
                MOVE "MES/ANO" TO GS-DESCR-ORDEM
                START WORK KEY IS NOT < MESANO-WK INVALID KEY
                      MOVE "10" TO ST-WORK
             WHEN 5
                MOVE "REPRESENT" TO GS-DESCR-ORDEM
                START WORK KEY IS NOT < REPRESENT-WK INVALID KEY
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="843">

---

# Generating the header

The CABECALHO section is performed to generate the report header.

```cobol
           PERFORM CABECALHO
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="992">

---

The CABECALHO section moves the order description to <SwmToken path="src/oep/oep053.cbl" pos="993:11:13" line-data="           MOVE GS-DESCR-ORDEM TO ORDEM-REL.">`ORDEM-REL`</SwmToken>, increments the line counter, and writes the header lines to the report.

```cobol
       CABECALHO SECTION.
           MOVE GS-DESCR-ORDEM TO ORDEM-REL.
           ADD 1 TO LIN PAG-W.
           MOVE PAG-W TO PG-REL.
           IF LIN = 1
              WRITE REG-RELAT FROM CAB01
           ELSE WRITE REG-RELAT FROM CAB01 AFTER PAGE.
           WRITE REG-RELAT FROM CAB02 AFTER 2.
           WRITE REG-RELAT FROM CAB03.
           WRITE REG-RELAT FROM CAB04.
           WRITE REG-RELAT FROM CAB03.
           MOVE 6 TO LIN.
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="844">

---

# Moving data to the report

The section then moves spaces to <SwmToken path="src/oep/oep053.cbl" pos="844:7:9" line-data="           MOVE SPACES TO LINDET-REL">`LINDET-REL`</SwmToken> and performs a loop until <SwmToken path="src/oep/oep053.cbl" pos="845:5:7" line-data="           PERFORM UNTIL ST-WORK = &quot;10&quot;">`ST-WORK`</SwmToken> equals '10'. Within the loop, it reads the next record from WORK and performs <SwmToken path="src/oep/oep053.cbl" pos="849:3:7" line-data="                   PERFORM MOVER-DADOS-RELATORIO">`MOVER-DADOS-RELATORIO`</SwmToken> if not at the end.

```cobol
           MOVE SPACES TO LINDET-REL
           PERFORM UNTIL ST-WORK = "10"
              READ WORK NEXT RECORD AT END
                   MOVE "10" TO ST-WORK
              NOT AT END
                   PERFORM MOVER-DADOS-RELATORIO
              END-READ
           END-PERFORM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="892">

---

The <SwmToken path="src/oep/oep053.cbl" pos="892:1:5" line-data="       MOVER-DADOS-RELATORIO SECTION.">`MOVER-DADOS-RELATORIO`</SwmToken> section moves various fields from the WORK record to the report line <SwmToken path="src/oep/oep053.cbl" pos="894:9:11" line-data="           MOVE CONTRATO-WK       TO LINDET-REL(1: 5)">`LINDET-REL`</SwmToken> and updates totals.

```cobol
       MOVER-DADOS-RELATORIO SECTION.
           PERFORM VERIFICA-SUBTOTAL1.
           MOVE CONTRATO-WK       TO LINDET-REL(1: 5)
           MOVE CURSO-WK          TO LINDET-REL(6: 11)
           MOVE CIDADE-WK         TO LINDET-REL(17: 11)
           MOVE QT-FORM-WK        TO LINDET-REL(28: 5)
           ADD QT-FORM-WK TO TOT-FORM
           MOVE PADRAO-WK         TO LINDET-REL(33: 2)
           MOVE MESANO-WK         TO MESANO-I
           MOVE MESANO-I(5: 2)    TO MESANO-W(1: 2)
           MOVE MESANO-I(1: 4)    TO MESANO-W(3: 4)
           MOVE MESANO-W          TO MESANO-E
           MOVE MESANO-E          TO LINDET-REL(35: 8)
           MOVE REPRESENT-WK      TO LINDET-REL(43: 11)
           MOVE ASSINATURA-WK     TO DATA-INV
           CALL "GRIDAT1" USING DATA-INV
           MOVE DATA-INV          TO DATA-E
           MOVE DATA-E            TO LINDET-REL(54: 11)
           MOVE OBJ-ARREC-WK      TO VALOR-E1
           MOVE VALOR-E1          TO LINDET-REL(65: 12)
           ADD OBJ-ARREC-WK TO TOT-OBJ-ARREC
```

---

</SwmSnippet>

<SwmSnippet path="/src/oep/oep053.cbl" line="852">

---

# Finalizing the report

Finally, the section performs <SwmToken path="src/oep/oep053.cbl" pos="852:3:3" line-data="           PERFORM TOTALIZA1">`TOTALIZA1`</SwmToken> and <SwmToken path="src/oep/oep053.cbl" pos="853:3:5" line-data="           PERFORM TOTALIZA-REL.">`TOTALIZA-REL`</SwmToken> to finalize the report.

```cobol
           PERFORM TOTALIZA1
           PERFORM TOTALIZA-REL.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
