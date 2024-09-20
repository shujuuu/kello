---
title: Overview of COP104 Program
---
This document provides an overview of the <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> program, which is a COBOL-85 program used for business operations management. The program initializes, processes contract data, moves data to a work area, evaluates conditions, and handles work file operations.

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> program starts by initializing and setting up the necessary parameters. It then processes contract data by moving date values and performing key-based searches. Next, it moves various data fields to a work area and performs status checks. The program evaluates different conditions and performs corresponding actions, such as centralizing data, verifying status, printing reports, and loading lists. Finally, it handles work file operations by closing, deleting, and reopening the work file, and performs additional operations based on filter values.

Here is a high level diagram of the flow, showing only the most important functions:

```mermaid
graph TD;
      subgraph "src/kello/Cópia (2) de cop104.cbl"
4edc7d169228563c5c0bda7511e4afb5c5862e07ff736f1b6a17137065b0a26c(COP104):::mainFlowStyle --> 860b3995867616c7f514144b1c53f7ec2df698367e6ea59de17ad63887b2fe2f(PREV-CONTRATO)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
4edc7d169228563c5c0bda7511e4afb5c5862e07ff736f1b6a17137065b0a26c(COP104):::mainFlowStyle --> 16664762a25fae4813ca326c2f359d3f98735526a33c7937a726f22e720014e1(MOVER-DADOS-WORK)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
4edc7d169228563c5c0bda7511e4afb5c5862e07ff736f1b6a17137065b0a26c(COP104):::mainFlowStyle --> 36ebb7aa89941afa165d3c98dfcde190aeda321f7e958f7b98207aac23f6395b(CORPO-PROGRAMA):::mainFlowStyle
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
36ebb7aa89941afa165d3c98dfcde190aeda321f7e958f7b98207aac23f6395b(CORPO-PROGRAMA):::mainFlowStyle --> cdf7703f26d76159c7d22bc28ae22376576025b6f1a26c241fea5d57f254f9a4(GRAVA-WORK):::mainFlowStyle
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
cdf7703f26d76159c7d22bc28ae22376576025b6f1a26c241fea5d57f254f9a4(GRAVA-WORK):::mainFlowStyle --> 860b3995867616c7f514144b1c53f7ec2df698367e6ea59de17ad63887b2fe2f(PREV-CONTRATO)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
cdf7703f26d76159c7d22bc28ae22376576025b6f1a26c241fea5d57f254f9a4(GRAVA-WORK):::mainFlowStyle --> d4270ea6d4946b649027f3e62968431c420618e0cb80d858208a4f61368a7003(DATA-VENDA-PRODUCAO):::mainFlowStyle
end


      classDef mainFlowStyle color:#000000,fill:#7CB9F4
classDef rootsStyle color:#000000,fill:#00FFF4
classDef Style1 color:#000000,fill:#00FFAA
classDef Style2 color:#000000,fill:#FFFF00
classDef Style3 color:#000000,fill:#AA7CB9
```

# Flow drill down

First, we'll zoom into this section of the flow:

```mermaid
graph TD;
      subgraph "src/kello/Cópia (2) de cop104.cbl"
4edc7d169228563c5c0bda7511e4afb5c5862e07ff736f1b6a17137065b0a26c(COP104):::mainFlowStyle --> 860b3995867616c7f514144b1c53f7ec2df698367e6ea59de17ad63887b2fe2f(PREV-CONTRATO)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
4edc7d169228563c5c0bda7511e4afb5c5862e07ff736f1b6a17137065b0a26c(COP104):::mainFlowStyle --> 16664762a25fae4813ca326c2f359d3f98735526a33c7937a726f22e720014e1(MOVER-DADOS-WORK)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
4edc7d169228563c5c0bda7511e4afb5c5862e07ff736f1b6a17137065b0a26c(COP104):::mainFlowStyle --> 36ebb7aa89941afa165d3c98dfcde190aeda321f7e958f7b98207aac23f6395b(CORPO-PROGRAMA):::mainFlowStyle
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
36ebb7aa89941afa165d3c98dfcde190aeda321f7e958f7b98207aac23f6395b(CORPO-PROGRAMA):::mainFlowStyle --> fzu3b(...)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
860b3995867616c7f514144b1c53f7ec2df698367e6ea59de17ad63887b2fe2f(PREV-CONTRATO) --> 16664762a25fae4813ca326c2f359d3f98735526a33c7937a726f22e720014e1(MOVER-DADOS-WORK)
end


      classDef mainFlowStyle color:#000000,fill:#7CB9F4
classDef rootsStyle color:#000000,fill:#00FFF4
classDef Style1 color:#000000,fill:#00FFAA
classDef Style2 color:#000000,fill:#FFFF00
classDef Style3 color:#000000,fill:#AA7CB9
```

