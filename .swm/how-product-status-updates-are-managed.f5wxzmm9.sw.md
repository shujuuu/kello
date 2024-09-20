---
title: How product status updates are managed
---
This document will cover how status updates for products are managed in the Kello Imagens system. We'll cover:

1. The role of the <SwmToken path="src/kello/GRISAM.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRISAM.">`GRISAM`</SwmToken> program
2. The <SwmToken path="src/kello/GRISAM.CBL" pos="16:3:3" line-data="           SELECT USELOG ASSIGN TO DISK">`USELOG`</SwmToken> file and its structure
3. How status updates are logged and managed.

<SwmSnippet path="/src/kello/GRISAM.CBL" line="1">

---

# The role of the GRISAM program

The <SwmToken path="src/kello/GRISAM.CBL" pos="2:6:6" line-data="       PROGRAM-ID.    GRISAM.">`GRISAM`</SwmToken> program is responsible for handling file status updates. It is identified by the <SwmToken path="src/kello/GRISAM.CBL" pos="2:1:3" line-data="       PROGRAM-ID.    GRISAM.">`PROGRAM-ID`</SwmToken> and authored by <SwmToken path="src/kello/GRISAM.CBL" pos="3:4:4" line-data="       AUTHOR.        COBOLware Services Ltda.">`COBOLware`</SwmToken> Services Ltda. The program assigns the <SwmToken path="src/kello/GRISAM.CBL" pos="16:3:3" line-data="           SELECT USELOG ASSIGN TO DISK">`USELOG`</SwmToken> file to disk and specifies its organization as line sequential with a file status of <SwmToken path="src/kello/GRISAM.CBL" pos="18:7:9" line-data="                  FILE STATUS   IS FS-USELOG.">`FS-USELOG`</SwmToken>.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    GRISAM.
       AUTHOR.        COBOLware Services Ltda.
       DATE-WRITTEN.  05/06/88.
       SECURITY.      *************************************************
                      *                                               *
                      *   Tratamento de file status                   *
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT USELOG ASSIGN TO DISK
                  ORGANIZATION  IS LINE SEQUENTIAL
                  FILE STATUS   IS FS-USELOG.

       DATA DIVISION.
       FILE SECTION.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/GRISAM.CBL" line="16">

---

# The USELOG file and its structure

The <SwmToken path="src/kello/GRISAM.CBL" pos="16:3:3" line-data="           SELECT USELOG ASSIGN TO DISK">`USELOG`</SwmToken> file is defined in the <SwmToken path="src/kello/GRISAM.CBL" pos="21:1:3" line-data="       FILE SECTION.">`FILE SECTION`</SwmToken> of the <SwmToken path="src/kello/GRISAM.CBL" pos="20:1:3" line-data="       DATA DIVISION.">`DATA DIVISION`</SwmToken>. It is labeled as a standard record with the file ID <SwmToken path="src/kello/GRISAM.CBL" pos="25:11:13" line-data="           VALUE OF FILE-ID IS LB-USELOG.">`LB-USELOG`</SwmToken>. This file is used to log status updates.

```cobol
           SELECT USELOG ASSIGN TO DISK
                  ORGANIZATION  IS LINE SEQUENTIAL
                  FILE STATUS   IS FS-USELOG.

       DATA DIVISION.
       FILE SECTION.

       FD  USELOG
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS LB-USELOG.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/GRISAM.CBL" line="292">

---

# How status updates are logged and managed

Status updates are logged by moving the file status (<SwmToken path="src/kello/GRISAM.CBL" pos="292:3:5" line-data="                    MOVE  FS-ARQUIVO    TO USELOG-FS">`FS-ARQUIVO`</SwmToken>) to <SwmToken path="src/kello/GRISAM.CBL" pos="292:9:11" line-data="                    MOVE  FS-ARQUIVO    TO USELOG-FS">`USELOG-FS`</SwmToken>, the program name (<SwmToken path="src/kello/GRISAM.CBL" pos="293:4:4" line-data="                    MOVE &quot;GRISAM&quot;       TO USELOG-PROGRAMA">`GRISAM`</SwmToken>) to <SwmToken path="src/kello/GRISAM.CBL" pos="293:9:11" line-data="                    MOVE &quot;GRISAM&quot;       TO USELOG-PROGRAMA">`USELOG-PROGRAMA`</SwmToken>, and the message (<SwmToken path="src/kello/GRISAM.CBL" pos="294:3:3" line-data="                    MOVE  MENSAGEM      TO USELOG-MENSAGEM">`MENSAGEM`</SwmToken>) to <SwmToken path="src/kello/GRISAM.CBL" pos="294:7:9" line-data="                    MOVE  MENSAGEM      TO USELOG-MENSAGEM">`USELOG-MENSAGEM`</SwmToken>. This ensures that all relevant information about the status update is recorded in the <SwmToken path="src/kello/GRISAM.CBL" pos="292:9:9" line-data="                    MOVE  FS-ARQUIVO    TO USELOG-FS">`USELOG`</SwmToken> file.

```cobol
                    MOVE  FS-ARQUIVO    TO USELOG-FS
                    MOVE "GRISAM"       TO USELOG-PROGRAMA
                    MOVE  MENSAGEM      TO USELOG-MENSAGEM
                    MOVE "?"            TO GRMENU
                    CALL "GRFINA" USING OPERADOR USELOG-TASK
                                        PROGRAMA GRMENU
                    WRITE USELOG-REG
                    CLOSE USELOG
              END-IF
           ELSE
               DISPLAY (23, 3) MENSAGEM WITH SIZE I
               PERFORM 110-ESPERA-5 THRU 110-99-FIM
               DISPLAY (23, 3) SPACES WITH SIZE 70
           END-IF.

       010-99-FIM. EXIT.

       110-ESPERA-5.

           ACCEPT TEMPO FROM TIME
           MOVE   0       TO SEGUNDOS
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
