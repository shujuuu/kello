---
title: What the .GS scripts do in the system
---
This document will cover the role of the .GS scripts in the overall system functionality. We'll cover:

1. What are .GS scripts
2. How .GS scripts are used in the system
3. Examples of .GS scripts in action

# What are .GS scripts

.GS scripts in the Kello Imagens system are used to define specific flags and control variables that guide the execution flow of COBOL programs. These scripts typically contain definitions for various flags and control variables that are used to manage program logic and flow.

# How .GS scripts are used in the system

.GS scripts are integrated into the COBOL programs to manage the execution flow based on certain conditions. They define flags and control variables that are checked and manipulated throughout the program to determine the next steps in the process. For example, a flag defined in a .GS script might indicate whether a particular subroutine should be called or whether certain data should be processed.

<SwmSnippet path="/src/kello/mtp029a.cbl" line="89">

---

# How .GS scripts are used in the system

In the <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="82:7:7" line-data="             05 GS-CHAMAR-MTP029             PIC 9.">`MTP029`</SwmToken> function, the .GS script defines flags such as <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="81:3:9" line-data="                88 GS-CONFERE-TOTAL-TRUE     VALUE 1.">`GS-CONFERE-TOTAL-TRUE`</SwmToken> and <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="82:3:7" line-data="             05 GS-CHAMAR-MTP029             PIC 9.">`GS-CHAMAR-MTP029`</SwmToken>. These flags are used to control the flow of the program, determining whether certain sections of code should be executed.

```cobol
           05  ERRO-W                PIC 9        VALUE ZEROS.
      *    ERRO-W - flag que controla se houve erro de abertura arquivo
           05  HORA-W                PIC 9(8)     VALUE ZEROS.
           05  PAG-W                 PIC 9(2)     VALUE ZEROS.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpy/mtp023a.cpb" line="81">

---

Similarly, in the <SwmPath>[src/kello/cpy/mtp023a.cpb](src/kello/cpy/mtp023a.cpb)</SwmPath> file, the .GS script defines flags like <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="81:3:9" line-data="                88 GS-CONFERE-TOTAL-TRUE     VALUE 1.">`GS-CONFERE-TOTAL-TRUE`</SwmToken> and <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="82:3:7" line-data="             05 GS-CHAMAR-MTP029             PIC 9.">`GS-CHAMAR-MTP029`</SwmToken>, which are used to manage the program's execution flow.

```cpb
                88 GS-CONFERE-TOTAL-TRUE     VALUE 1.
             05 GS-CHAMAR-MTP029             PIC 9.
                88 GS-CHAMAR-MTP029-TRUE     VALUE 1.
             05 GS-VERIFICAR-CONTRATO        PIC 9.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cpy/mtp022.cpb" line="54">

---

In the <SwmPath>[src/kello/cpy/mtp022.cpb](src/kello/cpy/mtp022.cpb)</SwmPath> file, the .GS script defines the <SwmToken path="src/kello/cpy/mtp022.cpb" pos="54:3:7" line-data="             05 GS-CHAMA-MTP029              PIC 9.">`GS-CHAMA-MTP029`</SwmToken> flag, which is used to determine whether the <SwmToken path="src/kello/cpy/mtp022.cpb" pos="54:7:7" line-data="             05 GS-CHAMA-MTP029              PIC 9.">`MTP029`</SwmToken> function should be called.

```cpb
             05 GS-CHAMA-MTP029              PIC 9.
                88 GS-CHAMA-MTP029-TRUE      VALUE 1.
```

---

</SwmSnippet>

# Examples of .GS scripts in action

Here are some examples of how .GS scripts are used in the Kello Imagens system to control program flow and logic.

<SwmSnippet path="/src/kello/mtp029a.cbl" line="207">

---

# Examples of .GS scripts in action