<SwmSnippet path="/src/kello/Cópia (2) de cop104.cbl" line="640">

---

## <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken>

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> function initializes the program by performing the <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="641:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> section, which accepts parameters from the command line.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.

       INICIALIZA-PROGRAMA SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/Cópia (2) de cop104.cbl" line="1212">

---

## <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="1212:1:3" line-data="       PREV-CONTRATO SECTION.">`PREV-CONTRATO`</SwmToken>

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="1212:1:3" line-data="       PREV-CONTRATO SECTION.">`PREV-CONTRATO`</SwmToken> function processes contract data by moving date values, starting a key-based search, and performing a loop to read records and move data to the work area.

```cobol
       PREV-CONTRATO SECTION.
           MOVE GS-MESANO-INI  TO MESANO-W
           MOVE MESANO-W(1: 2) TO MESANO-I(5: 2)
           MOVE MESANO-W(3: 4) TO MESANO-I(1: 4)
           MOVE MESANO-I       TO MESANO-INI
           MOVE GS-MESANO-FIM  TO MESANO-W
           MOVE MESANO-W(1: 2) TO MESANO-I(5: 2)
           MOVE MESANO-W(3: 4) TO MESANO-I(1: 4)
           MOVE MESANO-I       TO MESANO-FIM


           MOVE MESANO-INI     TO MESANO-PREV-CO40
           MOVE ZEROS          TO NR-CONTRATO-CO40
           START COD040 KEY IS NOT < ALT1-CO40 INVALID KEY
                 MOVE "10" TO ST-COD040.

           PERFORM UNTIL ST-COD040 = "10"
                 READ COD040 NEXT RECORD AT END
                      MOVE "10" TO ST-COD040
                 NOT AT END
                      MOVE NR-CONTRATO-CO40 TO GS-EXIBE-CONTRATO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/Cópia (2) de cop104.cbl" line="1245">

---

## <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="1245:1:5" line-data="       MOVER-DADOS-WORK SECTION.">`MOVER-DADOS-WORK`</SwmToken>

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="1245:1:5" line-data="       MOVER-DADOS-WORK SECTION.">`MOVER-DADOS-WORK`</SwmToken> function initializes the work area, performs status checks, moves various data fields, computes values, and writes the work record.

```cobol
       MOVER-DADOS-WORK SECTION.
           INITIALIZE REG-WORK.
      *    IF STATUS-CO40 < 50
      *       CONTINUE
      *    ELSE
              PERFORM PESQUISAR-STATUS
              IF ACHEI = "S"
                 MOVE CIDADE-CO40        TO CIDADE
                 READ CAD010 INVALID KEY
                      MOVE SPACES TO NOME-CID
                      MOVE SPACES TO UF-CID
                      MOVE ZEROS  TO REGIAO-CID
                 END-READ
                 IF GS-UF = SPACES OR UF-CID
                    IF GS-REGIAO = ZEROS OR REGIAO-CID
                       MOVE MESANO-PREV-CO40   TO MESANO-WK
                       MOVE NR-CONTRATO-CO40   TO CONTRATO-WK
                       MOVE NOME-CID           TO CIDADE-WK
                       MOVE REGIAO-CID         TO CODIGO-REG
                       READ CAD012 INVALID KEY
                            MOVE SPACES TO NOME-REG
```

---

</SwmSnippet>

Now, lets zoom into this section of the flow:

```mermaid
graph TD;
      subgraph "src/kello/Cópia (2) de cop104.cbl"
36ebb7aa89941afa165d3c98dfcde190aeda321f7e958f7b98207aac23f6395b(CORPO-PROGRAMA):::mainFlowStyle --> cdf7703f26d76159c7d22bc28ae22376576025b6f1a26c241fea5d57f254f9a4(GRAVA-WORK):::mainFlowStyle
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
cdf7703f26d76159c7d22bc28ae22376576025b6f1a26c241fea5d57f254f9a4(GRAVA-WORK):::mainFlowStyle --> 860b3995867616c7f514144b1c53f7ec2df698367e6ea59de17ad63887b2fe2f(PREV-CONTRATO)
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
cdf7703f26d76159c7d22bc28ae22376576025b6f1a26c241fea5d57f254f9a4(GRAVA-WORK):::mainFlowStyle --> d4270ea6d4946b649027f3e62968431c420618e0cb80d858208a4f61368a7003(DATA-VENDA-PRODUCAO):::mainFlowStyle
end

subgraph "src/kello/Cópia (2) de cop104.cbl"
860b3995867616c7f514144b1c53f7ec2df698367e6ea59de17ad63887b2fe2f(PREV-CONTRATO) --> 16664762a25fae4813ca326c2f359d3f98735526a33c7937a726f22e720014e1(MOVER-DADOS-WORK)
end


      classDef mainFlowStyle color:#000000,fill:#7CB9F4
