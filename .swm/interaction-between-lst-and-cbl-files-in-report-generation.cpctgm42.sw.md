---
title: Interaction between .LST and .CBL files in report generation
---
This document will cover the process of generating a complete report using .LST and .CBL files. We'll cover:

1. Opening and reading input files
2. Calculating report data
3. Writing report data to output files
4. Handling errors during the report generation process.

<SwmSnippet path="/src/kello/cop105.cbl" line="1151">

---

# Opening and reading input files

The <SwmToken path="src/kello/cop105.cbl" pos="1151:1:3" line-data="       IMPRIME-REPORTAGEM SECTION.">`IMPRIME-REPORTAGEM`</SwmToken> section opens multiple input files (RED030, <SwmToken path="src/kello/cop105.cbl" pos="1152:7:7" line-data="           OPEN INPUT RED030 RED300 RED301 RED302 RED303.">`RED300`</SwmToken>, <SwmToken path="src/kello/cop105.cbl" pos="1152:9:9" line-data="           OPEN INPUT RED030 RED300 RED301 RED302 RED303.">`RED301`</SwmToken>, <SwmToken path="src/kello/cop105.cbl" pos="1152:11:11" line-data="           OPEN INPUT RED030 RED300 RED301 RED302 RED303.">`RED302`</SwmToken>, <SwmToken path="src/kello/cop105.cbl" pos="1152:13:13" line-data="           OPEN INPUT RED030 RED300 RED301 RED302 RED303.">`RED303`</SwmToken>) and checks for any errors during the opening process. If an error occurs, it moves an error message to <SwmToken path="src/kello/cop105.cbl" pos="1154:15:19" line-data="              MOVE &quot;ERRO ABERTURA RED030: &quot;  TO GS-MENSAGEM-ERRO">`GS-MENSAGEM-ERRO`</SwmToken> and performs the <SwmToken path="src/kello/cop105.cbl" pos="1156:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section to handle the error.

```cobol
       IMPRIME-REPORTAGEM SECTION.
           OPEN INPUT RED030 RED300 RED301 RED302 RED303.
           IF ST-RED030 <> "00"
              MOVE "ERRO ABERTURA RED030: "  TO GS-MENSAGEM-ERRO
              MOVE ST-RED030 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-RED300 <> "00"
              MOVE "ERRO ABERTURA RED300: "  TO GS-MENSAGEM-ERRO
              MOVE ST-RED300 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-RED301 <> "00"
              MOVE "ERRO ABERTURA RED301: "  TO GS-MENSAGEM-ERRO
              MOVE ST-RED301 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-RED302 <> "00"
              MOVE "ERRO ABERTURA RED302: "  TO GS-MENSAGEM-ERRO
              MOVE ST-RED302 TO GS-MENSAGEM-ERRO(23: 02)
              PERFORM CARREGA-MENSAGEM-ERRO.
           IF ST-RED303 <> "00"
              MOVE "ERRO ABERTURA RED303: "  TO GS-MENSAGEM-ERRO
              MOVE ST-RED303 TO GS-MENSAGEM-ERRO(23: 02)
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop105.cbl" line="1232">

---

# Calculating report data

The <SwmToken path="src/kello/cop105.cbl" pos="1232:1:5" line-data="       CALC-JUROS-REPORTAGEM SECTION.">`CALC-JUROS-REPORTAGEM`</SwmToken> section calculates the interest for the report by computing the average term (<SwmToken path="src/kello/cop105.cbl" pos="1234:3:5" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`PRAZO-MEDIO`</SwmToken>) and the accumulated rate (<SwmToken path="src/kello/cop105.cbl" pos="1236:7:9" line-data="           MOVE 1 TO TAXA-ACUMULADA.">`TAXA-ACUMULADA`</SwmToken>). It then computes the interest (<SwmToken path="src/kello/cop105.cbl" pos="1241:3:5" line-data="           COMPUTE JUROS-W = TOTAL-REPORTAGEM * (TAXA-ACUMULADA - 1).">`JUROS-W`</SwmToken>) based on the total report amount (<SwmToken path="src/kello/cop105.cbl" pos="1234:12:14" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`TOTAL-REPORTAGEM`</SwmToken>).

```cobol
       CALC-JUROS-REPORTAGEM SECTION.
           COMPUTE MESES-W = GRDIAS-NUM-DIAS / 30.
           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /
                                  TOTAL-REPORTAGEM.
           MOVE 1 TO TAXA-ACUMULADA.
           PERFORM VARYING CONT FROM 1 BY 1 UNTIL CONT > PRAZO-MEDIO
               COMPUTE TAXA-ACUMULADA = TAXA-ACUMULADA *
                        ((GS-TAXA / 100) + 1)
           END-PERFORM.
           COMPUTE JUROS-W = TOTAL-REPORTAGEM * (TAXA-ACUMULADA - 1).
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop105.cbl" line="1263">

