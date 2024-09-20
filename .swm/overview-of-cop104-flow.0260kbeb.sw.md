---
title: Overview of COP104 Flow
---
The <SwmToken path="src/kello/cop104-BACK.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> document outlines the main flow of the <SwmToken path="src/kello/cop104-BACK.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> program, which is a crucial part of the Kello Imagens system. It describes how the program initializes, processes user input, and coordinates various sections to handle data operations. The document provides a detailed breakdown of key functions such as <SwmToken path="src/kello/cop104-BACK.cbl" pos="1269:1:3" line-data="       PREV-CONTRATO SECTION.">`PREV-CONTRATO`</SwmToken>, <SwmToken path="src/kello/cop104-BACK.cbl" pos="1302:1:5" line-data="       MOVER-DADOS-WORK SECTION.">`MOVER-DADOS-WORK`</SwmToken>, <SwmToken path="src/kello/cop104-BACK.cbl" pos="654:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken>, <SwmToken path="src/kello/cop104-BACK.cbl" pos="785:5:7" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GRAVA-WORK`</SwmToken>, and <SwmToken path="src/kello/cop104-BACK.cbl" pos="996:7:11" line-data="               WHEN 1 PERFORM DATA-VENDA-PRODUCAO">`DATA-VENDA-PRODUCAO`</SwmToken>, explaining their roles and interactions within the flow.

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> program starts by initializing and setting up the necessary parameters. It then enters the main processing section, where it continuously performs tasks until a specific exit condition is met. During this process, it handles user input, prepares contract data, moves and processes work data, evaluates conditions, and performs data storage operations. Each function within the program has a specific role, such as preparing contract data, moving work data, or processing sales data, and they all work together to ensure the smooth operation of the program.

Here is a high level diagram of the flow, showing only the most important functions:

```mermaid
graph TD;
      subgraph src/kello/cop104-BACK.cbl
c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
end

subgraph src/kello/cop104-BACK.cbl
c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
end

subgraph src/kello/cop104-BACK.cbl
c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle
end

subgraph src/kello/cop104-BACK.cbl
085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle --> e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle
end

subgraph src/kello/cop104-BACK.cbl
e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
end

subgraph src/kello/cop104-BACK.cbl
e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> a0e9128f75b0b39c5b89a4c0c55538d31e092a301021f214b38d6d036dcd923b(DATA-VENDA-PRODUCAO):::mainFlowStyle
end


      classDef mainFlowStyle color:#000000,fill:#7CB9F4
classDef rootsStyle color:#000000,fill:#00FFF4
classDef Style1 color:#000000,fill:#00FFAA
classDef Style2 color:#000000,fill:#FFFF00
classDef Style3 color:#000000,fill:#AA7CB9

%% Swimm:
%% graph TD;
%%       subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle --> e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> a0e9128f75b0b39c5b89a4c0c55538d31e092a301021f214b38d6d036dcd923b(DATA-VENDA-PRODUCAO):::mainFlowStyle
%% end
%% 
%% 
%%       classDef mainFlowStyle color:#000000,fill:#7CB9F4
%% classDef rootsStyle color:#000000,fill:#00FFF4
%% classDef Style1 color:#000000,fill:#00FFAA
%% classDef Style2 color:#000000,fill:#FFFF00
%% classDef Style3 color:#000000,fill:#AA7CB9
```

# Flow drill down

First, we'll zoom into this section of the flow:

```mermaid
graph TD;
      subgraph src/kello/cop104-BACK.cbl
c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
end

subgraph src/kello/cop104-BACK.cbl
c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
end

subgraph src/kello/cop104-BACK.cbl
c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle
end

subgraph src/kello/cop104-BACK.cbl
085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle --> 2msq0(...)
end

subgraph src/kello/cop104-BACK.cbl
89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO) --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
end


      classDef mainFlowStyle color:#000000,fill:#7CB9F4
classDef rootsStyle color:#000000,fill:#00FFF4
classDef Style1 color:#000000,fill:#00FFAA
classDef Style2 color:#000000,fill:#FFFF00
classDef Style3 color:#000000,fill:#AA7CB9

%% Swimm:
%% graph TD;
%%       subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% c88f7fdde7b4d9fa429d6601ee0395027c01cf84eaba533b51f364066bab14f0(COP104):::mainFlowStyle --> 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle --> 2msq0(...)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO) --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
%% end
%% 
%% 
%%       classDef mainFlowStyle color:#000000,fill:#7CB9F4
%% classDef rootsStyle color:#000000,fill:#00FFF4
%% classDef Style1 color:#000000,fill:#00FFAA
%% classDef Style2 color:#000000,fill:#FFFF00
%% classDef Style3 color:#000000,fill:#AA7CB9
```

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="652">