classDef rootsStyle color:#000000,fill:#00FFF4
classDef Style1 color:#000000,fill:#00FFAA
classDef Style2 color:#000000,fill:#FFFF00
classDef Style3 color:#000000,fill:#AA7CB9
```

<SwmSnippet path="/src/kello/Cópia (2) de cop104.cbl" line="764">

---

## <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="642:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="642:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> section evaluates various conditions and performs corresponding actions. For example, if <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="765:3:7" line-data="               WHEN GS-CENTRALIZA-TRUE">`GS-CENTRALIZA-TRUE`</SwmToken> is true, it performs <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="766:3:3" line-data="                    PERFORM CENTRALIZAR">`CENTRALIZAR`</SwmToken> and <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="767:3:7" line-data="                    PERFORM VERIFICAR-SENHA-STATUS">`VERIFICAR-SENHA-STATUS`</SwmToken>. If <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="770:3:11" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GS-GRAVA-WORK-FLG-TRUE`</SwmToken> is true, it displays a message and, based on the user's response, performs <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="770:5:7" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GRAVA-WORK`</SwmToken>, resets variables, and loads a list.

```cobol
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
                    PERFORM VERIFICAR-SENHA-STATUS
               WHEN GS-PRINTER-FLG-TRUE
                    PERFORM IMPRIME-RELATORIO
               WHEN GS-GRAVA-WORK-FLG-TRUE
                    MOVE "Deseja Realmente Carregar os Dados ?" TO
                    MENSAGEM
                    MOVE "Q" TO TIPO-MSG
                    PERFORM EXIBIR-MENSAGEM
                    IF RESP-MSG = "S"
                       PERFORM GRAVA-WORK
                       PERFORM ZERA-VARIAVEIS
                       PERFORM CARREGA-LISTA
                    END-IF
               WHEN GS-CARREGA-LISTA-FLG-TRUE
                    PERFORM ZERA-VARIAVEIS
                    PERFORM CARREGA-LISTA
               WHEN GS-LE-REGIAO-TRUE
                    PERFORM LE-REGIAO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/Cópia (2) de cop104.cbl" line="958">

---

## <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="958:1:3" line-data="       GRAVA-WORK SECTION.">`GRAVA-WORK`</SwmToken>

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="958:1:3" line-data="       GRAVA-WORK SECTION.">`GRAVA-WORK`</SwmToken> section handles the work file operations. It closes and deletes the work file if a certain condition is met, accepts a time variable, and then reopens the work file. It also evaluates a filter operation and performs either <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="972:7:11" line-data="               WHEN 1 PERFORM DATA-VENDA-PRODUCAO">`DATA-VENDA-PRODUCAO`</SwmToken> or <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="973:7:9" line-data="               WHEN 2 PERFORM PREV-CONTRATO">`PREV-CONTRATO`</SwmToken> based on the filter value.

```cobol
       GRAVA-WORK SECTION.
           IF ST-WORK NOT = "35"
              CLOSE       WORK
              DELETE FILE WORK.

           ACCEPT VARIA-W FROM TIME
           OPEN OUTPUT WORK
           CLOSE       WORK
           OPEN I-O    WORK

           MOVE "TELA-AGUARDA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM

           EVALUATE GS-OP-FILTRO
               WHEN 1 PERFORM DATA-VENDA-PRODUCAO
               WHEN 2 PERFORM PREV-CONTRATO
           END-EVALUATE


           MOVE "TELA-AGUARDA2" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/Cópia (2) de cop104.cbl" line="980">

---

## <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="980:1:5" line-data="       DATA-VENDA-PRODUCAO SECTION.">`DATA-VENDA-PRODUCAO`</SwmToken>

The <SwmToken path="src/kello/Cópia (2) de cop104.cbl" pos="980:1:5" line-data="       DATA-VENDA-PRODUCAO SECTION.">`DATA-VENDA-PRODUCAO`</SwmToken> section initializes records, processes date ranges, and performs various operations based on the data. It opens auxiliary files, evaluates data operations, and processes records by reading and writing to files. It also calculates various metrics and performs additional operations if certain conditions are met.

```cobol
       DATA-VENDA-PRODUCAO SECTION.
           INITIALIZE REG-RCD100

           MOVE GS-DATA-INI TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV    TO VECTO-INI
           MOVE GS-DATA-FIM TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV    TO VECTO-FIM

           OPEN OUTPUT AUXILIAR AUXILIAR2
           CLOSE       AUXILIAR AUXILIAR2
           OPEN I-O    AUXILIAR AUXILIAR2

           EVALUATE GS-OP-DATA
               WHEN 1 PERFORM POR-VENDA
               WHEN 2 PERFORM POR-PRODUCAO
           END-EVALUATE

           CLOSE       AUXILIAR AUXILIAR2
           OPEN INPUT  AUXILIAR AUXILIAR2
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
