---
title: Error Logging in RITAU
---
This document will cover how the <SwmToken path="src/banks/ritau.cbl" pos="3:6:6" line-data="       PROGRAM-ID. RITAU.">`RITAU`</SwmToken> program handles error logging. We'll cover:

1. The purpose of the <SwmToken path="src/banks/ritau.cbl" pos="3:6:6" line-data="       PROGRAM-ID. RITAU.">`RITAU`</SwmToken> program
2. Error logging mechanism
3. Key variables and files involved

<SwmSnippet path="/src/banks/ritau.cbl" line="2">

---

# Purpose of the <SwmToken path="src/banks/ritau.cbl" pos="3:6:6" line-data="       PROGRAM-ID. RITAU.">`RITAU`</SwmToken> Program

The <SwmToken path="src/banks/ritau.cbl" pos="3:6:6" line-data="       PROGRAM-ID. RITAU.">`RITAU`</SwmToken> program is responsible for generating return reports from the ITAU bank. Depending on the type of occurrence, the system performs different actions such as recording the bank number, changing the file carrier, or lowering the title. If the title is not found during the update, the system generates a problem file for manual correction.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RITAU.
       AUTHOR.        ALFREDO SAVIOLLI NETO
      *EMISSÃO DE RELATÓRIO DE RETORNO DO ITAU
      *CONFORME O TIPO DE OCORRENCIA PELO BANCO O SISTEMA FARÁ:
      *02 - ACEITO PELO BANCO - GRAVA O NR-BANCO NO OUTRO-DOCTO-CR20
      *03 - REJEITADO PELO BANCO - MUDA O PORTADOR DO ARQUIVO CRD020
      *06 - BAIXA DE TÍTULO - FAZ A BAIXA DO TÍTULO NO CRD020
      *NO MOMENTO DA ATUALIZACAO DO CRD020 O TÍTULO NÃO FOR ENCONTRADO
      *O SISTEMA VAI GERAR O ARQUIVO PROBLEMA, QUE TEM POR OBJETIVO
      *LISTAR OS PROBLEMAS P/ QUE O USUÁRIO POSSA ACERTÁ-LO MANUALMENTE.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/ritau.cbl" line="72">

---

# Error Logging Mechanism

The variable <SwmToken path="src/banks/ritau.cbl" pos="74:3:7" line-data="       77  DISPLAY-ERROR-NO          PIC 9(4).">`DISPLAY-ERROR-NO`</SwmToken> is used for error logging. It is defined as a 4-digit numeric field and is part of the working storage section. This variable is likely used to capture and display error numbers during the execution of the program.

```cobol
           COPY "CBPRINT.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  AREAS-DE-TRABALHO.
           05 ERRO-1              PIC XX     VALUE SPACES.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/ritau.cbl" line="31">

---

The <SwmPath>[src/copybook_files/LOGACESS.SEL](src/copybook_files/LOGACESS.SEL)</SwmPath> file is included in the program. This file is likely used for logging access and errors, although the exact details of its usage are not provided in the given context.

```cobol
           COPY LOGACESS.SEL.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/ritau.cbl" line="54">

---

The <SwmPath>[src/copybook_files/LOGACESS.FD](src/copybook_files/LOGACESS.FD)</SwmPath> file is also included in the program. This file defines the file descriptor for logging access and errors. The <SwmToken path="src/banks/ritau.cbl" pos="54:5:5" line-data="           COPY LOGACESS.FD.">`FD`</SwmToken>` `<SwmToken path="src/banks/ritau.cbl" pos="56:3:3" line-data="       FD  RETORNO.">`RETORNO`</SwmToken> statement indicates that this file descriptor is used for the return file, which may include error logs.

```cobol
           COPY LOGACESS.FD.

       FD  RETORNO.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/ritau.cbl" line="72">

---

# Key Variables and Files Involved

The <SwmToken path="src/banks/ritau.cbl" pos="74:3:7" line-data="       77  DISPLAY-ERROR-NO          PIC 9(4).">`DISPLAY-ERROR-NO`</SwmToken> variable is crucial for error logging. It is defined as a 4-digit numeric field and is part of the working storage section. This variable is likely used to capture and display error numbers during the execution of the program.

```cobol
           COPY "CBPRINT.CPY".
       78  REFRESH-TEXT-AND-DATA-PROC VALUE 255.
       77  DISPLAY-ERROR-NO          PIC 9(4).
       01  AREAS-DE-TRABALHO.
           05 ERRO-1              PIC XX     VALUE SPACES.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/ritau.cbl" line="31">

---

The <SwmPath>[src/copybook_files/LOGACESS.SEL](src/copybook_files/LOGACESS.SEL)</SwmPath> file is included in the program. This file is likely used for logging access and errors, although the exact details of its usage are not provided in the given context.

```cobol
           COPY LOGACESS.SEL.
```

---

</SwmSnippet>

<SwmSnippet path="/src/banks/ritau.cbl" line="54">

---

The <SwmPath>[src/copybook_files/LOGACESS.FD](src/copybook_files/LOGACESS.FD)</SwmPath> file is also included in the program. This file defines the file descriptor for logging access and errors. The <SwmToken path="src/banks/ritau.cbl" pos="54:5:5" line-data="           COPY LOGACESS.FD.">`FD`</SwmToken>` `<SwmToken path="src/banks/ritau.cbl" pos="56:3:3" line-data="       FD  RETORNO.">`RETORNO`</SwmToken> statement indicates that this file descriptor is used for the return file, which may include error logs.

```cobol
           COPY LOGACESS.FD.

       FD  RETORNO.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