---

The <SwmToken path="src/kello/cop105.cbl" pos="1263:1:5" line-data="       CALC-DESPESAS-REPORTAGEM SECTION.">`CALC-DESPESAS-REPORTAGEM`</SwmToken> section calculates the expenses for the report by summing various expense fields (e.g., <SwmToken path="src/kello/cop105.cbl" pos="1278:9:13" line-data="               COMPUTE DESPESAS-W = VLR-COMB-R300 + VLR-HOSP-R300 +">`VLR-COMB-R300`</SwmToken>, <SwmToken path="src/kello/cop105.cbl" pos="1278:17:21" line-data="               COMPUTE DESPESAS-W = VLR-COMB-R300 + VLR-HOSP-R300 +">`VLR-HOSP-R300`</SwmToken>). It also converts dates and moves them to the appropriate fields for the report.

```cobol
       CALC-DESPESAS-REPORTAGEM SECTION.
           MOVE DOCTO-WK    TO DOCTO-R300.
           READ RED300 INVALID KEY CONTINUE
             NOT INVALID KEY
               MOVE GS-CONTRATO TO NR-CONTRATO-CO40
               READ COD040 INVALID KEY MOVE ZEROS TO QTDE-FORM-CO40
               END-READ
               MOVE QTDE-FORM-CO40 TO FORM4-REL
      *        se tiver apenas um contrato nesse docto entao perc = 100%
      *        senao calcula a percentagem de formando
               IF QTDE-CONTRATO = 1
                  MOVE 1  TO PERC-FORMANDO
               ELSE COMPUTE PERC-FORMANDO =
                    QTDE-FORM-CO40 / TOTAL-FORMANDO
               END-IF
               COMPUTE DESPESAS-W = VLR-COMB-R300 + VLR-HOSP-R300 +
                  VLR-REFEICAO-R300 + VLR-PASSAGEM-R300 +
                  VLR-ALUGUEL-R300 + VLR-MAT-R300 + VLR-OUTROS-R300
               MOVE DATA-MOV-R300   TO DATA-INV
               CALL "GRIDAT1" USING DATA-INV
               MOVE DATA-INV        TO DATA4-REL
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep100.cbl" line="693">

---

# Writing report data to output files

The <SwmToken path="src/rep/rep100.cbl" pos="693:1:5" line-data="       GRAVAR-DADOS-REPORTAGEM SECTION.">`GRAVAR-DADOS-REPORTAGEM`</SwmToken> section writes the calculated report data to the output file <SwmToken path="src/rep/rep100.cbl" pos="694:3:3" line-data="           CLOSE    RED100">`RED100`</SwmToken>. It handles both the initial write and any necessary rewrites, logging the operations and handling any errors that occur during the write process.

```cobol
       GRAVAR-DADOS-REPORTAGEM SECTION.
           CLOSE    RED100
           OPEN I-O RED100
           MOVE GS-DOCTO              TO DOCTO-R100.
           READ RED100 INVALID KEY
                MOVE 1                TO GRAVA-W
           NOT INVALID KEY
                MOVE 0                TO GRAVA-W.
           MOVE GS-DATA-REPORT        TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV              TO DATA-MOV-R100
           MOVE GS-LCTO-CTA-CORR      TO LCTO-CTA-CORR-R100
           MOVE GS-MESANO             TO MESANO-W
           MOVE MESANO-W(1: 2)        TO MESANO-I(5: 2)
           MOVE MESANO-W(3: 4)        TO MESANO-I(1: 4)
           MOVE MESANO-I              TO ANOMES-R100
           MOVE GS-QT-PESSOAS         TO QTDE-PESSOAS-R100
           MOVE GS-QT-VEICULO         TO QTDE-VEICULOS-R100
           MOVE GS-QT-DIAS            TO QTDE-DIAS-R100
           MOVE GS-QT-FORM            TO QTDE-FORM-R100
           MOVE GS-VLR-COMBUSTIVEL    TO VLR-COMB-R100.
```

---

</SwmSnippet>

<SwmSnippet path="/src/cop/cop105.cbl" line="1487">

---

# Handling errors during the report generation process

The <SwmToken path="src/cop/cop105.cbl" pos="1487:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section is called whenever an error occurs during the report generation process. It loads the error message and calls the dialog system to display the error to the user.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

<SwmSnippet path="/src/rep/rep100.cbl" line="1430">

---

The <SwmToken path="src/rep/rep100.cbl" pos="1430:1:5" line-data="       CARREGA-MENSAGEM-ERRO SECTION.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section in <SwmPath>[src/rep/rep100.cbl](src/rep/rep100.cbl)</SwmPath> performs a similar function, ensuring that any errors encountered during the writing of report data are properly handled and displayed to the user.

```cobol
       CARREGA-MENSAGEM-ERRO SECTION.
           PERFORM LOAD-SCREENSET.
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