---

## <SwmToken path="src/kello/cop104-BACK.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken>

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="3:6:6" line-data="       PROGRAM-ID. COP104.">`COP104`</SwmToken> function is the main driver of the flow. It initializes the program, handles user input, and coordinates various sections such as <SwmToken path="src/kello/cop104-BACK.cbl" pos="785:5:7" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GRAVA-WORK`</SwmToken> and <SwmToken path="src/kello/cop104-BACK.cbl" pos="996:7:11" line-data="               WHEN 1 PERFORM DATA-VENDA-PRODUCAO">`DATA-VENDA-PRODUCAO`</SwmToken>. It performs tasks like displaying messages, verifying status, and calling other sections to process data.

```cobol
       MAIN-PROCESS SECTION.
           PERFORM INICIALIZA-PROGRAMA.
           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.
           GO FINALIZAR-PROGRAMA.

       INICIALIZA-PROGRAMA SECTION.
           ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W.
           CALL "GRIDAT2" USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO
                                   TO DS-DATA-BLOCK-VERSION-NO
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CAD004"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CAD004.
           MOVE "CGD001"  TO ARQ-REC. MOVE EMPRESA-REF TO PATH-CGD001.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="1269">

---

## <SwmToken path="src/kello/cop104-BACK.cbl" pos="1269:1:3" line-data="       PREV-CONTRATO SECTION.">`PREV-CONTRATO`</SwmToken>

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="1269:1:3" line-data="       PREV-CONTRATO SECTION.">`PREV-CONTRATO`</SwmToken> function is responsible for preparing contract data. It moves date values into the correct format, starts reading records from the <SwmToken path="src/kello/cop104-BACK.cbl" pos="1282:3:3" line-data="           START COD040 KEY IS NOT &lt; ALT1-CO40 INVALID KEY">`COD040`</SwmToken> file, and processes each record to update contract information. If certain conditions are met, it calls the <SwmToken path="src/kello/cop104-BACK.cbl" pos="1302:1:5" line-data="       MOVER-DADOS-WORK SECTION.">`MOVER-DADOS-WORK`</SwmToken> function.

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

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="1302">

---

## <SwmToken path="src/kello/cop104-BACK.cbl" pos="1302:1:5" line-data="       MOVER-DADOS-WORK SECTION.">`MOVER-DADOS-WORK`</SwmToken>

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="1302:1:5" line-data="       MOVER-DADOS-WORK SECTION.">`MOVER-DADOS-WORK`</SwmToken> function initializes work records and processes contract data. It searches for status, reads city and region information, calculates various metrics, and updates work records. This function is crucial for moving and transforming data needed for further processing in the flow.

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
      subgraph src/kello/cop104-BACK.cbl
085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle --> e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle
end

subgraph src/kello/cop104-BACK.cbl
e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
end

subgraph src/kello/cop104-BACK.cbl
e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> a0e9128f75b0b39c5b89a4c0c55538d31e092a301021f214b38d6d036dcd923b(DATA-VENDA-PRODUCAO):::mainFlowStyle
end

subgraph src/kello/cop104-BACK.cbl
89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO) --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
end


      classDef mainFlowStyle color:#000000,fill:#7CB9F4
classDef rootsStyle color:#000000,fill:#00FFF4
classDef Style1 color:#000000,fill:#00FFAA
classDef Style2 color:#000000,fill:#FFFF00
classDef Style3 color:#000000,fill:#AA7CB9

