---
title: Role of .GS and .OBJ files in report generation
---
This document will cover the role of .GS and .OBJ files within the report generation process. We'll cover:

1. What are .GS files
2. What are .OBJ files
3. How .GS and .OBJ files are used in report generation

# What are .GS files

.GS files are typically associated with Ghostscript, a suite of software that provides an interpreter for PostScript and PDF files. In the context of the Kello Imagens system, .GS files are used to handle the generation and manipulation of PDF files for reports. These files contain scripts that define how the PDF should be created, formatted, and printed.

<SwmSnippet path="/app_aux/DoroPDFWriter/GS/lib/gslj" line="1">

---

# What are .GS files

This script sets up the Ghostscript executable and defines parameters for generating a laserjet PDF. It shows how .GS files are used to configure the PDF generation process.

```
#!/bin/sh

# This definition is changed on install to match the
# executable name set in the makefile
GS_EXECUTABLE=gs
gs="`dirname \"$0\"`/$GS_EXECUTABLE"
if test ! -x "$gs"; then
	gs="$GS_EXECUTABLE"
fi
GS_EXECUTABLE="$gs"

exec "$GS_EXECUTABLE" -q -sDEVICE=laserjet -r300 -P- -dSAFER -dNOPAUSE -sPROGNAME=$0 -- gslp.ps --heading-center "`date`" "$@"

```

---

</SwmSnippet>

<SwmSnippet path="/app_aux/DoroPDFWriter/GS/lib/gsdj" line="1">

---

Similar to gslj, this script sets up the Ghostscript executable for generating a deskjet PDF. It further illustrates the role of .GS files in defining the specifics of PDF generation.

```
#!/bin/sh

# This definition is changed on install to match the
# executable name set in the makefile
GS_EXECUTABLE=gs
gs="`dirname \"$0\"`/$GS_EXECUTABLE"
if test ! -x "$gs"; then
	gs="$GS_EXECUTABLE"
fi
GS_EXECUTABLE="$gs"

exec "$GS_EXECUTABLE" -q -sDEVICE=deskjet -r300 -P- -dSAFER -dNOPAUSE -sPROGNAME=$0 -- gslp.ps --heading-center "`date`" "$@"

```

---

</SwmSnippet>

# What are .OBJ files

.OBJ files are object files that contain compiled code, which is not yet linked into a complete executable. In the context of the Kello Imagens system, .OBJ files are likely used to store compiled COBOL code that is part of the report generation process. These files are intermediate files created during the compilation of COBOL programs.

# How .GS and .OBJ files are used in report generation

In the report generation process, .GS files are used to define how reports should be formatted and printed as PDF files. These scripts are executed to generate the final PDF reports. On the other hand, .OBJ files are used during the compilation of COBOL programs that handle various aspects of report generation, such as data processing and formatting. The compiled .OBJ files are linked to create the final executable that performs the report generation.

<SwmSnippet path="/src/rep/rep100.cbl" line="693">

---

# How .GS and .OBJ files are used in report generation

The <SwmToken path="src/rep/rep100.cbl" pos="693:1:5" line-data="       GRAVAR-DADOS-REPORTAGEM SECTION.">`GRAVAR-DADOS-REPORTAGEM`</SwmToken> section in <SwmPath>[src/rep/rep100.cbl](src/rep/rep100.cbl)</SwmPath> shows how data is processed and written to a report. This COBOL code is compiled into .OBJ files, which are then linked to create the executable for report generation.

```cobol
       GRAVAR-DADOS-REPORTAGEM SECTION.
           CLOSE    RED100
           OPEN I-O RED100
           MOVE GS-DOCTO              TO DOCTO-R100.
           READ RED100 INVALID KEY
                MOVE 1                TO GRAVA-W
           NOT INVALID KEY
                MOVE 0                TO GRAVA-W.
           MOVE GS-DATA-REPORT        TO DATA-INV
           CALL "GRIDAT2" USING DATA-INV
           MOVE DATA-INV              TO DATA-MOV-R100
           MOVE GS-LCTO-CTA-CORR      TO LCTO-CTA-CORR-R100
           MOVE GS-MESANO             TO MESANO-W
           MOVE MESANO-W(1: 2)        TO MESANO-I(5: 2)
           MOVE MESANO-W(3: 4)        TO MESANO-I(1: 4)
           MOVE MESANO-I              TO ANOMES-R100
           MOVE GS-QT-PESSOAS         TO QTDE-PESSOAS-R100
           MOVE GS-QT-VEICULO         TO QTDE-VEICULOS-R100
           MOVE GS-QT-DIAS            TO QTDE-DIAS-R100
           MOVE GS-QT-FORM            TO QTDE-FORM-R100
           MOVE GS-VLR-COMBUSTIVEL    TO VLR-COMB-R100.
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
