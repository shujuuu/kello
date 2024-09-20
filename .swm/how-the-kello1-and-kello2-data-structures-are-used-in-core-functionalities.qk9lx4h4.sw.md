---
title: How the KELLO1 and KELLO2 data structures are used in core functionalities
---
This document will cover how the <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> data structures are used in the core functionalities. We'll cover:

1. Definition of <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken>
2. Usage in <SwmToken path="src/kello/cgp010.cbl" pos="3162:1:3" line-data="       ETIQUETA-KELLO SECTION.">`ETIQUETA-KELLO`</SwmToken> section

<SwmSnippet path="/src/kello/cgp010.cbl" line="283">

---

# Definition of <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken>

The <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> data structures are defined in the <SwmPath>[src/kello/cgp010.cbl](src/kello/cgp010.cbl)</SwmPath> file. <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> contains fields like <SwmToken path="src/kello/cgp010.cbl" pos="285:3:5" line-data="           05  ALBUM-KELLO     PIC 9999.9999 BLANK WHEN ZEROS.">`ALBUM-KELLO`</SwmToken>, while <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> contains fields like <SwmToken path="src/kello/cgp010.cbl" pos="291:3:5" line-data="           05  ENDERECO-KELLO  PIC X(26)   VALUE SPACES.">`ENDERECO-KELLO`</SwmToken>.

```cobol
       01  KELLO1.
           05  FILLER          PIC X(10)   VALUE SPACES.
           05  ALBUM-KELLO     PIC 9999.9999 BLANK WHEN ZEROS.
           05  FILLER          PIC X(3)    VALUE SPACES.
           05  NOME-KELLO      PIC X(34)   VALUE SPACES.

       01  KELLO2.
           05  FILLER          PIC X(10)   VALUE SPACES.
           05  ENDERECO-KELLO  PIC X(26)   VALUE SPACES.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cgp010.cbl" line="3155">

---

In the <SwmToken path="src/kello/cgp010.cbl" pos="3162:1:3" line-data="       ETIQUETA-KELLO SECTION.">`ETIQUETA-KELLO`</SwmToken> section, <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> are used to store and manipulate address-related data. For example, <SwmToken path="src/kello/cgp010.cbl" pos="3163:7:9" line-data="           MOVE ZEROS  TO ALBUM-KELLO CEP-KELLO">`ALBUM-KELLO`</SwmToken> from <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="3164:11:13" line-data="           MOVE SPACES TO NOME-KELLO  ENDERECO-KELLO BAIRRO-KELLO">`ENDERECO-KELLO`</SwmToken> from <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> are populated with values from auxiliary variables and other data sources.

```cobol
                    WRITE REG-RELAT FROM LINDET-REL
      *             IF POSICAO <> 2
      *                WRITE REG-RELAT FROM LINDET-REL
      *             END-IF
                  END-IF
                  ADD 1 TO IND.

       ETIQUETA-KELLO SECTION.
           MOVE ZEROS  TO ALBUM-KELLO CEP-KELLO
           MOVE SPACES TO NOME-KELLO  ENDERECO-KELLO BAIRRO-KELLO
                          CIDADE-KELLO

           MOVE ZEROS TO IND

           PERFORM UNTIL IND = GS-QTDE-ETIQUETAS

               MOVE AUX-ALBUM                  TO ALBUM-KELLO
               MOVE AUX-NOME                   TO NOME-KELLO

               EVALUATE GS-OP-ENDERECO
                   WHEN 1  MOVE ENDERECO1-CG11 TO ENDERECO-KELLO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cgp010a.cbl" line="3155">

---

# Usage in <SwmToken path="src/kello/cgp010a.cbl" pos="3155:1:3" line-data="       ETIQUETA-KELLO SECTION.">`ETIQUETA-KELLO`</SwmToken> section

The <SwmToken path="src/kello/cgp010a.cbl" pos="3155:1:3" line-data="       ETIQUETA-KELLO SECTION.">`ETIQUETA-KELLO`</SwmToken> section in <SwmPath>[src/kello/cgp010a.cbl](src/kello/cgp010a.cbl)</SwmPath> shows how <SwmToken path="src/kello/cgp010.cbl" pos="283:3:3" line-data="       01  KELLO1.">`KELLO1`</SwmToken> and <SwmToken path="src/kello/cgp010.cbl" pos="289:3:3" line-data="       01  KELLO2.">`KELLO2`</SwmToken> are used to generate labels. The fields in these structures are populated with data from auxiliary variables and other sources, and then used to create formatted labels.

```cobol
       ETIQUETA-KELLO SECTION.
           MOVE ZEROS  TO ALBUM-KELLO CEP-KELLO
           MOVE SPACES TO NOME-KELLO  ENDERECO-KELLO BAIRRO-KELLO
                          CIDADE-KELLO

           MOVE ZEROS TO IND

           PERFORM UNTIL IND = GS-QTDE-ETIQUETAS

               MOVE AUX-ALBUM                  TO ALBUM-KELLO
               MOVE AUX-NOME                   TO NOME-KELLO

               EVALUATE GS-OP-ENDERECO
                   WHEN 1  MOVE ENDERECO1-CG11 TO ENDERECO-KELLO
                           MOVE BAIRRO1-CG11   TO BAIRRO-KELLO
                           MOVE CEP1-CG11      TO CEP-KELLO
                           MOVE CIDADE1-CG11   TO CIDADE
                           READ CAD010 INVALID KEY
                                MOVE SPACES    TO NOME-COMPL-CID UF-CID
                           END-READ
                           STRING NOME-COMPL-CID " - " UF-CID
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
