---
title: Configuration Management Practices in Kello Imagens
---
This document will cover the configuration management practices used in the Kello Imagens system, which includes:

1. Configuration files and directories
2. Configuration sections in COBOL files.

# Configuration Files and Directories

The configuration management in Kello Imagens involves several files and directories located in the <SwmPath>[data/config/](data/config/)</SwmPath> directory. This directory contains subdirectories and files that are used to manage different aspects of the system's configuration.

# Configuration Files and Directories

The <SwmPath>[data/config/](data/config/)</SwmPath> directory includes the following contents:

- <SwmPath>[data/config/RDP/](data/config/RDP/)</SwmPath>
- <SwmPath>[data/config/Contacts/](data/config/Contacts/)</SwmPath>
- <SwmPath>[data/config/ip.txt](data/config/ip.txt)</SwmPath>
- <SwmPath>[data/config/impressora.chama](data/config/impressora.chama)</SwmPath>

# Configuration Sections in COBOL Files

The COBOL files in the Kello Imagens system contain CONFIGURATION sections that define various configuration settings. These sections are found in multiple files and manage different aspects of the system's configuration.

<SwmSnippet path="/src/kello/GRWIND.CBL" line="8">

---

# Configuration Sections in COBOL Files

The CONFIGURATION section in <SwmPath>[src/kello/GRWIND.CBL](src/kello/GRWIND.CBL)</SwmPath> defines the environment division, special names, <SwmToken path="src/kello/GRWIND.CBL" pos="13:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> section, and file control for the WINDOW file.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT WINDOW ASSIGN TO DISK
                  ORGANIZATION  IS RELATIVE
                  RELATIVE KEY  IS RK-WINDOW
                  ACCESS MODE   IS RANDOM
                  FILE STATUS   IS FS-WINDOW.

       DATA DIVISION.
       FILE SECTION.

       FD  WINDOW
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS LB-WINDOW.

```

---

</SwmSnippet>

<SwmSnippet path="/src/gr/GRWIND.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/gr/GRWIND.CBL](src/gr/GRWIND.CBL)</SwmPath> is similar to the one in <SwmPath>[src/kello/GRWIND.CBL](src/kello/GRWIND.CBL)</SwmPath>, defining the environment division, special names, <SwmToken path="src/gr/GRWIND.CBL" pos="13:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> section, and file control for the WINDOW file.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT WINDOW ASSIGN TO DISK
                  ORGANIZATION  IS RELATIVE
                  RELATIVE KEY  IS RK-WINDOW
                  ACCESS MODE   IS RANDOM
                  FILE STATUS   IS FS-WINDOW.

       DATA DIVISION.
       FILE SECTION.

       FD  WINDOW
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS LB-WINDOW.

```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/GRDCIC.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/kello/GRDCIC.CBL](src/kello/GRDCIC.CBL)</SwmPath> defines the environment division and data division, including <SwmToken path="src/kello/GRDCIC.CBL" pos="14:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> and linkage sections.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  AREAS-DE-TRABALHO-1.
           05 LIXO                     PIC  9(006) VALUE ZERO.
           05 DV                       PIC  9(006) VALUE ZERO.
           05 RESTO                    PIC  9(002) VALUE ZERO.

       LINKAGE SECTION.

       01  PARAMETROS-GRDCIC.
           05 CIC                         PIC  9(011).
              88 CIC-INVALIDO             VALUE 11111111111
                                                22222222222
                                                33333333333
                                                44444444444
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/GRDCGC.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/kello/GRDCGC.CBL](src/kello/GRDCGC.CBL)</SwmPath> defines the environment division and data division, including <SwmToken path="src/kello/GRDCGC.CBL" pos="14:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> and linkage sections.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  AREAS-DE-TRABALHO-1.
           05 SALVA-CGC                PIC  9(014) VALUE ZERO.
           05 TESTE-77                 PIC  9(001) VALUE ZERO.
           05 LIXO                     PIC  9(006) VALUE ZERO.
           05 DV                       PIC  9(006) VALUE ZERO.
           05 RESTO                    PIC  9(002) VALUE ZERO.
           05 FILLER REDEFINES RESTO.
              10 R-1                   PIC  9(001).
              10 R-2                   PIC  9(001).

       LINKAGE SECTION.

       01  PARAMETROS-GRDCGC.
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/GRFILE.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/kello/GRFILE.CBL](src/kello/GRFILE.CBL)</SwmPath> defines the environment division, special names, <SwmToken path="src/kello/GRFILE.CBL" pos="13:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> section, and file control for the CONFIG file.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CONFIG ASSIGN TO DISK
                  ORGANIZATION  IS INDEXED
                  ACCESS MODE   IS DYNAMIC
                  RECORD  KEY   IS CONFIG-CHAVE
                  FILE STATUS   IS FS-CONFIG.

       DATA DIVISION.
       FILE SECTION.

       COPY CPCONF.

       WORKING-STORAGE SECTION.

