---
title: Basic concepts of Copy of COBOL Program 2
---
Copy COBOL 2 refers to a specific COBOL program file used in the Cooperative Operations of the Kello Imagens system.

It is a copy of the original <SwmPath>[src/cop/cop104.cbl](src/cop/cop104.cbl)</SwmPath> file, which is used for generating reports and handling contracts within the system.

The program includes various sections such as the Identification Division, Environment Division, Data Division, and Procedure Division, each serving different purposes in the program's execution.

The Data Division includes multiple `COPY` statements that import predefined data structures and routines from other COBOL copybooks, facilitating code reuse and modularity.

The program logic involves reading contract data, performing calculations, and generating reports based on specific criteria, such as listing only active contracts.

The Identification Division provides metadata about the program, including the author and the purpose of the program.

The Data Division includes multiple `COPY` statements that import predefined data structures and routines from other COBOL copybooks.

The Procedure Division contains the program logic, including reading contract data, performing calculations, and generating reports.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBa2VsbG8lM0ElM0Fzd2ltbWlv" repo-name="kello"><sup>Powered by [Swimm](/)</sup></SwmMeta>
