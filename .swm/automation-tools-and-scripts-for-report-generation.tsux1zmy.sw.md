---
title: Automation Tools and Scripts for Report Generation
---
This document will cover the automation tools and scripts used for report generation in the Kello Imagens system. We'll cover:

1. Overview of the <SwmToken path="src/cop/cop119.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP119.">`COP119`</SwmToken> script
2. Overview of the <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> script
3. How these scripts are used for report generation.

<SwmSnippet path="/src/cop/cop119.cbl" line="2">

---

# Overview of the <SwmToken path="src/cop/cop119.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP119.">`COP119`</SwmToken> script

The <SwmToken path="src/cop/cop119.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP119.">`COP119`</SwmToken> script is a COBOL program used for report generation. It initializes the program, processes the main logic, and finalizes the program. Key sections include <SwmToken path="src/cop/cop119.cbl" pos="195:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>, <SwmToken path="src/cop/cop119.cbl" pos="245:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>, and <SwmToken path="src/cop/cop119.cbl" pos="659:1:3" line-data="       FINALIZAR-PROGRAMA SECTION.">`FINALIZAR-PROGRAMA`</SwmToken>.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COP119.
      *DATA: 07-08-2007
      *AUTOR: ALFREDO SAVIOLLI NETO
      *PROGRAMA: EXPORTAÇÃO EVENTOS WEB

       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
           Window             is class "wclass".

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           COPY COPX003.
           COPY COPX040.
           COPY COPX041.
           COPY COPX060.
           COPY CAPX010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop119.cbl" line="195">

---

The <SwmToken path="src/cop/cop119.cbl" pos="195:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section initializes various data blocks and opens input files necessary for the report generation process.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE "COD003"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD003.
           MOVE "COD040"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "COD041"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD041.
           MOVE "COD060"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD060.
           MOVE "IED011"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-IED011.
           MOVE "CAD010"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD010.
           OPEN INPUT CAD010 COD003 COD040 COD041 COD060 IED011
           IF ST-CAD010 <> "00"
              MOVE "ERRO ABERTURA CAD010: "  TO GS-MENSAGEM-ERRO
              MOVE ST-CAD010 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop119.cbl" line="245">

---

The <SwmToken path="src/cop/cop119.cbl" pos="245:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section contains the main logic of the program, including evaluating conditions and performing various tasks such as centralizing data, generating Excel files, and loading lists.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    PERFORM GRAVA-WORK
                    PERFORM CARREGA-LISTA
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM CARREGA-LISTA
               WHEN GS-LE-CIDADE-TRUE
                    PERFORM LER-CIDADE
               WHEN GS-LE-EVENTO-TRUE
                    PERFORM LER-EVENTO
               WHEN GS-POP-CIDADE-TRUE
                    PERFORM POP-CIDADE
               WHEN GS-POP-EVENTO-TRUE
                    PERFORM POP-EVENTO
               WHEN GS-EXCEL-FLG-TRUE
                    PERFORM GERAR-EXCEL
               WHEN GS-SELECIONAR-TUDO-TRUE
                    PERFORM SELECIONAR-TUDO
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop119.cbl" line="659">

---

The <SwmToken path="src/cop/cop119.cbl" pos="659:1:3" line-data="       FINALIZAR-PROGRAMA SECTION.">`FINALIZAR-PROGRAMA`</SwmToken> section closes all opened files and deletes temporary work files, finalizing the report generation process.

```cobol
       FINALIZAR-PROGRAMA SECTION.
           CLOSE COD003 COD040 COD041 COD060 IED011 CAD010

           CLOSE WORK.  DELETE FILE WORK.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="2">

---

# Overview of the <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> script

The <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> script is another COBOL program used for report generation. It follows a similar structure to <SwmToken path="src/cop/cop119.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP119.">`COP119`</SwmToken>, with sections for initialization, main processing, and finalization.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REP132.
      *DATA: 14-06-2007
      *AUTOR: ALFREDO SAVIOLLI NETO
      *PROGRAMA: LISTAGEM DE EVENTOS (CHECK LIST)
       ENVIRONMENT DIVISION.
       SPECIAL-NAMES.
         DECIMAL-POINT IS COMMA
         PRINTER IS LPRINTER.
       class-control.
           Window             is class "wclass".

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY IEPX011.
           COPY COPX040.
           COPY MTPX019.

           SELECT RELAT ASSIGN TO ARQUIVO-IMPRESSAO
                        ORGANIZATION IS LINE SEQUENTIAL
                        ACCESS MODE IS SEQUENTIAL.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="123">

---

The <SwmToken path="src/rep/rep132.cbl" pos="123:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> section in <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> initializes data blocks, opens input files, and handles any errors that occur during initialization.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV TO DATA-DIA-INV.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "IED011"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-IED011.
           MOVE "COD040"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "MTD019"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-MTD019.
           OPEN INPUT COD040 IED011 MTD019.
           IF ST-IED011 <> "00"
              MOVE "ERRO ABERTURA IED011: "  TO GS-MENSAGEM-ERRO
              MOVE ST-IED011 TO GS-MENSAGEM-ERRO(23: 02)
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="159">

---

The <SwmToken path="src/rep/rep132.cbl" pos="159:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section in <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> evaluates conditions and performs tasks such as centralizing data, printing reports, and loading lists.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
               WHEN GS-PRINTER-FLG-TRUE
                    PERFORM IMPRIME-RELATORIO
               WHEN GS-LE-CONTRATO-TRUE
                    PERFORM LE-CONTRATO
               WHEN GS-POPUP-CONTRATO-TRUE
                    PERFORM CHAMA-POPUP-CONTRATO
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM CARREGA-LISTA
           END-EVALUATE
           PERFORM CLEAR-FLAGS.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep132.cbl" line="342">

---

The <SwmToken path="src/rep/rep132.cbl" pos="342:1:3" line-data="       FINALIZAR-PROGRAMA SECTION.">`FINALIZAR-PROGRAMA`</SwmToken> section in <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> closes all opened files and finalizes the report generation process.

```cobol
       FINALIZAR-PROGRAMA SECTION.
           CLOSE IED011 COD040 MTD019.
           MOVE DS-QUIT-SET TO DS-CONTROL
```

---

</SwmSnippet>

# How these scripts are used for report generation

Both <SwmToken path="src/cop/cop119.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP119.">`COP119`</SwmToken> and <SwmToken path="src/rep/rep132.cbl" pos="3:6:6" line-data="       PROGRAM-ID. REP132.">`REP132`</SwmToken> scripts are used to automate the process of report generation in the Kello Imagens system. They handle tasks such as initializing data, processing main logic, and finalizing the report. These scripts ensure that reports are generated efficiently and accurately by automating repetitive tasks and handling errors gracefully.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
