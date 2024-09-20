---
title: Process of Report Generation
---
This document will cover the process of generating reports in the <SwmPath>[src/kello/](src/kello/)</SwmPath> directory. We'll cover:

1. The <SwmToken path="src/kello/cop105.cbl" pos="1234:12:14" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`TOTAL-REPORTAGEM`</SwmToken> section
2. The <SwmToken path="src/kello/cop105.cbl" pos="1244:1:5" line-data="       VERIF-QTDE-CONTRATO SECTION.">`VERIF-QTDE-CONTRATO`</SwmToken> section.

<SwmSnippet path="/src/kello/cop105.cbl" line="1232">

---

# The <SwmToken path="src/kello/cop105.cbl" pos="1234:12:14" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`TOTAL-REPORTAGEM`</SwmToken> Section

The <SwmToken path="src/kello/cop105.cbl" pos="1234:12:14" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`TOTAL-REPORTAGEM`</SwmToken> section is responsible for calculating the interest (<SwmToken path="src/kello/cop105.cbl" pos="1241:3:5" line-data="           COMPUTE JUROS-W = TOTAL-REPORTAGEM * (TAXA-ACUMULADA - 1).">`JUROS-W`</SwmToken>) based on the total report value (<SwmToken path="src/kello/cop105.cbl" pos="1234:12:14" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`TOTAL-REPORTAGEM`</SwmToken>). It computes the average term (<SwmToken path="src/kello/cop105.cbl" pos="1234:3:5" line-data="           COMPUTE PRAZO-MEDIO ROUNDED = (TOTAL-REPORTAGEM * MESES-W) /">`PRAZO-MEDIO`</SwmToken>) and accumulates the interest rate (<SwmToken path="src/kello/cop105.cbl" pos="1236:7:9" line-data="           MOVE 1 TO TAXA-ACUMULADA.">`TAXA-ACUMULADA`</SwmToken>) over the period.

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

<SwmSnippet path="/src/kello/cop105.cbl" line="1243">

---

# The <SwmToken path="src/kello/cop105.cbl" pos="1244:1:5" line-data="       VERIF-QTDE-CONTRATO SECTION.">`VERIF-QTDE-CONTRATO`</SwmToken> Section

The <SwmToken path="src/kello/cop105.cbl" pos="1244:1:5" line-data="       VERIF-QTDE-CONTRATO SECTION.">`VERIF-QTDE-CONTRATO`</SwmToken> section verifies the number of contracts in the document (<SwmToken path="src/kello/cop105.cbl" pos="1245:3:5" line-data="           MOVE DOCTO-WK TO DOCTO-R301">`DOCTO-WK`</SwmToken>). It reads records from the <SwmToken path="src/kello/cop105.cbl" pos="1247:3:3" line-data="           START RED301 KEY IS NOT &lt; CHAVE-R301 INVALID KEY">`RED301`</SwmToken> file and counts the number of contracts, storing the result in <SwmToken path="src/kello/cop105.cbl" pos="1244:3:5" line-data="       VERIF-QTDE-CONTRATO SECTION.">`QTDE-CONTRATO`</SwmToken>.

```cobol
      * VERIFICA QTDE DE CONTRATOS NO DOCTO
       VERIF-QTDE-CONTRATO SECTION.
           MOVE DOCTO-WK TO DOCTO-R301
           MOVE ZEROS    TO CONTRATO-R301.
           START RED301 KEY IS NOT < CHAVE-R301 INVALID KEY
                 MOVE "10" TO ST-RED301.
           MOVE ZEROS TO QTDE-CONTRATO TOTAL-FORMANDO
           PERFORM UNTIL ST-RED301 = "10"
             READ RED301 NEXT RECORD AT END MOVE "10" TO ST-RED301
               NOT AT END
                 IF DOCTO-R301 <> DOCTO-WK MOVE "10" TO ST-RED301
                 ELSE
                    ADD 1 TO QTDE-CONTRATO
                    MOVE CONTRATO-R301 TO NR-CONTRATO-CO40
                    READ COD040 INVALID KEY MOVE ZEROS TO QTDE-FORM-CO40
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