```

---

</SwmSnippet>

<SwmSnippet path="/src/gr/GRDCGC.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/gr/GRDCGC.CBL](src/gr/GRDCGC.CBL)</SwmPath> defines the environment division and data division, including <SwmToken path="src/gr/GRDCGC.CBL" pos="14:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> and linkage sections.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  AREAS-DE-TRABALHO-1.
           05 SALVA-CGC                PIC  9(014) VALUE ZERO.
           05 TESTE-77                 PIC  9(001) VALUE ZERO.
           05 LIXO                     PIC  9(006) VALUE ZERO.
           05 DV                       PIC  9(006) VALUE ZERO.
           05 RESTO                    PIC  9(002) VALUE ZERO.
           05 FILLER REDEFINES RESTO.
              10 R-1                   PIC  9(001).
              10 R-2                   PIC  9(001).

       LINKAGE SECTION.

       01  PARAMETROS-GRDCGC.
```

---

</SwmSnippet>

<SwmSnippet path="/src/gr/GRDCIC.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/gr/GRDCIC.CBL](src/gr/GRDCIC.CBL)</SwmPath> defines the environment division and data division, including <SwmToken path="src/gr/GRDCIC.CBL" pos="14:1:3" line-data="       WORKING-STORAGE SECTION.">`WORKING-STORAGE`</SwmToken> and linkage sections.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  AREAS-DE-TRABALHO-1.
           05 LIXO                     PIC  9(006) VALUE ZERO.
           05 DV                       PIC  9(006) VALUE ZERO.
           05 RESTO                    PIC  9(002) VALUE ZERO.

       LINKAGE SECTION.

       01  PARAMETROS-GRDCIC.
           05 CIC                         PIC  9(011).
              88 CIC-INVALIDO             VALUE 11111111111
                                                22222222222
                                                33333333333
                                                44444444444
```

---

</SwmSnippet>

<SwmSnippet path="/src/gr/GRFILE.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/gr/GRFILE.CBL](src/gr/GRFILE.CBL)</SwmPath> defines the environment division, special names, <SwmToken path="src/gr/GRFILE.CBL" pos="13:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> section, and file control for the CONFIG file.

```cobol
                      *                                               *
                      *************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT CONFIG ASSIGN TO DISK
                  ORGANIZATION  IS INDEXED
                  ACCESS MODE   IS DYNAMIC
                  RECORD  KEY   IS CONFIG-CHAVE
                  FILE STATUS   IS FS-CONFIG.

       DATA DIVISION.
       FILE SECTION.

       COPY CPCONF.

       WORKING-STORAGE SECTION.

```

---

</SwmSnippet>

<SwmSnippet path="/src/gr/GRISAM.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/gr/GRISAM.CBL](src/gr/GRISAM.CBL)</SwmPath> defines the environment division, special names, <SwmToken path="src/gr/GRISAM.CBL" pos="13:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> section, and file control for the USELOG file.

```cobol
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

       FD  USELOG
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS LB-USELOG.

       01  USELOG-REG.
           05 USELOG-DATA-DE-HOJE       PIC  X(009).
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/GRISAM.CBL" line="8">

---

The CONFIGURATION section in <SwmPath>[src/kello/GRISAM.CBL](src/kello/GRISAM.CBL)</SwmPath> defines the environment division, special names, <SwmToken path="src/kello/GRISAM.CBL" pos="13:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> section, and file control for the USELOG file.

```cobol
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

       FD  USELOG
           LABEL RECORD IS STANDARD
           VALUE OF FILE-ID IS LB-USELOG.

       01  USELOG-REG.
           05 USELOG-DATA-DE-HOJE       PIC  X(009).
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
