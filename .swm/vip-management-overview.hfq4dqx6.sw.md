---
title: VIP Management Overview
---
VIP Management refers to the handling and processing of various video-related tasks within the Kello Imagens system.

It includes functionalities such as receiving raw tapes, planning and reporting video edits, and listing existing tapes within a specified interval.

Programs like VIP100 and <SwmToken path="src/vip/vip105.cbl" pos="3:6:6" line-data="       PROGRAM-ID. VIP105.">`VIP105`</SwmToken> are responsible for receiving raw tapes and planning video edits, respectively.

<SwmToken path="src/vip/vip301A.CBL" pos="3:6:6" line-data="       PROGRAM-ID. VIP301A.">`VIP301A`</SwmToken> and VIP300 are used for listing all existing tapes within a requested interval.

VIP132 handles the insertion of video copies, while VIP130 manages the dispatch of raw tapes from the quality sector to the video production sector.

VIP131 is used for maintaining the 'location of tapes' field and printing protocols.

<SwmToken path="src/vip/vip118.cbl" pos="3:6:6" line-data="       PROGRAM-ID. VIP118.">`VIP118`</SwmToken> is responsible for registering observations for the sales and general quality departments.

VIP101 deals with the receipt of cinematographers' evaluations.

<SwmSnippet path="/src/vip/vip301A.CBL" line="2">

---

# <SwmToken path="src/vip/vip301A.CBL" pos="3:6:6" line-data="       PROGRAM-ID. VIP301A.">`VIP301A`</SwmToken> Program

The program <SwmToken path="src/vip/vip301A.CBL" pos="3:6:6" line-data="       PROGRAM-ID. VIP301A.">`VIP301A`</SwmToken> is used to list all existing tapes within a specified interval. This is part of the VIP Management functionality to keep track of video assets.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VIP301A.
      *DATA: 06/09/2003
      *AUTORA: MARELI AMÂNCIO VOLPATO
      *PROGRAMA: RELAÇÃO DE FITAS DE VÍDEO
      *FUNÇÃO: Listar todos as FITAS EXISTENTES NO INTERVALO SOLICITADO
```

---

</SwmSnippet>

<SwmSnippet path="/src/vip/vip105.cbl" line="2">

---

# <SwmToken path="src/vip/vip105.cbl" pos="3:6:6" line-data="       PROGRAM-ID. VIP105.">`VIP105`</SwmToken> Program

The program <SwmToken path="src/vip/vip105.cbl" pos="3:6:6" line-data="       PROGRAM-ID. VIP105.">`VIP105`</SwmToken> is used for planning and reporting video edits. This helps in organizing and managing the editing process of video assets.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VIP105.
       AUTHOR. MARELI AMANCIO VOLPATO.
       DATE-WRITTEN. 03/08/2000.
      *FUNÇÃO: Movimento de PLANEJAMENTO E RELATORIO DE VIDEO DE EDIÇÃO
```

---

</SwmSnippet>

<SwmSnippet path="/src/vip/vip118.cbl" line="69">

---

# <SwmToken path="src/vip/vip118.cbl" pos="69:3:5" line-data="           05  EMP-REFERENCIA.">`EMP-REFERENCIA`</SwmToken> Variable

The variable <SwmToken path="src/vip/vip118.cbl" pos="69:3:5" line-data="           05  EMP-REFERENCIA.">`EMP-REFERENCIA`</SwmToken> is used in multiple programs to reference the Kello program directory. This ensures consistency across different VIP Management tasks.

```cobol
           05  EMP-REFERENCIA.
               10  FILLER            PIC X(15)
                   VALUE "\PROGRAMA\KELLO".
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