In the <SwmToken path="src/kello/mtp029a.cbl" pos="202:3:5" line-data="           PERFORM INICIALIZA-PROGRAMA.">`INICIALIZA-PROGRAMA`</SwmToken> section of the <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="82:7:7" line-data="             05 GS-CHAMAR-MTP029             PIC 9.">`MTP029`</SwmToken> function, various paths and files are initialized based on the values defined in the .GS script.

```cobol
      *    ACCEPT PARAMETROS-W FROM COMMAND-LINE.
           COPY "CBDATA1.CPY".
           MOVE DATA-INV TO DATA-MOVTO-W DATA-MOVTO-REL.
           CALL "GRIDAT2"  USING DATA-INV.
           MOVE DATA-INV       TO DATA-DIA-I.
           MOVE ZEROS TO PAG-W ERRO-W.
           INITIALIZE GS-DATA-BLOCK
           INITIALIZE DS-CONTROL-BLOCK
           MOVE GS-DATA-BLOCK-VERSION-NO TO DS-DATA-BLOCK-VERSION-NO.
           MOVE GS-VERSION-NO  TO DS-VERSION-NO
           MOVE EMPRESA-W          TO EMP-REC
           MOVE NOME-EMPRESA-W     TO EMPRESA-REL
           MOVE "CAD004"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CAD004.
           MOVE "CAD010"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CAD010.
           MOVE "COD040"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-COD040.
           MOVE "PAR001"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-PAR001.
           MOVE "MTD019"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-MTD019.
           MOVE "MTD019F" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-MTD019F.
           MOVE "MTD020"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-MTD020.
           MOVE "MTD025"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-MTD025.
           MOVE "CGD010"  TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/mtp029a.cbl" line="358">

---

In the <SwmToken path="src/kello/mtp029a.cbl" pos="203:3:5" line-data="           PERFORM CORPO-PROGRAMA UNTIL GS-EXIT-FLG-TRUE.">`CORPO-PROGRAMA`</SwmToken> section of the <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="82:7:7" line-data="             05 GS-CHAMAR-MTP029             PIC 9.">`MTP029`</SwmToken> function, the program flow is controlled by evaluating the flags defined in the .GS script, such as <SwmToken path="src/kello/mtp029a.cbl" pos="359:3:7" line-data="               WHEN GS-CENTRALIZA-TRUE">`GS-CENTRALIZA-TRUE`</SwmToken> and <SwmToken path="src/kello/mtp029a.cbl" pos="361:3:9" line-data="               WHEN GS-SAVE-FLG-TRUE">`GS-SAVE-FLG-TRUE`</SwmToken>.

```cobol
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   PERFORM SALVAR-DADOS
                   PERFORM SALVAR-CGD010
                   PERFORM SALVAR-CGD011
                   MOVE GS-CONT TO AUX-CONT
                   PERFORM GRAVAR-MOTIVOS
                   MOVE AUX-CONT TO GS-CONT
                   IF GS-ACP-IMAGEM(1:10) <> SPACES
                      PERFORM COPIAR-IMAGEM
                   END-IF
                   IF GS-TIPO-GRAVACAO = 1
                      MOVE 0 TO GS-INCLUSAO
                      PERFORM REGRAVA-DADOS
                   ELSE
                      MOVE 1 TO GS-INCLUSAO
                      PERFORM GRAVA-DADOS
                   END-IF
                   PERFORM LIMPAR-DADOS
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/mtp029a.cbl" line="1189">

---

In the <SwmToken path="src/kello/mtp029a.cbl" pos="277:3:7" line-data="              PERFORM CARREGA-MENSAGEM-ERRO.">`CARREGA-MENSAGEM-ERRO`</SwmToken> section of the <SwmToken path="src/kello/cpy/mtp023a.cpb" pos="82:7:7" line-data="             05 GS-CHAMAR-MTP029             PIC 9.">`MTP029`</SwmToken> function, error messages are loaded and displayed based on the flags defined in the .GS script.

```cobol
           PERFORM LOAD-SCREENSET
           MOVE "EXIBE-ERRO" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
           MOVE 1 TO ERRO-W.
       LIMPAR-DADOS SECTION.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
