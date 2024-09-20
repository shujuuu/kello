---
title: Function of galho Files
---
This document will cover the role of the `galho` files in the Kello Imagens system. We'll cover:

1. Purpose of `galho` files
2. Structure and organization
3. Examples of `galho` files in use.

# Purpose of `galho` files

The `galho` files in the Kello Imagens system are COBOL source files that handle various business operations and processes. These files are integral to the system's functionality, managing tasks such as report generation, data processing, and transaction handling.

# Structure and organization

The `galho` files are organized within the <SwmPath>[src/galho/](src/galho/)</SwmPath> directory. Each file typically contains COBOL code that defines specific operations or processes. The naming convention of these files often includes a prefix 'galho' followed by a descriptive identifier, which helps in identifying the purpose or functionality of the file.

<SwmSnippet path="/src/galho/galho17.CBL" line="10">

---

# Structure and organization

The <SwmPath>[src/galho/galho17.CBL](src/galho/galho17.CBL)</SwmPath> file includes a <SwmToken path="src/galho/galho17.CBL" pos="13:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> paragraph that defines the file handling and access modes for the <SwmToken path="src/galho/galho17.CBL" pos="17:3:3" line-data="           SELECT MTD999 ASSIGN TO PATH-MTD999">`MTD999`</SwmToken> and <SwmToken path="src/galho/galho17.CBL" pos="28:3:3" line-data="           SELECT MTD300 ASSIGN TO PATH-MTD300">`MTD300`</SwmToken> files. This setup is crucial for managing indexed file operations dynamically.

```cobol
         DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX001.
           COPY MTPX020.

           SELECT MTD999 ASSIGN TO PATH-MTD999
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-MTD999
                  LOCK MODE IS MANUAL WITH LOCK ON RECORD
                  RECORD KEY IS ALBUM-MTG999
                  ALTERNATE RECORD KEY IS CHAVE-MTG999 =
                            DATAMOV-MTG999, ALBUM-MTG999
                  ALTERNATE RECORD KEY IS ANOMES-VISITA-MTG999
                            WITH DUPLICATES.

           SELECT MTD300 ASSIGN TO PATH-MTD300
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
```

---

</SwmSnippet>

<SwmSnippet path="/src/galho/galho43.CBL" line="10">

---

The <SwmPath>[src/galho/galho43.CBL](src/galho/galho43.CBL)</SwmPath> file also contains a <SwmToken path="src/galho/galho43.CBL" pos="13:1:3" line-data="       FILE-CONTROL.">`FILE-CONTROL`</SwmToken> paragraph, which specifies the configuration for the <SwmToken path="src/galho/galho43.CBL" pos="18:3:3" line-data="           SELECT CGD999 ASSIGN TO PATH-CGD999">`CGD999`</SwmToken> file. This includes defining the organization, access mode, and record keys for the file.

```cobol
         PRINTER IS LPRINTER.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           COPY CAPX001.

           COPY CGPX006.

           SELECT CGD999 ASSIGN TO PATH-CGD999
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  LOCK MODE IS MANUAL WITH LOCK ON RECORD
                  RECORD KEY IS CHAVE-CG99
                  STATUS IS ST-CGD999.

       DATA DIVISION.
       FILE SECTION.

           COPY CAPW001.

           COPY CGPW006.
```

---

</SwmSnippet>

# Examples of `galho` files in use

Here are some examples of how `galho` files are used in the Kello Imagens system:

- <SwmPath>[src/galho/galho17.CBL](src/galho/galho17.CBL)</SwmPath>: Manages indexed file operations for <SwmToken path="src/galho/galho17.CBL" pos="17:3:3" line-data="           SELECT MTD999 ASSIGN TO PATH-MTD999">`MTD999`</SwmToken> and <SwmToken path="src/galho/galho17.CBL" pos="28:3:3" line-data="           SELECT MTD300 ASSIGN TO PATH-MTD300">`MTD300`</SwmToken>.
- <SwmPath>[src/galho/galho43.CBL](src/galho/galho43.CBL)</SwmPath>: Configures file handling for <SwmToken path="src/galho/galho43.CBL" pos="18:3:3" line-data="           SELECT CGD999 ASSIGN TO PATH-CGD999">`CGD999`</SwmToken>.
- <SwmPath>[src/galho/galho42.CBL](src/galho/galho42.CBL)</SwmPath>: Handles printer operations and file control for `CRPX020`.
- <SwmPath>[src/galho/galho19.cbl](src/galho/galho19.cbl)</SwmPath>: Manages dynamic access and record key definitions for the `WORK` file.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
