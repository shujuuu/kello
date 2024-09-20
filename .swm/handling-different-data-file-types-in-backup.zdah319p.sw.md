---
title: Handling different data file types in backup
---
This document will cover how the program handles different data file types during backup. We'll cover:

1. File Control Definitions
2. Object Storage Section
3. Backup Process Flow

<SwmSnippet path="/src/cop/cop104-BACK.cbl" line="17">

---

# File Control Definitions

The <SwmToken path="src/cop/cop104-BACK.cbl" pos="18:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> paragraph defines various file types that the program handles during backup. These include multiple <SwmToken path="src/cop/cop104-BACK.cbl" pos="19:1:1" line-data="           COPY CGPX001.">`COPY`</SwmToken> statements for different file types such as <SwmToken path="src/cop/cop104-BACK.cbl" pos="19:3:3" line-data="           COPY CGPX001.">`CGPX001`</SwmToken>, <SwmToken path="src/cop/cop104-BACK.cbl" pos="20:3:3" line-data="           COPY CAPX004.">`CAPX004`</SwmToken>, <SwmToken path="src/cop/cop104-BACK.cbl" pos="21:3:3" line-data="           COPY COPX001.">`COPX001`</SwmToken>, etc. The <SwmToken path="src/cop/cop104-BACK.cbl" pos="37:1:3" line-data="           SELECT WORK ASSIGN TO VARIA-W">`SELECT WORK`</SwmToken> statement assigns the file to <SwmToken path="src/cop/cop104-BACK.cbl" pos="37:9:11" line-data="           SELECT WORK ASSIGN TO VARIA-W">`VARIA-W`</SwmToken> with an indexed organization and dynamic access mode.

```cobol
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CGPX001.
           COPY CAPX004.
           COPY COPX001.
           COPY COPX002.
           COPY COPX005.
           COPY COPX040.
           COPY COPX050.
           COPY COPX051.
           COPY COPX104.
           COPY CAPX010.
           COPY CAPX012.
           COPY MTPX001.
           COPY MTPX020.
           COPY RCPX100.
           COPY RCPX101.
           COPY REPX100.
           COPY REPX101.

           SELECT WORK ASSIGN TO VARIA-W
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/cop104-BACK.cbl" line="17">

---

Similar to <SwmPath>[src/cop/cop104-BACK.cbl](src/cop/cop104-BACK.cbl)</SwmPath>, this file also contains the <SwmToken path="src/kello/cop104-BACK.cbl" pos="18:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> paragraph with the same <SwmToken path="src/kello/cop104-BACK.cbl" pos="19:1:1" line-data="           COPY CGPX001.">`COPY`</SwmToken> statements and <SwmToken path="src/kello/cop104-BACK.cbl" pos="37:1:3" line-data="           SELECT WORK ASSIGN TO VARIA-W">`SELECT WORK`</SwmToken> assignment. This redundancy ensures that the backup process can handle various data file types consistently across different modules.

```cobol
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CGPX001.
           COPY CAPX004.
           COPY COPX001.
           COPY COPX002.
           COPY COPX005.
           COPY COPX040.
           COPY COPX050.
           COPY COPX051.
           COPY COPX104.
           COPY CAPX010.
           COPY CAPX012.
           COPY MTPX001.
           COPY MTPX020.
           COPY RCPX100.
           COPY RCPX101.
           COPY REPX100.
           COPY REPX101.

           SELECT WORK ASSIGN TO VARIA-W
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/FileINI.cbl" line="13">

---

# Object Storage Section

The <SwmToken path="src/kello/FileINI.cbl" pos="13:1:3" line-data="       object-storage section.">`object-storage`</SwmToken> section in <SwmPath>[src/kello/FileINI.cbl](src/kello/FileINI.cbl)</SwmPath> defines storage for various object attributes such as <SwmToken path="src/kello/FileINI.cbl" pos="14:3:3" line-data="       77 osArquivo    pic x(255) value spaces.">`osArquivo`</SwmToken>, <SwmToken path="src/kello/FileINI.cbl" pos="15:3:3" line-data="       77 osSecao      pic x(255) value spaces.">`osSecao`</SwmToken>, <SwmToken path="src/kello/FileINI.cbl" pos="16:3:3" line-data="       77 osChave      pic x(255) value spaces.">`osChave`</SwmToken>, <SwmToken path="src/kello/FileINI.cbl" pos="17:3:3" line-data="       77 osTamanho    pic 9(09) comp-5 value zeros.">`osTamanho`</SwmToken>, and <SwmToken path="src/kello/FileINI.cbl" pos="18:3:3" line-data="       77 osConteudo   pic x(255) value spaces.">`osConteudo`</SwmToken>. These attributes are used to store metadata about the files being backed up.

```cobol
       object-storage section.
       77 osArquivo    pic x(255) value spaces.
       77 osSecao      pic x(255) value spaces.
       77 osChave      pic x(255) value spaces.
       77 osTamanho    pic 9(09) comp-5 value zeros.
       77 osConteudo   pic x(255) value spaces.

       01  DLL-WINAPI USAGE IS PROCEDURE-POINTER.

      *---------------------------------------------------------------
       method-id. "LerINI".
       local-storage section.
       77 lsRetorno pic 9(09) comp-5.
       linkage section.
       77 lnkArquivo pic x(255).
       77 lnkSecao pic x(255).
       77 lnkChave pic x(255).
       77 lnkConteudo pic x(255).
       procedure division using lnkArquivo lnkSecao
                                lnkChave returning lnkConteudo.

```

---

</SwmSnippet>

<SwmSnippet path="/src/FileINI.cbl" line="13">

---

The <SwmToken path="src/FileINI.cbl" pos="13:1:3" line-data="       object-storage section.">`object-storage`</SwmToken> section in <SwmPath>[src/FileINI.cbl](src/FileINI.cbl)</SwmPath> is identical to the one in <SwmPath>[src/kello/FileINI.cbl](src/kello/FileINI.cbl)</SwmPath>. This section ensures that the program can store and retrieve metadata for different data file types during the backup process.

```cobol
       object-storage section.
       77 osArquivo    pic x(255) value spaces.
       77 osSecao      pic x(255) value spaces.
       77 osChave      pic x(255) value spaces.
       77 osTamanho    pic 9(09) comp-5 value zeros.
       77 osConteudo   pic x(255) value spaces.

       01  DLL-WINAPI USAGE IS PROCEDURE-POINTER.

      *---------------------------------------------------------------
       method-id. "LerINI".
       local-storage section.
       77 lsRetorno pic 9(09) comp-5.
       linkage section.
       77 lnkArquivo pic x(255).
       77 lnkSecao pic x(255).
       77 lnkChave pic x(255).
       77 lnkConteudo pic x(255).
       procedure division using lnkArquivo lnkSecao
                                lnkChave returning lnkConteudo.

```

---

</SwmSnippet>

# Backup Process Flow

The backup process begins by reading the file control definitions to identify the types of files that need to be backed up. The program then uses the object storage section to store metadata about these files. During the backup, the program dynamically accesses each file type, retrieves its content, and stores it in the designated backup location. This ensures that all file types are backed up consistently and efficiently.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
