---
title: Understanding HSBC Bank Transactions
---
HSBC refers to a specific COBOL program designed to handle bank transactions for HSBC bank.

The program generates a file named <SwmToken path="src/kello/hsbc.cbl" pos="5:6:8" line-data="      *GERA ARQUIVO XXXXXXXX.REM P/ HSBC">`XXXXXXXX.REM`</SwmToken> for HSBC, which is likely used for electronic data interchange (EDI) transactions.

The program includes various sections such as the <SwmToken path="src/kello/hsbc.cbl" pos="2:1:3" line-data="       IDENTIFICATION DIVISION.">`IDENTIFICATION DIVISION`</SwmToken>, <SwmToken path="src/kello/hsbc.cbl" pos="7:1:3" line-data="       ENVIRONMENT DIVISION.">`ENVIRONMENT DIVISION`</SwmToken>, and <SwmToken path="src/kello/hsbc.cbl" pos="53:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken>, which define the program's metadata, configuration, and data structures respectively.

The <SwmToken path="src/kello/hsbc.cbl" pos="54:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> includes file definitions and data structures like <SwmToken path="src/kello/hsbc.cbl" pos="73:3:5" line-data="       01  REG-WORK.">`REG-WORK`</SwmToken>, <SwmToken path="src/kello/hsbc.cbl" pos="101:3:5" line-data="       01  REG-RELAT.">`REG-RELAT`</SwmToken>, and <SwmToken path="src/kello/hsbc.cbl" pos="214:3:5" line-data="          02 D-BANCO               PIC 9(003).">`D-BANCO`</SwmToken>, which are used to manage and process transaction data.

The program also includes a section called <SwmToken path="src/kello/hsbc.cbl" pos="1271:3:5" line-data="                            PERFORM GRAVA-ANOTACAO">`GRAVA-ANOTACAO`</SwmToken>, which is responsible for recording annotations related to transactions.

<SwmSnippet path="/src/kello/hsbc.cbl" line="3">

---

# HSBC Program

The <SwmToken path="src/kello/hsbc.cbl" pos="3:6:6" line-data="       PROGRAM-ID.    HSBC.">`HSBC`</SwmToken> program is identified and authored by Alfredo Saviolli Neto. It is designed to generate a file for HSBC bank transactions.

```cobol
       PROGRAM-ID.    HSBC.
       AUTHOR.        ALFREDO SAVIOLLI NETO.
      *GERA ARQUIVO XXXXXXXX.REM P/ HSBC
       DATE-WRITTEN.  08-10-2010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/hsbc.cbl" line="7">

---

# Configuration Section

The <SwmToken path="src/kello/hsbc.cbl" pos="8:1:3" line-data="       CONFIGURATION SECTION.">`CONFIGURATION SECTION`</SwmToken> sets up special names and printer configurations for the program.

```cobol
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA
                      PRINTER IS LPRINTER.
       class-control.
           Window             is class "wclass".
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/hsbc.cbl" line="13">

---

# File Control

The <SwmToken path="src/kello/hsbc.cbl" pos="14:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> section includes various file definitions and copies necessary for the program's operation.

```cobol
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX001.
           COPY CAPX010.
           COPY CAPX018.
           COPY CRPX020.
           COPY CGPX001.
           COPY CGPX010.
           COPY CGPX011.
           COPY CRPX200.
           COPY CRPX201.
           COPY BOLHSBC.SEL.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/hsbc.cbl" line="53">

---

# Data Division

The <SwmToken path="src/kello/hsbc.cbl" pos="53:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken> includes the <SwmToken path="src/kello/hsbc.cbl" pos="54:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> which defines the structure of files like <SwmToken path="src/kello/hsbc.cbl" pos="73:3:5" line-data="       01  REG-WORK.">`REG-WORK`</SwmToken> and <SwmToken path="src/kello/hsbc.cbl" pos="101:3:5" line-data="       01  REG-RELAT.">`REG-RELAT`</SwmToken> used in the program.

```cobol
       DATA DIVISION.
       FILE SECTION.
       COPY CAPW001.
       COPY CAPW010.
       COPY CAPW018.
       COPY CRPW020.
       COPY CGPW001.
       COPY CGPW010.
       COPY CGPW011.
       COPY CRPW200.
       COPY CRPW201.
       COPY BOLHSBC.FD.
       COPY LOGACESS.FD.
