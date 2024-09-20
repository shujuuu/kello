---
title: Overview of RITAU
---
RITAU refers to a program that generates return reports for the bank Itau.

The program processes different types of occurrences reported by the bank, such as accepted, rejected, and settled titles.

For accepted titles, the program records the bank number in the document.

For rejected titles, the program changes the carrier in the file.

For settled titles, the program updates the title status in the file.

If a title is not found during the update, the program generates a problem file for manual correction by the user.

<SwmSnippet path="/src/kello/ritau2.cbl" line="5">

---

# How RITAU Processes Occurrences

The program processes different types of occurrences reported by the bank, such as accepted, rejected, and settled titles.

```cobol
      *EMISSÃO DE RELATÓRIO DE RETORNO DO ITAU
      *CONFORME O TIPO DE OCORRENCIA PELO BANCO O SISTEMA FARÁ:
      *02 - ACEITO PELO BANCO - GRAVA O NR-BANCO NO OUTRO-DOCTO-CR20
      *03 - REJEITADO PELO BANCO - MUDA O PORTADOR DO ARQUIVO CRD020
      *06 - BAIXA DE TÍTULO - FAZ A BAIXA DO TÍTULO NO CRD020
      *NO MOMENTO DA ATUALIZACAO DO CRD020 O TÍTULO NÃO FOR ENCONTRADO
      *O SISTEMA VAI GERAR O ARQUIVO PROBLEMA, QUE TEM POR OBJETIVO
      *LISTAR OS PROBLEMAS P/ QUE O USUÁRIO POSSA ACERTÁ-LO MANUALMENTE.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="655">

---

# Handling Accepted Titles

For accepted titles, the program records the bank number in the document.

```cobol
           MOVE R-NOSSO-NUMERO TO OUTRO-DOCTO-CR20
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="660">

---

# Handling Rejected Titles

For rejected titles, the program changes the carrier in the file.

```cobol
           MOVE 01 TO PORTADOR-CR20.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="665">

---

# Handling Settled Titles

For settled titles, the program updates the title status in the file.

```cobol
           MOVE R-VALOR-PRINCIPAL        TO VALOR-W
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="759">

---

# Generating Problem Files

If a title is not found during the update, the program generates a problem file for manual correction by the user.

```cobol
           MOVE REGISTRO-TRANSACAO TO REG-PROBLEMA
```

---

</SwmSnippet>

# Main functions

There are several main functions in this folder. Some of them are <SwmToken path="src/kello/ritau2.cbl" pos="269:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>, <SwmToken path="src/kello/ritau2.cbl" pos="328:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>, <SwmToken path="src/kello/ritau2.cbl" pos="335:3:5" line-data="                       PERFORM IMPRIME-RELATORIO">`IMPRIME-RELATORIO`</SwmToken>, and <SwmToken path="src/kello/ritau2.cbl" pos="340:3:7" line-data="                    PERFORM ATUALIZA-A-RECEBER">`ATUALIZA-A-RECEBER`</SwmToken>. We will dive a little into <SwmToken path="src/kello/ritau2.cbl" pos="269:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> and <SwmToken path="src/kello/ritau2.cbl" pos="328:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>.

<SwmSnippet path="/src/kello/ritau2.cbl" line="269">

---

## <SwmToken path="src/kello/ritau2.cbl" pos="269:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/ritau2.cbl" pos="269:1:3" line-data="       INICIALIZA-PROGRAMA SECTION.">`INICIALIZA-PROGRAMA`</SwmToken> function initializes the program by accepting parameters from the command line, setting up date values, initializing data blocks, and opening necessary files. It also handles error messages if files cannot be opened.

```cobol
       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           ACCEPT DATA-I FROM DATE.
           MOVE DIA-I TO DIA-W. MOVE MES-I TO MES-W.
           MOVE ANO-I TO ANO-W. MOVE DATA-W TO EMISSAO-REL EMISSAO-REL1.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE "CRD020"   TO ARQ-REC. MOVE EMPRESA-REF  TO PATH-CRD020
           MOVE "CRD020B"  TO ARQ-REC. MOVE EMPRESA-REF  TO PATH-CRD020B
           MOVE "LOGACESS" TO ARQ-REC.  MOVE EMPRESA-REF TO
                                                       ARQUIVO-LOGACESS

           OPEN I-O    CRD020 CRD020B
           CLOSE       CRD020 CRD020B
           OPEN INPUT  CRD020 CRD020B

```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="328">

