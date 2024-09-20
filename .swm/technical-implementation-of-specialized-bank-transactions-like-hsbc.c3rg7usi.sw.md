---
title: Technical implementation of specialized bank transactions like HSBC
---
This document will cover the implementation of specialized bank transactions for HSBC. We'll cover:

1. Initialization of the program
2. Main processing logic
3. Error handling and message loading
4. Report generation and file handling

<SwmSnippet path="/src/banks/hsbc.cbl" line="338">

---

# Initialization of the program

The `INICIALIZA-PROGRAMA` section initializes the program by accepting command-line parameters, setting up date and time variables, and initializing control blocks. It also opens necessary files and handles any errors during file opening.

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

<SwmSnippet path="/src/banks/hsbc.cbl" line="333">

---

The `MAIN-PROCESS` section calls `INICIALIZA-PROGRAMA` to initialize the program and then proceeds to the main processing logic.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/hsbc.cbl" line="422">

---

# Main processing logic

The `CORPO-PROGRAMA` section contains the main processing logic. It evaluates various conditions and performs corresponding actions such as centralizing data, reading records, generating reports, and updating sequences.

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

<SwmSnippet path="/src/banks/hsbc.cbl" line="1843">

---

# Error handling and message loading

The `CARREGA-MENSAGEM-ERRO` section handles error messages by loading the appropriate screenset and displaying the error message.

```cobol
      *---------------------------------------------------
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W GS-EXIT-FLG.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/hsbc.cbl" line="1856">

---

The `LOAD-SCREENSET` section is called within `CARREGA-MENSAGEM-ERRO` to load the screenset for displaying error messages.

```cobol
           MOVE DS-PUSH-SET TO DS-CONTROL
           MOVE "HSBC"    TO DS-SET-NAME
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/hsbc.cbl" line="1766">

---

# Report generation and file handling

The `IMPRIME-RELATORIO` section handles the generation of reports. It reads records from the input file, processes them, and writes the output to the work file.

```cobol
       IMPRIME-RELATORIO SECTION.
           ACCEPT VARIA-W FROM TIME.
           OPEN OUTPUT WORK
           OPEN INPUT REMES
           MOVE ZEROS TO SEQ-WK
           MOVE ZEROS TO ST-REM
           PERFORM UNTIL ST-REM = "10"
             READ REMES AT END
                  MOVE "10" TO ST-REM
             NOT AT END
                  MOVE REG-REMES (1: 1) TO TIPO-W
                  EVALUATE TIPO-W
                     WHEN 1 MOVE REG-REMES           TO DETALHE-ARQUIVO
                            ADD 1                    TO SEQ-WK
                            MOVE D-NOME-SACADO       TO NOME-WK
                            MOVE D-ENDERECO-SACADO   TO ENDERECO-WK
                            MOVE D-BAIRRO-SACADO     TO BAIRRO-WK
                            MOVE D-CIDADE-SACADO     TO CIDADE-WK
                            MOVE D-UF-SACADO         TO UF-WK
                            MOVE D-CEP-SACADO        TO CEP-WK
                            MOVE D-USO-EMPRESA       TO DOCTO-WK
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/hsbc.cbl" line="997">

---

The `GERA-ARQ-REMESSA` section generates the remittance file by processing the data and writing it to the output file.

```cobol
       GERA-ARQ-REMESSA SECTION.
           MOVE FUNCTION NUMVAL(GS-TIPO-DOCTO(1:1)) TO AUX-TIPO


           MOVE "CLEAR-LIST2" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM

           MOVE GS-MOVTO-INI      TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV          TO MOVTO-INI
           MOVE GS-MOVTO-FIM      TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV          TO MOVTO-FIM


           MOVE GS-VENCTO-INI     TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV          TO VENCTO-INI-INV
           MOVE GS-VENCTO-FIM     TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV          TO VENCTO-FIM-INV
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello" doc-type="follow-up"><sup>Powered by [Swimm](/)</sup></SwmMeta>
