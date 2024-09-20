---
title: Business logic implemented in GALHO35.cbl
---
# Specific Business Logic in GALHO35.cbl

The file `GALHO35.cbl` contains specific business logic related to handling various file operations and data movements for different company records. The main section where this logic is implemented is the <SwmToken path="src/galho/galho35.cbl" pos="345:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> section.

<SwmSnippet path="/src/galho/galho35.cbl" line="345">

---

# Specific Business Logic in GALHO35.cbl

The <SwmToken path="src/galho/galho35.cbl" pos="345:1:3" line-data="       MAIN-PROCESS SECTION.">`MAIN-PROCESS`</SwmToken> section starts by initializing an error flag (<SwmToken path="src/galho/galho35.cbl" pos="346:7:9" line-data="           MOVE 0 TO ERRO-W">`ERRO-W`</SwmToken>) and opening the <SwmToken path="src/galho/galho35.cbl" pos="347:5:5" line-data="           OPEN INPUT CONTROLE">`CONTROLE`</SwmToken> file for input. It reads the <SwmToken path="src/galho/galho35.cbl" pos="347:5:5" line-data="           OPEN INPUT CONTROLE">`CONTROLE`</SwmToken> file and moves the company data (<SwmToken path="src/galho/galho35.cbl" pos="349:3:3" line-data="           MOVE EMPRESA            TO EMP-REC">`EMPRESA`</SwmToken>) to the <SwmToken path="src/galho/galho35.cbl" pos="349:7:9" line-data="           MOVE EMPRESA            TO EMP-REC">`EMP-REC`</SwmToken> record.

```cobol
       MAIN-PROCESS SECTION.
           MOVE 0 TO ERRO-W
           OPEN INPUT CONTROLE
           READ CONTROLE
           MOVE EMPRESA            TO EMP-REC
           MOVE "CGD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010
           MOVE "CGD999" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD999
           MOVE "CGD011" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD011
           MOVE "CGD991" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD991
           MOVE "CGD012" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD012
           MOVE "CGD992" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD992
           MOVE "CRD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD020
           MOVE "CRD999" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD999
           MOVE "CRD200" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD200
           MOVE "CRD299" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD299
           MOVE "CRD201" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD201
           MOVE "CRD291" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD291
           MOVE "CHD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CHD010
           MOVE "CHD999" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CHD999

           OPEN I-O
```

---

</SwmSnippet>

<SwmSnippet path="/src/galho/galho35.cbl" line="350">

---

The program then sets up paths for various files (<SwmToken path="src/galho/galho35.cbl" pos="350:4:4" line-data="           MOVE &quot;CGD010&quot; TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010">`CGD010`</SwmToken>, <SwmToken path="src/galho/galho35.cbl" pos="351:4:4" line-data="           MOVE &quot;CGD999&quot; TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD999">`CGD999`</SwmToken>, <SwmToken path="src/galho/galho35.cbl" pos="352:4:4" line-data="           MOVE &quot;CGD011&quot; TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD011">`CGD011`</SwmToken>, etc.) by moving the company reference (<SwmToken path="src/galho/galho35.cbl" pos="350:16:18" line-data="           MOVE &quot;CGD010&quot; TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010">`EMPRESA-REF`</SwmToken>) to the respective path variables (<SwmToken path="src/galho/galho35.cbl" pos="350:22:24" line-data="           MOVE &quot;CGD010&quot; TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010">`PATH-CGD010`</SwmToken>, <SwmToken path="src/galho/galho35.cbl" pos="351:22:24" line-data="           MOVE &quot;CGD999&quot; TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD999">`PATH-CGD999`</SwmToken>, etc.). This setup is crucial for subsequent file operations.

```cobol
           MOVE "CGD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD010
           MOVE "CGD999" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD999
           MOVE "CGD011" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD011
           MOVE "CGD991" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD991
           MOVE "CGD012" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD012
           MOVE "CGD992" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CGD992
           MOVE "CRD020" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD020
           MOVE "CRD999" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD999
           MOVE "CRD200" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD200
           MOVE "CRD299" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD299
           MOVE "CRD201" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD201
           MOVE "CRD291" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CRD291
           MOVE "CHD010" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CHD010
           MOVE "CHD999" TO ARQ-REC.  MOVE EMPRESA-REF TO PATH-CHD999
```

---

</SwmSnippet>

<SwmSnippet path="/src/galho/galho35.cbl" line="365">

---

Finally, the program opens several files (<SwmToken path="src/galho/galho35.cbl" pos="366:1:1" line-data="                    CGD010">`CGD010`</SwmToken>, <SwmToken path="src/galho/galho35.cbl" pos="367:1:1" line-data="                    CGD011">`CGD011`</SwmToken>, etc.) for <SwmToken path="src/galho/galho35.cbl" pos="11:1:3" line-data="       INPUT-OUTPUT SECTION.">`INPUT-OUTPUT`</SwmToken> operations. This step prepares the files for reading and writing operations that follow in the business logic.

```cobol
           OPEN I-O
                    CGD010
                    CGD011
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
