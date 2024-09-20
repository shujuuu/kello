---
title: 'Interaction Between Components: mtp020, crp053, and rep201'
---
This document will cover how different components like <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken>, `crp053`, and `rep201` interact. We'll cover:

1. Overview of the components
2. Interaction between <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> and `crp053`
3. Interaction between <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> and `rep201`
4. Interaction between `crp053` and `rep201`

# Overview of the components

The components <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken>, `crp053`, and `rep201` are part of the Kello Imagens business operations management system. Each component has a specific role within the system:

- <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken>: Handles various forms and data related to the business operations.
- `crp053`: Manages specific report generation and data processing tasks.
- `rep201`: Responsible for generating detailed reports and handling data output.

<SwmSnippet path="/src/kello/mtp020.cbl" line="21">

---

# Interaction between <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> and `crp053`

The <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> component interacts with `crp053` through various COPY statements. These statements include <SwmToken path="src/kello/mtp020.cbl" pos="26:1:3" line-data="           COPY MTPX020.">`COPY MTPX020`</SwmToken> and <SwmToken path="src/kello/mtp020.cbl" pos="21:1:1" line-data="           COPY COPX040.">`COPY`</SwmToken>` CRPX020`, which bring in definitions and functionalities from `crp053` into <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken>.

```cobol
           COPY COPX040.
           COPY CGPX001.
           COPY MTPX001.
           COPY MTPX002.
           COPY MTPX019.
           COPY MTPX020.
           COPY MTPX020C.
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/ACP100/CRPX020.CPY" line="1">

---

The <SwmPath>[src/acp/ACP100/CRPX020.CPY](src/acp/ACP100/CRPX020.CPY)</SwmPath> file contains definitions and data structures that are used by <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> to perform its operations. This interaction ensures that <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> can access and process the data managed by `crp053`.

```cobol
          $set IDXFORMAT"4" FILETYPE"4"
          SELECT CRD020 ASSIGN TO PATH-CRD020
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-CRD020
                  LOCK MODE IS AUTOMATIC WITH LOCK ON RECORD
                  RECORD KEY IS CHAVE-CR20
      *           = COD-COMPL-CR20 SEQ-CR20
                  ALTERNATE RECORD KEY IS DATA-MOVTO-CR20
                            WITH DUPLICATES
```

---

</SwmSnippet>

<SwmSnippet path="/src/kello/mtp020.cbl" line="22">

---

# Interaction between <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> and `rep201`

The <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> component also interacts with `rep201` through COPY statements such as <SwmToken path="src/kello/mtp020.cbl" pos="26:1:3" line-data="           COPY MTPX020.">`COPY MTPX020`</SwmToken> and <SwmToken path="src/kello/mtp020.cbl" pos="22:1:1" line-data="           COPY CGPX001.">`COPY`</SwmToken>` CRPX201`. These statements allow <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> to utilize the reporting functionalities provided by `rep201`.

```cobol
           COPY CGPX001.
           COPY MTPX001.
           COPY MTPX002.
           COPY MTPX019.
           COPY MTPX020.
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/ACP100/CRPX201.CPY" line="1">

---

The <SwmPath>[src/acp/ACP100/CRPX201.CPY](src/acp/ACP100/CRPX201.CPY)</SwmPath> file includes definitions and data structures that are essential for <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> to generate reports. This interaction ensures that <SwmToken path="src/kello/mtp020.cbl" pos="3:6:6" line-data="       PROGRAM-ID. MTP020.">`MTP020`</SwmToken> can produce detailed reports using the capabilities of `rep201`.

```cobol
          SELECT CRD201 ASSIGN TO PATH-CRD201
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-CRD201
                  LOCK MODE IS AUTOMATIC
                  WITH LOCK ON RECORD
                  RECORD KEY IS CHAVE-CR201 = COD-COMPL-CR201 SEQ-CR201
                                              SUBSEQ-CR201.

```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/ACP100/CRPX020.CPY" line="1">

---

# Interaction between `crp053` and `rep201`

The `crp053` component interacts with `rep201` through shared data structures and definitions. The <SwmPath>[src/acp/ACP100/CRPX020.CPY](src/acp/ACP100/CRPX020.CPY)</SwmPath> file includes references to `rep201`, allowing `crp053` to access reporting functionalities.

```cobol
          $set IDXFORMAT"4" FILETYPE"4"
          SELECT CRD020 ASSIGN TO PATH-CRD020
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-CRD020
                  LOCK MODE IS AUTOMATIC WITH LOCK ON RECORD
                  RECORD KEY IS CHAVE-CR20
      *           = COD-COMPL-CR20 SEQ-CR20
                  ALTERNATE RECORD KEY IS DATA-MOVTO-CR20
                            WITH DUPLICATES
```

---

</SwmSnippet>

<SwmSnippet path="/src/acp/ACP100/CRPX201.CPY" line="1">

---

Similarly, the <SwmPath>[src/acp/ACP100/CRPX201.CPY](src/acp/ACP100/CRPX201.CPY)</SwmPath> file contains definitions that are used by both `crp053` and `rep201`. This shared usage ensures that both components can work together seamlessly to generate and process reports.

```cobol
          SELECT CRD201 ASSIGN TO PATH-CRD201
                  ORGANIZATION IS INDEXED
                  ACCESS MODE IS DYNAMIC
                  STATUS IS ST-CRD201
                  LOCK MODE IS AUTOMATIC
                  WITH LOCK ON RECORD
                  RECORD KEY IS CHAVE-CR201 = COD-COMPL-CR201 SEQ-CR201
                                              SUBSEQ-CR201.

```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