%% Swimm:
%% graph TD;
%%       subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% 085d60ff671f83fa72f800913fe24699a58eb092cfea5db32db914d99252a0ec(CORPO-PROGRAMA):::mainFlowStyle --> e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO)
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% e903992ba80accf6431dd2d44a31f9ea149f70d9110ac494e10f7c3f46491957(GRAVA-WORK):::mainFlowStyle --> a0e9128f75b0b39c5b89a4c0c55538d31e092a301021f214b38d6d036dcd923b(DATA-VENDA-PRODUCAO):::mainFlowStyle
%% end
%% 
%% subgraph <SwmPath>[src/kello/cop104-BACK.cbl](src/kello/cop104-BACK.cbl)</SwmPath>
%% 89ab574114105be4a95ac70d0d6ce4fc602600d1a874547119a22972b7cc20c4(PREV-CONTRATO) --> 161215ffe1091324a9b2819e5b11991504aa5c85da13cc0f6cf41c6c66bb18c7(MOVER-DADOS-WORK)
%% end
%% 
%% 
%%       classDef mainFlowStyle color:#000000,fill:#7CB9F4
%% classDef rootsStyle color:#000000,fill:#00FFF4
%% classDef Style1 color:#000000,fill:#00FFAA
%% classDef Style2 color:#000000,fill:#FFFF00
%% classDef Style3 color:#000000,fill:#AA7CB9
```

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="775">

---

## <SwmToken path="src/kello/cop104-BACK.cbl" pos="775:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken>

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="775:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> function evaluates various conditions and performs corresponding actions. For example, if <SwmToken path="src/kello/cop104-BACK.cbl" pos="785:3:11" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GS-GRAVA-WORK-FLG-TRUE`</SwmToken> is true, it prompts the user with a message and, based on the response, calls the <SwmToken path="src/kello/cop104-BACK.cbl" pos="785:5:7" line-data="               WHEN GS-GRAVA-WORK-FLG-TRUE">`GRAVA-WORK`</SwmToken> function to handle data storage operations.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                    PERFORM CENTRALIZAR
                    PERFORM VERIFICAR-SENHA-STATUS
               WHEN GS-PRINTER-FLG-TRUE
                    COPY IMPRESSORA.CHAMA.
                    IF LNK-MAPEAMENTO <> SPACES
                       PERFORM IMPRIME-RELATORIO
                    END-IF
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
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="976">

---

## <SwmToken path="src/kello/cop104-BACK.cbl" pos="976:1:3" line-data="       GRAVA-WORK SECTION.">`GRAVA-WORK`</SwmToken>

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="976:1:3" line-data="       GRAVA-WORK SECTION.">`GRAVA-WORK`</SwmToken> function handles data storage operations. It checks the status of <SwmToken path="src/kello/cop104-BACK.cbl" pos="977:3:5" line-data="           IF ST-WORK NOT = &quot;35&quot;">`ST-WORK`</SwmToken>, performs file operations, and based on the value of <SwmToken path="src/kello/cop104-BACK.cbl" pos="991:4:8" line-data="              DISPLAY &quot;GS-OP-FILTRO = &quot; AT 0101">`GS-OP-FILTRO`</SwmToken>, it calls either <SwmToken path="src/kello/cop104-BACK.cbl" pos="996:7:11" line-data="               WHEN 1 PERFORM DATA-VENDA-PRODUCAO">`DATA-VENDA-PRODUCAO`</SwmToken> or <SwmToken path="src/kello/cop104-BACK.cbl" pos="1269:1:3" line-data="       PREV-CONTRATO SECTION.">`PREV-CONTRATO`</SwmToken> to process sales or contract data respectively.

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

           IF USUARIO-W = "ANDER"
              DISPLAY ERASE AT 0101
              DISPLAY "GS-OP-FILTRO = " AT 0101
              DISPLAY  GS-OP-FILTRO     AT 0125
           END-IF

           EVALUATE GS-OP-FILTRO
               WHEN 1 PERFORM DATA-VENDA-PRODUCAO
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="1004">

---

### <SwmToken path="src/kello/cop104-BACK.cbl" pos="1004:1:5" line-data="       DATA-VENDA-PRODUCAO SECTION.">`DATA-VENDA-PRODUCAO`</SwmToken>

The <SwmToken path="src/kello/cop104-BACK.cbl" pos="1004:1:5" line-data="       DATA-VENDA-PRODUCAO SECTION.">`DATA-VENDA-PRODUCAO`</SwmToken> function processes sales data. It initializes records, performs various data moves and calls, and evaluates conditions to execute specific procedures like <SwmToken path="src/kello/cop104-BACK.cbl" pos="1019:7:9" line-data="               WHEN 1 PERFORM POR-VENDA">`POR-VENDA`</SwmToken> or <SwmToken path="src/kello/cop104-BACK.cbl" pos="1020:7:9" line-data="               WHEN 2 PERFORM POR-PRODUCAO">`POR-PRODUCAO`</SwmToken>. It also handles file operations and computes various metrics related to sales.

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