```

---

</SwmSnippet>

# Main functions

There are several main functions in this program. Some of them are <SwmToken path="src/kello/hsbc.cbl" pos="338:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>, <SwmToken path="src/kello/hsbc.cbl" pos="422:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>, and <SwmToken path="src/kello/hsbc.cbl" pos="336:3:5" line-data="           GO FINALIZAR-PROGRAMA.">`FINALIZAR-PROGRAMA`</SwmToken>. We will dive a little into these functions.

<SwmSnippet path="/src/kello/hsbc.cbl" line="338">

---

## <SwmToken path="src/kello/hsbc.cbl" pos="338:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/hsbc.cbl" pos="338:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> function initializes the program by accepting parameters from the command line, setting up date and time variables, and opening necessary files.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           ACCEPT DATA-I FROM DATE.
           MOVE DIA-I TO DIA-W.
           MOVE MES-I TO MES-W.
           MOVE ANO-I TO ANO-W.
           MOVE DATA-W TO DATA-DIA.
           MOVE DATA-I(3: 4) TO DATA-DIA-I(5: 4)
           MOVE ANO-I        TO DATA-DIA-I(3: 2)
           IF ANO-I > 90 MOVE "19" TO DATA-DIA-I(1: 2)
           ELSE MOVE 20 TO DATA-DIA-I(1: 2).
           ACCEPT HORA-BRA FROM TIME.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE "CGD001" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD001.
           MOVE "CGD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/hsbc.cbl" line="422">

---

## <SwmToken path="src/kello/hsbc.cbl" pos="422:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/hsbc.cbl" pos="422:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> function contains the main logic of the program. It evaluates various conditions and performs corresponding actions such as reading data, generating reports, and updating records.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
                   MOVE 1 TO GS-CEP GS-CPF GS-ENDERECO
                   REFRESH-OBJECT PRINCIPAL
                   PERFORM LER
               WHEN GS-IMPRIMIR-RELATORIO-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
               WHEN GS-GERAR-REMESSA-TRUE
                    IF GS-OPCAO = 1
                       PERFORM GERAR-SACADO
                    ELSE
                       PERFORM GERA-ARQ-REMESSA
                    END-IF
               WHEN GS-LE-PORTADOR-TRUE
                    PERFORM LER-PORTADOR
               WHEN GS-POPUP-PORTADOR-TRUE
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/hsbc.cbl" line="1868">

---

## <SwmToken path="src/kello/hsbc.cbl" pos="336:3:5" line-data="           GO FINALIZAR-PROGRAMA.">`FINALIZAR-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/hsbc.cbl" pos="336:3:5" line-data="           GO FINALIZAR-PROGRAMA.">`FINALIZAR-PROGRAMA`</SwmToken> function finalizes the program by closing files, logging the program's status, and exiting the program.

```cobol
           open i-o logacess

           move function current-date to ws-data-sys

           move usuario-w           to logacess-usuario
           move ws-data-cpu         to logacess-data
           accept ws-hora-sys from time
           move ws-hora-sys         to logacess-horas
           move 1                   to logacess-sequencia
           move "HSBC"              to logacess-programa
           move "FECHADO"           to logacess-status
           move "10" to fs-logacess
           perform until fs-logacess = "00"
                write reg-logacess invalid key
                    add 1 to logacess-sequencia
                not invalid key
                    move "00" to fs-logacess
                end-write
           end-perform

           close logacess
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
