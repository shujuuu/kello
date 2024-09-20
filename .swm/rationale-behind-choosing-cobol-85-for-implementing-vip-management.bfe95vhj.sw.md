---
title: Rationale Behind Choosing COBOL-85 for Implementing VIP Management
---
This document will cover the rationale behind choosing COBOL-85 for the implementation of VIP Management. We'll cover:

1. Historical Context and Legacy Systems
2. COBOL-85 Features and Suitability
3. Code Examples from the VIP Management System

# Historical Context and Legacy Systems

COBOL-85 was chosen for the implementation of VIP Management due to its historical significance and widespread use in business operations management systems. Many legacy systems, especially in the financial and administrative sectors, were built using COBOL. This made COBOL-85 a natural choice for maintaining compatibility and leveraging existing infrastructure.

# COBOL-85 Features and Suitability

COBOL-85 offers several features that make it suitable for business operations management systems like VIP Management. These include:

- **Strong Data Processing Capabilities**: COBOL is designed for business data processing, making it ideal for handling large volumes of transactions and records.
- **Readability and Maintainability**: COBOL's syntax is close to natural language, which makes the code easier to read and maintain.
- **Stability and Reliability**: COBOL has been used for decades in critical systems, proving its reliability and stability.

<SwmSnippet path="/src/vip/vip100.cbl" line="175">

---

# Code Examples from the VIP Management System

The <SwmToken path="src/vip/vip100.cbl" pos="175:1:3" line-data="       CORPO-PROGRAMA SECTION.">`CORPO-PROGRAMA`</SwmToken> section in <SwmPath>[src/vip/vip100.cbl](src/vip/vip100.cbl)</SwmPath> demonstrates the use of COBOL-85 in the VIP Management system. This section handles various operations such as saving data, clearing data, and printing reports. The use of <SwmToken path="src/vip/vip100.cbl" pos="178:1:1" line-data="                   PERFORM CENTRALIZAR">`PERFORM`</SwmToken> statements and <SwmToken path="src/vip/vip100.cbl" pos="176:1:1" line-data="           EVALUATE TRUE">`EVALUATE`</SwmToken> constructs showcases COBOL-85's structured programming capabilities.

```cobol
       CORPO-PROGRAMA SECTION.
           EVALUATE TRUE
               WHEN GS-CENTRALIZA-TRUE
                   PERFORM CENTRALIZAR
               WHEN GS-SAVE-FLG-TRUE
                   PERFORM SALVAR-DADOS
                   IF GS-TIPO-GRAVACAO = 1
                      PERFORM REGRAVA-DADOS
                   ELSE
                      PERFORM GRAVA-DADOS
                   END-IF
                   PERFORM LIMPAR-DADOS
                   PERFORM CARREGA-ULTIMOS
               WHEN GS-EXCLUI-FLG-TRUE
                   PERFORM EXCLUI
                   PERFORM LIMPAR-DADOS
                   PERFORM CARREGA-ULTIMOS
               WHEN GS-CLR-FLG-TRUE
                   PERFORM LIMPAR-DADOS
                   PERFORM CARREGA-ULTIMOS
               WHEN GS-PRINTER-FLG-TRUE
```

---

</SwmSnippet>

<SwmSnippet path="/src/vip/vip100.cbl" line="403">

---

The <SwmToken path="src/vip/vip100.cbl" pos="403:1:3" line-data="       SALVAR-DADOS SECTION.">`SALVAR-DADOS`</SwmToken> section in <SwmPath>[src/vip/vip100.cbl](src/vip/vip100.cbl)</SwmPath> is responsible for saving data. This section illustrates COBOL-85's ability to handle data manipulation and storage operations efficiently.

```cobol
       SALVAR-DADOS SECTION.
           IF GS-TIPO-GRAVACAO = 0
              PERFORM VERIFICA-ULT-NR-FITA
           END-IF
           MOVE DATA-MOVTO-I          TO DATA-MOVTO-V100
           MOVE GS-SEQ                TO SEQ-V100
           MOVE GS-CONTRATO           TO CONTRATO-V100
           MOVE GS-EVENTO             TO EVENTO-V100
           MOVE GS-NOME-CURSO         TO CURSO-V100
           MOVE GS-CINEGRAFISTA       TO CINEGRAFISTA-V100
           MOVE GS-FILMADORA          TO FILMADORA-V100.
           MOVE GS-LOCALIZACAO        TO LOCALIZACAO-V100
           MOVE GS-DATA-EVENTO        TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV              TO DATA-EVENTO-V100
           MOVE GS-NR-FITA            TO NR-FITA-V100
           MOVE GS-QTDE-ARQ           TO QTDE-ARQUIVOS-V100
           MOVE USUARIO-W             TO DIGITADOR-V100
           MOVE GS-IDENTIFICADOR      TO IDENTIFICADOR-V100.
```

---

</SwmSnippet>

<SwmSnippet path="/src/vip/vip100.cbl" line="443">

---

The <SwmToken path="src/vip/vip100.cbl" pos="443:1:3" line-data="       REGRAVA-DADOS SECTION.">`REGRAVA-DADOS`</SwmToken> section in <SwmPath>[src/vip/vip100.cbl](src/vip/vip100.cbl)</SwmPath> shows how COBOL-85 can be used to rewrite records in a file. This is crucial for maintaining data integrity in the VIP Management system.

```cobol
       REGRAVA-DADOS SECTION.
           CLOSE    VID100
           OPEN I-O VID100
           REWRITE REG-VID100 INVALID KEY
                 MOVE "Erro Regravacao VID100" TO GS-MENSAGEM-ERRO
                 MOVE ST-VID100 TO GS-MENSAGEM-ERRO(24: 5)
                 MOVE "ERRO-GRAVACAO" TO DS-PROCEDURE
                 PERFORM CALL-DIALOG-SYSTEM
           END-REWRITE
           CLOSE      VID100
           OPEN INPUT VID100
           PERFORM MOVER-DADOS-LISTA.
           MOVE "ATUALIZA-LISTA" TO DS-PROCEDURE
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

<SwmSnippet path="/src/vip/vip100.cbl" line="422">

---

The <SwmToken path="src/vip/vip100.cbl" pos="422:1:3" line-data="       GRAVA-DADOS SECTION.">`GRAVA-DADOS`</SwmToken> section in <SwmPath>[src/vip/vip100.cbl](src/vip/vip100.cbl)</SwmPath> demonstrates the process of writing new records to a file. This section highlights COBOL-85's robust file handling capabilities.

```cobol
       GRAVA-DADOS SECTION.
           CLOSE      VID100
           OPEN I-O   VID100
           MOVE ZEROS TO ST-VID100.
           PERFORM UNTIL ST-VID100 = "10"
                WRITE REG-VID100 INVALID KEY
                    ADD 1 TO SEQ-V100
                NOT INVALID KEY
                    MOVE "10" TO ST-VID100
                END-WRITE
           END-PERFORM
           CLOSE      VID100
           OPEN INPUT VID100
           PERFORM MOVER-DADOS-LISTA.
           PERFORM VERIFICA-ULT-NR-FITA *> TEM QUE VERIFICAR POIS
      *      NEM SEMPRE SERÁ ACRESCENTADO 1 AUTOMÁTICO P/ NR-FITA
      *      POIS PODE HAVER MAIS DE 1 CONTRATO P/ O MESMO NR-FITA

      *    ADD 1 TO ULT-SEQ ULT-NR-FITA.
           MOVE "INSERE-LIST" TO DS-PROCEDURE.
           PERFORM CALL-DIALOG-SYSTEM.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