---

## <SwmToken path="src/kello/ritau2.cbl" pos="328:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/ritau2.cbl" pos="328:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> function contains the main logic of the program. It evaluates different conditions and performs corresponding actions such as centralizing the window, printing reports, loading lists, updating receivables, and validating files.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-PRINTER-FLG-TRUE
                    copy impressora.chama.
                    if lnk-mapeamento <> spaces
                       PERFORM IMPRIME-RELATORIO
                    end-if
               WHEN GS-GERAR-RELATORIO-TRUE
                    PERFORM CARREGA-LISTA
               WHEN GS-ATUALIZA-CTA-REC-TRUE
                    PERFORM ATUALIZA-A-RECEBER
               WHEN GS-LISTA-NAO-ENCONTR-TRUE
                    PERFORM LISTA-NAO-ENCONTRADOS
               WHEN GS-IMPRIME-NAO-ENCON-TRUE
                    copy impressora.chama.
                    if lnk-mapeamento <> spaces
                       PERFORM IMPRIME-NAO-ENCONTRADO
                    end-if
               WHEN GS-VALIDA-ARQUIVO-TRUE
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="491">

---

## <SwmToken path="src/kello/ritau2.cbl" pos="491:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken>

The <SwmToken path="src/kello/ritau2.cbl" pos="491:1:3" line-data="       IMPRIME-RELATORIO SECTION.">`IMPRIME-RELATORIO`</SwmToken> function handles the printing of reports. It initializes values, performs the header setup, and reads the return file to process and print each record.

```cobol
       IMPRIME-RELATORIO SECTION.
           MOVE ZEROS TO LIN.

           copy condensa.

           INITIALIZE VALOR-TOTAL
                      QTDE-PARC
                      ACRESCIMO-TOTAL

           PERFORM CABECALHO.
           PERFORM UNTIL ST-RET = "10"
                READ RETORNO AT END
                     MOVE "10" TO ST-RET
                NOT AT END
                     EVALUATE REG-RETORNO(1:1)
                        WHEN "1"
                             MOVE REG-RETORNO TO REGISTRO-TRANSACAO
                             IF R-NUMDOC <> SPACES
                                MOVE R-USO-EMPRESA(1:1) TO LETRA
                                IF LETRA = "X" OR "A"
                                   MOVE R-USO-EMPRESA(2:1) TO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/ritau2.cbl" line="597">

---

## <SwmToken path="src/kello/ritau2.cbl" pos="597:1:5" line-data="       ATUALIZA-A-RECEBER SECTION.">`ATUALIZA-A-RECEBER`</SwmToken>

The <SwmToken path="src/kello/ritau2.cbl" pos="597:1:5" line-data="       ATUALIZA-A-RECEBER SECTION.">`ATUALIZA-A-RECEBER`</SwmToken> function updates the receivables based on the return file. It processes different occurrence codes to either update the bank number, change the carrier, or settle the title. If a title is not found, it calls the <SwmToken path="src/kello/ritau2.cbl" pos="614:3:7" line-data="                                   PERFORM TITULOS-NAO-ENCONTRADO">`TITULOS-NAO-ENCONTRADO`</SwmToken> function.

```cobol
       ATUALIZA-A-RECEBER SECTION.
           CLOSE      CRD020 CRD020B
           OPEN I-O   CRD020 CRD020B

           CLOSE      RETORNO
           OPEN INPUT RETORNO
           MOVE ZEROS TO ST-RET
           PERFORM UNTIL ST-RET = "10"
               READ RETORNO AT END
                    MOVE "10" TO ST-RET
               NOT AT END
                    MOVE REG-RETORNO(395:6) TO GS-EXIBE-CODIGO
                    MOVE "REFRESH-DISPLAY"  TO DS-PROCEDURE
                    PERFORM CALL-DIALOG-SYSTEM
                    EVALUATE REG-RETORNO(1:1)
                       WHEN "1" MOVE REG-RETORNO TO REGISTRO-TRANSACAO
                                IF R-COD-OCORRENCIA <> 6 AND 3 AND 2
                                   PERFORM TITULOS-NAO-ENCONTRADO
                                ELSE
                                   MOVE R-USO-EMPRESA(1:1) TO LETRA
                                   IF LETRA <> "X"
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
