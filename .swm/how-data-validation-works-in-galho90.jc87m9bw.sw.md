---
title: How Data Validation Works in GALHO90
---
This document will cover the process of data validation in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken>, which includes:

1. Overview of data validation in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken>
2. Key variables and functions involved
3. Data validation flow

# Overview of data validation in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken>

Data validation in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken> is implemented across several files, including <SwmPath>[src/galho/galho90.cbl](src/galho/galho90.cbl)</SwmPath>, <SwmPath>[src/kello/galho90.cbl](src/kello/galho90.cbl)</SwmPath>, and <SwmPath>[src/kello/galho100.cbl](src/kello/galho100.cbl)</SwmPath>. The primary purpose of data validation in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken> is to ensure that the financial scheduling data is accurate and meets the required format before processing.

# Key variables and functions involved

Several key variables and functions are involved in the data validation process in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken>. These include <SwmToken path="src/galho/galho90.cbl" pos="41:3:5" line-data="           05  DATA-E                PIC 99/99/9999.">`DATA-E`</SwmToken>, <SwmToken path="src/galho/galho90.cbl" pos="77:3:5" line-data="           05  WS-DATA               PIC 9(08)    VALUE ZEROS.">`WS-DATA`</SwmToken>, <SwmToken path="src/galho/galho90.cbl" pos="254:1:3" line-data="       0018-DATA.">`0018-DATA`</SwmToken>, and <SwmToken path="src/kello/galho100.cbl" pos="94:1:3" line-data="       0010-DATA.">`0010-DATA`</SwmToken>.

<SwmSnippet path="/src/galho/galho90.cbl" line="39">

---

# Key variables and functions involved

The variable <SwmToken path="src/galho/galho90.cbl" pos="41:3:5" line-data="           05  DATA-E                PIC 99/99/9999.">`DATA-E`</SwmToken> is defined to hold date values in the format <SwmToken path="src/galho/galho90.cbl" pos="41:9:13" line-data="           05  DATA-E                PIC 99/99/9999.">`99/99/9999`</SwmToken>. This variable is crucial for validating date inputs.

```cobol
           05  CLIENTE-E             PIC ZZZZ.ZZZZ VALUE ZEROS.
           05  SEQ-E                 PIC ZZZZZ    VALUE ZEROS.
           05  DATA-E                PIC 99/99/9999.
```

---

</SwmSnippet>

<SwmSnippet path="/src/galho/galho90.cbl" line="75">

---

The variable <SwmToken path="src/galho/galho90.cbl" pos="77:3:5" line-data="           05  WS-DATA               PIC 9(08)    VALUE ZEROS.">`WS-DATA`</SwmToken> is used to store date values temporarily during the validation process.

```cobol
           05  ACHEI                 PIC X(01)    VALUE SPACES.
           05  ACP-DATA-EMISSAO      PIC 9(08)    VALUE ZEROS.
           05  WS-DATA               PIC 9(08)    VALUE ZEROS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/galho/galho90.cbl" line="254">

---

The function <SwmToken path="src/galho/galho90.cbl" pos="254:1:3" line-data="       0018-DATA.">`0018-DATA`</SwmToken> prompts the user to input a date and validates it. If the input is zero, it prompts the user again.

```cobol
       0018-DATA.

           DISPLAY "Informar Data: " AT 0301
           MOVE ZEROS TO ACP-DATA
           MOVE ACP-DATA TO MASC-DT
           DISPLAY MASC-DT AT 0316
           ACCEPT MASC-DT  AT 0316
           MOVE MASC-DT TO ACP-DATA

           IF ACP-DATA = 0
              GO TO 0018-DATA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/galho100.cbl" line="94">

---

The function <SwmToken path="src/kello/galho100.cbl" pos="94:1:3" line-data="       0010-DATA.">`0010-DATA`</SwmToken> prompts the user to input a period and validates it. If the input is zero, it prompts the user again.

```cobol
       0010-DATA.
           display "Informar o Periodo: " at 0101
           accept masc-dtini              at 0121
           move masc-dtini                to acp-dtini
           if acp-dtini = 0
              go to 0010-data.
```

---

</SwmSnippet>

# Data validation flow

The data validation flow in <SwmToken path="src/galho/galho90.cbl" pos="2:6:6" line-data="       PROGRAM-ID. GALHO90.">`GALHO90`</SwmToken> involves several steps. First, the user is prompted to input a date or period. The input is then checked for validity. If the input is zero or does not meet the required format, the user is prompted again. Once the input is validated, it is processed further.

<SwmSnippet path="/src/galho/galho90.cbl" line="254">

---

# Data validation flow

The function <SwmToken path="src/galho/galho90.cbl" pos="254:1:3" line-data="       0018-DATA.">`0018-DATA`</SwmToken> demonstrates the data validation flow. It prompts the user for a date, validates the input, and processes it if valid.

```cobol
       0018-DATA.

           DISPLAY "Informar Data: " AT 0301
           MOVE ZEROS TO ACP-DATA
           MOVE ACP-DATA TO MASC-DT
           DISPLAY MASC-DT AT 0316
           ACCEPT MASC-DT  AT 0316
           MOVE MASC-DT TO ACP-DATA

           IF ACP-DATA = 0
              GO TO 0018-DATA.


           INITIALIZE REG-CPD099
           STRING ACP-DATA(5:4) ACP-DATA(3:2) ACP-DATA(1:2) INTO
                  DATA-MOVTO-CP99
           MOVE DATA-MOVTO-CP99 TO AUX-DATA
           START CPD099 KEY IS NOT LESS DATA-MOVTO-CP99 INVALID KEY
               MOVE "10" TO ST-CPD099.

           PERFORM UNTIL ST-CPD099 = "10"
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/galho100.cbl" line="94">

---

The functions <SwmToken path="src/kello/galho100.cbl" pos="94:1:3" line-data="       0010-DATA.">`0010-DATA`</SwmToken> and <SwmToken path="src/kello/galho100.cbl" pos="101:1:3" line-data="       0010-data2.">`0010-data2`</SwmToken> in <SwmPath>[src/kello/galho100.cbl](src/kello/galho100.cbl)</SwmPath> show the flow of validating a period input. They prompt the user for a start and end date, validate the inputs, and process them if valid.

```cobol
       0010-DATA.
           display "Informar o Periodo: " at 0101
           accept masc-dtini              at 0121
           move masc-dtini                to acp-dtini
           if acp-dtini = 0
              go to 0010-data.

       0010-data2.
           display " ate "                at 0132
           accept masc-dtfim              at 0137
           move masc-dtfim                to acp-dtfim
           if acp-dtfim = 0
              go to 0010-data2.


           STRING ACP-DTFIM(5:4) ACP-DTFIM(3:2) ACP-DTFIM(1:2)
                                        INTO DATA-FIM
           INITIALIZE REG-CRD020
           MOVE 5                         TO SITUACAO-CR20
           STRING ACP-DTINI(5:4) ACP-DTINI(3:2) ACP-DTINI(1:2)
                                        INTO DATA-VENCTO-CR20
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
