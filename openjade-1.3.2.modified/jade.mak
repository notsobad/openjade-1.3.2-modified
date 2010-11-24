# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103
# TARGTYPE "Win32 (x86) External Target" 0x0106
# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

!IF "$(CFG)" == ""
CFG=groveoa - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to groveoa - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "grove - Win32 Release" && "$(CFG)" != "grove - Win32 Debug" &&\
 "$(CFG)" != "spgrove - Win32 Release" && "$(CFG)" != "spgrove - Win32 Debug" &&\
 "$(CFG)" != "style - Win32 Release" && "$(CFG)" != "style - Win32 Debug" &&\
 "$(CFG)" != "jade - Win32 Release" && "$(CFG)" != "jade - Win32 Debug" &&\
 "$(CFG)" != "jadedist - Win32 Release" && "$(CFG)" != "groveoa - Win32 Release"\
 && "$(CFG)" != "groveoa - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "jade.mak" CFG="groveoa - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "grove - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "grove - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "spgrove - Win32 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "spgrove - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "style - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "style - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "jade - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "jade - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "jadedist - Win32 Release" (based on "Win32 (x86) External Target")
!MESSAGE "groveoa - Win32 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "groveoa - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "groveoa - Win32 Debug"

!IF  "$(CFG)" == "grove - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "grove\Release"
# PROP BASE Intermediate_Dir "grove\Release"
# PROP BASE Target_Dir "grove"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "grove\Release"
# PROP Intermediate_Dir "grove\Release"
# PROP Target_Dir "grove"
OUTDIR=.\grove\Release
INTDIR=.\grove\Release

ALL : ".\bin\grove.dll"

CLEAN : 
	-@erase "$(INTDIR)\LocNode.obj"
	-@erase "$(INTDIR)\Node.obj"
	-@erase "$(OUTDIR)\grove.exp"
	-@erase "$(OUTDIR)\grove.lib"
	-@erase ".\bin\grove.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBGROVE" /YX /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "include" /D "NDEBUG" /D "WIN32" /D\
 "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBGROVE" /Fp"$(INTDIR)/grove.pch" /YX\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\grove\Release/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/grove.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20200000 /subsystem:windows /dll /machine:I386 /out:"bin\grove.dll"
# SUBTRACT LINK32 /profile
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /base:0x20200000 /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/grove.pdb" /machine:I386 /out:"bin\grove.dll"\
 /implib:"$(OUTDIR)/grove.lib" 
LINK32_OBJS= \
	"$(INTDIR)\LocNode.obj" \
	"$(INTDIR)\Node.obj"

".\bin\grove.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "grove - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "grove\Debug"
# PROP BASE Intermediate_Dir "grove\Debug"
# PROP BASE Target_Dir "grove"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "grove\Debug"
# PROP Intermediate_Dir "grove\Debug"
# PROP Target_Dir "grove"
OUTDIR=.\grove\Debug
INTDIR=.\grove\Debug

ALL : ".\dbgbin\grove.dll"

CLEAN : 
	-@erase "$(INTDIR)\LocNode.obj"
	-@erase "$(INTDIR)\Node.obj"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\grove.exp"
	-@erase "$(OUTDIR)\grove.lib"
	-@erase "$(OUTDIR)\grove.pdb"
	-@erase ".\dbgbin\grove.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBGROVE" /YX /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /D "_DEBUG" /D "WIN32"\
 /D "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBGROVE" /Fp"$(INTDIR)/grove.pch" /YX\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\grove\Debug/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/grove.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20200000 /subsystem:windows /dll /incremental:no /debug /machine:I386 /out:"dbgbin\grove.dll"
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /base:0x20200000 /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/grove.pdb" /debug /machine:I386 /out:"dbgbin\grove.dll"\
 /implib:"$(OUTDIR)/grove.lib" 
LINK32_OBJS= \
	"$(INTDIR)\LocNode.obj" \
	"$(INTDIR)\Node.obj"

".\dbgbin\grove.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "spgrove - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "spgrove\Release"
# PROP BASE Intermediate_Dir "spgrove\Release"
# PROP BASE Target_Dir "spgrove"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "spgrove\Release"
# PROP Intermediate_Dir "spgrove\Release"
# PROP Target_Dir "spgrove"
OUTDIR=.\spgrove\Release
INTDIR=.\spgrove\Release

ALL : "grove - Win32 Release" ".\bin\spgrove.dll"

CLEAN : 
	-@erase "$(INTDIR)\GroveApp.obj"
	-@erase "$(INTDIR)\GroveBuilder.obj"
	-@erase "$(INTDIR)\SdNode.obj"
	-@erase "$(OUTDIR)\spgrove.exp"
	-@erase "$(OUTDIR)\spgrove.lib"
	-@erase ".\bin\spgrove.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "include" /I "grove" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBSPGROVE" /YX /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "include" /I "grove" /D "NDEBUG" /D "WIN32"\
 /D "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBSPGROVE" /Fp"$(INTDIR)/spgrove.pch"\
 /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\spgrove\Release/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/spgrove.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20100000 /subsystem:windows /dll /machine:I386 /out:"bin/spgrove.dll"
# SUBTRACT LINK32 /profile
LINK32_FLAGS=lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20100000 /subsystem:windows\
 /dll /incremental:no /pdb:"$(OUTDIR)/spgrove.pdb" /machine:I386\
 /out:"bin/spgrove.dll" /implib:"$(OUTDIR)/spgrove.lib" 
LINK32_OBJS= \
	"$(INTDIR)\GroveApp.obj" \
	"$(INTDIR)\GroveBuilder.obj" \
	"$(INTDIR)\SdNode.obj" \
	".\grove\Release\grove.lib"

".\bin\spgrove.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "spgrove - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "spgrove\Debug"
# PROP BASE Intermediate_Dir "spgrove\Debug"
# PROP BASE Target_Dir "spgrove"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "spgrove\Debug"
# PROP Intermediate_Dir "spgrove\Debug"
# PROP Target_Dir "spgrove"
OUTDIR=.\spgrove\Debug
INTDIR=.\spgrove\Debug

ALL : "grove - Win32 Debug" ".\dbgbin\spgrove.dll"

CLEAN : 
	-@erase "$(INTDIR)\GroveApp.obj"
	-@erase "$(INTDIR)\GroveBuilder.obj"
	-@erase "$(INTDIR)\SdNode.obj"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\spgrove.exp"
	-@erase "$(OUTDIR)\spgrove.lib"
	-@erase "$(OUTDIR)\spgrove.pdb"
	-@erase ".\dbgbin\spgrove.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /D SP_NAMESPACE=James_Clark_SP /D "BUILD_LIBSPGROVE" /YX /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /D "_DEBUG"\
 /D "WIN32" /D "_WINDOWS" /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /D SP_NAMESPACE=James_Clark_SP /D\
 "BUILD_LIBSPGROVE" /Fp"$(INTDIR)/spgrove.pch" /YX /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\spgrove\Debug/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/spgrove.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20100000 /subsystem:windows /dll /incremental:no /debug /machine:I386 /out:"dbgbin\spgrove.dll"
LINK32_FLAGS=lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20100000 /subsystem:windows\
 /dll /incremental:no /pdb:"$(OUTDIR)/spgrove.pdb" /debug /machine:I386\
 /out:"dbgbin\spgrove.dll" /implib:"$(OUTDIR)/spgrove.lib" 
LINK32_OBJS= \
	"$(INTDIR)\GroveApp.obj" \
	"$(INTDIR)\GroveBuilder.obj" \
	"$(INTDIR)\SdNode.obj" \
	".\grove\Debug\grove.lib"

".\dbgbin\spgrove.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "style - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "style\Release"
# PROP BASE Intermediate_Dir "style\Release"
# PROP BASE Target_Dir "style"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "style\Release"
# PROP Intermediate_Dir "style\Release"
# PROP Target_Dir "style"
OUTDIR=.\style\Release
INTDIR=.\style\Release

ALL : "spgrove - Win32 Release" "grove - Win32 Release" ".\bin\style.dll"

CLEAN : 
	-@erase "$(INTDIR)\Collector.obj"
	-@erase "$(INTDIR)\common_inst.obj"
	-@erase "$(INTDIR)\DssslApp.obj"
	-@erase "$(INTDIR)\DssslSpecEventHandler.obj"
	-@erase "$(INTDIR)\ELObj.obj"
	-@erase "$(INTDIR)\ELObjMessageArg.obj"
	-@erase "$(INTDIR)\Expression.obj"
	-@erase "$(INTDIR)\FlowObj.obj"
	-@erase "$(INTDIR)\FOTBuilder.obj"
	-@erase "$(INTDIR)\GroveManager.obj"
	-@erase "$(INTDIR)\InheritedC.obj"
	-@erase "$(INTDIR)\Insn.obj"
	-@erase "$(INTDIR)\Interpreter.obj"
	-@erase "$(INTDIR)\InterpreterMessages.obj"
	-@erase "$(INTDIR)\MacroFlowObj.obj"
	-@erase "$(INTDIR)\NumberCache.obj"
	-@erase "$(INTDIR)\Pattern.obj"
	-@erase "$(INTDIR)\primitive.obj"
	-@erase "$(INTDIR)\ProcessContext.obj"
	-@erase "$(INTDIR)\ProcessingMode.obj"
	-@erase "$(INTDIR)\SchemeParser.obj"
	-@erase "$(INTDIR)\Style.obj"
	-@erase "$(INTDIR)\style.pch"
	-@erase "$(INTDIR)\style_inst.obj"
	-@erase "$(INTDIR)\StyleEngine.obj"
	-@erase "$(INTDIR)\stylelib.obj"
	-@erase "$(OUTDIR)\style.exp"
	-@erase "$(OUTDIR)\style.lib"
	-@erase ".\bin\style.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D "SP_MULTI_BYTE" /YX /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\style\Release/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/style.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20000000 /subsystem:windows /dll /machine:I386 /out:"bin\style.dll"
# SUBTRACT LINK32 /profile
LINK32_FLAGS=lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20000000 /subsystem:windows\
 /dll /incremental:no /pdb:"$(OUTDIR)/style.pdb" /machine:I386\
 /out:"bin\style.dll" /implib:"$(OUTDIR)/style.lib" 
LINK32_OBJS= \
	"$(INTDIR)\Collector.obj" \
	"$(INTDIR)\common_inst.obj" \
	"$(INTDIR)\DssslApp.obj" \
	"$(INTDIR)\DssslSpecEventHandler.obj" \
	"$(INTDIR)\ELObj.obj" \
	"$(INTDIR)\ELObjMessageArg.obj" \
	"$(INTDIR)\Expression.obj" \
	"$(INTDIR)\FlowObj.obj" \
	"$(INTDIR)\FOTBuilder.obj" \
	"$(INTDIR)\GroveManager.obj" \
	"$(INTDIR)\InheritedC.obj" \
	"$(INTDIR)\Insn.obj" \
	"$(INTDIR)\Interpreter.obj" \
	"$(INTDIR)\InterpreterMessages.obj" \
	"$(INTDIR)\MacroFlowObj.obj" \
	"$(INTDIR)\NumberCache.obj" \
	"$(INTDIR)\Pattern.obj" \
	"$(INTDIR)\primitive.obj" \
	"$(INTDIR)\ProcessContext.obj" \
	"$(INTDIR)\ProcessingMode.obj" \
	"$(INTDIR)\SchemeParser.obj" \
	"$(INTDIR)\Style.obj" \
	"$(INTDIR)\style_inst.obj" \
	"$(INTDIR)\StyleEngine.obj" \
	"$(INTDIR)\stylelib.obj" \
	".\grove\Release\grove.lib" \
	".\spgrove\Release\spgrove.lib"

".\bin\style.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "style\Debug"
# PROP BASE Intermediate_Dir "style\Debug"
# PROP BASE Target_Dir "style"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "style\Debug"
# PROP Intermediate_Dir "style\Debug"
# PROP Target_Dir "style"
OUTDIR=.\style\Debug
INTDIR=.\style\Debug

ALL : "spgrove - Win32 Debug" "grove - Win32 Debug" ".\dbgbin\style.dll"\
 "$(OUTDIR)\style.bsc"

CLEAN : 
	-@erase "$(INTDIR)\Collector.obj"
	-@erase "$(INTDIR)\Collector.sbr"
	-@erase "$(INTDIR)\common_inst.obj"
	-@erase "$(INTDIR)\common_inst.sbr"
	-@erase "$(INTDIR)\DssslApp.obj"
	-@erase "$(INTDIR)\DssslApp.sbr"
	-@erase "$(INTDIR)\DssslSpecEventHandler.obj"
	-@erase "$(INTDIR)\DssslSpecEventHandler.sbr"
	-@erase "$(INTDIR)\ELObj.obj"
	-@erase "$(INTDIR)\ELObj.sbr"
	-@erase "$(INTDIR)\ELObjMessageArg.obj"
	-@erase "$(INTDIR)\ELObjMessageArg.sbr"
	-@erase "$(INTDIR)\Expression.obj"
	-@erase "$(INTDIR)\Expression.sbr"
	-@erase "$(INTDIR)\FlowObj.obj"
	-@erase "$(INTDIR)\FlowObj.sbr"
	-@erase "$(INTDIR)\FOTBuilder.obj"
	-@erase "$(INTDIR)\FOTBuilder.sbr"
	-@erase "$(INTDIR)\GroveManager.obj"
	-@erase "$(INTDIR)\GroveManager.sbr"
	-@erase "$(INTDIR)\InheritedC.obj"
	-@erase "$(INTDIR)\InheritedC.sbr"
	-@erase "$(INTDIR)\Insn.obj"
	-@erase "$(INTDIR)\Insn.sbr"
	-@erase "$(INTDIR)\Interpreter.obj"
	-@erase "$(INTDIR)\Interpreter.sbr"
	-@erase "$(INTDIR)\InterpreterMessages.obj"
	-@erase "$(INTDIR)\InterpreterMessages.sbr"
	-@erase "$(INTDIR)\MacroFlowObj.obj"
	-@erase "$(INTDIR)\MacroFlowObj.sbr"
	-@erase "$(INTDIR)\NumberCache.obj"
	-@erase "$(INTDIR)\NumberCache.sbr"
	-@erase "$(INTDIR)\Pattern.obj"
	-@erase "$(INTDIR)\Pattern.sbr"
	-@erase "$(INTDIR)\primitive.obj"
	-@erase "$(INTDIR)\primitive.sbr"
	-@erase "$(INTDIR)\ProcessContext.obj"
	-@erase "$(INTDIR)\ProcessContext.sbr"
	-@erase "$(INTDIR)\ProcessingMode.obj"
	-@erase "$(INTDIR)\ProcessingMode.sbr"
	-@erase "$(INTDIR)\SchemeParser.obj"
	-@erase "$(INTDIR)\SchemeParser.sbr"
	-@erase "$(INTDIR)\Style.obj"
	-@erase "$(INTDIR)\style.pch"
	-@erase "$(INTDIR)\Style.sbr"
	-@erase "$(INTDIR)\style_inst.obj"
	-@erase "$(INTDIR)\style_inst.sbr"
	-@erase "$(INTDIR)\StyleEngine.obj"
	-@erase "$(INTDIR)\StyleEngine.sbr"
	-@erase "$(INTDIR)\stylelib.obj"
	-@erase "$(INTDIR)\stylelib.sbr"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\style.bsc"
	-@erase "$(OUTDIR)\style.exp"
	-@erase "$(OUTDIR)\style.lib"
	-@erase "$(OUTDIR)\style.pdb"
	-@erase ".\dbgbin\style.dll"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D "SP_MULTI_BYTE" /FR /YX /c
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /YX /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\style\Debug/
CPP_SBRS=.\style\Debug/

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/style.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\Collector.sbr" \
	"$(INTDIR)\common_inst.sbr" \
	"$(INTDIR)\DssslApp.sbr" \
	"$(INTDIR)\DssslSpecEventHandler.sbr" \
	"$(INTDIR)\ELObj.sbr" \
	"$(INTDIR)\ELObjMessageArg.sbr" \
	"$(INTDIR)\Expression.sbr" \
	"$(INTDIR)\FlowObj.sbr" \
	"$(INTDIR)\FOTBuilder.sbr" \
	"$(INTDIR)\GroveManager.sbr" \
	"$(INTDIR)\InheritedC.sbr" \
	"$(INTDIR)\Insn.sbr" \
	"$(INTDIR)\Interpreter.sbr" \
	"$(INTDIR)\InterpreterMessages.sbr" \
	"$(INTDIR)\MacroFlowObj.sbr" \
	"$(INTDIR)\NumberCache.sbr" \
	"$(INTDIR)\Pattern.sbr" \
	"$(INTDIR)\primitive.sbr" \
	"$(INTDIR)\ProcessContext.sbr" \
	"$(INTDIR)\ProcessingMode.sbr" \
	"$(INTDIR)\SchemeParser.sbr" \
	"$(INTDIR)\Style.sbr" \
	"$(INTDIR)\style_inst.sbr" \
	"$(INTDIR)\StyleEngine.sbr" \
	"$(INTDIR)\stylelib.sbr"

"$(OUTDIR)\style.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20000000 /subsystem:windows /dll /incremental:no /debug /machine:I386 /out:"dbgbin\style.dll"
# SUBTRACT LINK32 /map
LINK32_FLAGS=lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /base:0x20000000 /subsystem:windows\
 /dll /incremental:no /pdb:"$(OUTDIR)/style.pdb" /debug /machine:I386\
 /out:"dbgbin\style.dll" /implib:"$(OUTDIR)/style.lib" 
LINK32_OBJS= \
	"$(INTDIR)\Collector.obj" \
	"$(INTDIR)\common_inst.obj" \
	"$(INTDIR)\DssslApp.obj" \
	"$(INTDIR)\DssslSpecEventHandler.obj" \
	"$(INTDIR)\ELObj.obj" \
	"$(INTDIR)\ELObjMessageArg.obj" \
	"$(INTDIR)\Expression.obj" \
	"$(INTDIR)\FlowObj.obj" \
	"$(INTDIR)\FOTBuilder.obj" \
	"$(INTDIR)\GroveManager.obj" \
	"$(INTDIR)\InheritedC.obj" \
	"$(INTDIR)\Insn.obj" \
	"$(INTDIR)\Interpreter.obj" \
	"$(INTDIR)\InterpreterMessages.obj" \
	"$(INTDIR)\MacroFlowObj.obj" \
	"$(INTDIR)\NumberCache.obj" \
	"$(INTDIR)\Pattern.obj" \
	"$(INTDIR)\primitive.obj" \
	"$(INTDIR)\ProcessContext.obj" \
	"$(INTDIR)\ProcessingMode.obj" \
	"$(INTDIR)\SchemeParser.obj" \
	"$(INTDIR)\Style.obj" \
	"$(INTDIR)\style_inst.obj" \
	"$(INTDIR)\StyleEngine.obj" \
	"$(INTDIR)\stylelib.obj" \
	".\grove\Debug\grove.lib" \
	".\spgrove\Debug\spgrove.lib"

".\dbgbin\style.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "jade - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "jade\Release"
# PROP BASE Intermediate_Dir "jade\Release"
# PROP BASE Target_Dir "jade"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "jade\Release"
# PROP Intermediate_Dir "jade\Release"
# PROP Target_Dir "jade"
OUTDIR=.\jade\Release
INTDIR=.\jade\Release

ALL : "style - Win32 Release" "spgrove - Win32 Release" "grove - Win32 Release"\
 ".\bin\jade.exe"

CLEAN : 
	-@erase "$(INTDIR)\HtmlFOTBuilder.obj"
	-@erase "$(INTDIR)\jade.obj"
	-@erase "$(INTDIR)\jade.res"
	-@erase "$(INTDIR)\MifFOTBuilder.obj"
	-@erase "$(INTDIR)\RtfFOTBuilder.obj"
	-@erase "$(INTDIR)\RtfOle.obj"
	-@erase "$(INTDIR)\SgmlFOTBuilder.obj"
	-@erase "$(INTDIR)\TeXFOTBuilder.obj"
	-@erase "$(INTDIR)\TransformFOTBuilder.obj"
	-@erase ".\bin\jade.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "include" /I "style" /I "grove" /I "spgrove" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D "SP_MULTI_BYTE" /YX /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "include" /I "style" /I "grove" /I\
 "spgrove" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP\
 /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/jade.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\jade\Release/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
RSC_PROJ=/l 0x809 /fo"$(INTDIR)/jade.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/jade.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386 /out:"bin/jade.exe"
# SUBTRACT LINK32 /profile
LINK32_FLAGS=lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/jade.pdb" /machine:I386 /out:"bin/jade.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HtmlFOTBuilder.obj" \
	"$(INTDIR)\jade.obj" \
	"$(INTDIR)\jade.res" \
	"$(INTDIR)\MifFOTBuilder.obj" \
	"$(INTDIR)\RtfFOTBuilder.obj" \
	"$(INTDIR)\RtfOle.obj" \
	"$(INTDIR)\SgmlFOTBuilder.obj" \
	"$(INTDIR)\TeXFOTBuilder.obj" \
	"$(INTDIR)\TransformFOTBuilder.obj" \
	".\grove\Release\grove.lib" \
	".\spgrove\Release\spgrove.lib" \
	".\style\Release\style.lib"

".\bin\jade.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "jade\Debug"
# PROP BASE Intermediate_Dir "jade\Debug"
# PROP BASE Target_Dir "jade"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "jade\Debug"
# PROP Intermediate_Dir "jade\Debug"
# PROP Target_Dir "jade"
OUTDIR=.\jade\Debug
INTDIR=.\jade\Debug

ALL : "style - Win32 Debug" "spgrove - Win32 Debug" "grove - Win32 Debug"\
 ".\dbgbin\jade.exe"

CLEAN : 
	-@erase "$(INTDIR)\HtmlFOTBuilder.obj"
	-@erase "$(INTDIR)\jade.obj"
	-@erase "$(INTDIR)\jade.res"
	-@erase "$(INTDIR)\MifFOTBuilder.obj"
	-@erase "$(INTDIR)\RtfFOTBuilder.obj"
	-@erase "$(INTDIR)\RtfOle.obj"
	-@erase "$(INTDIR)\SgmlFOTBuilder.obj"
	-@erase "$(INTDIR)\TeXFOTBuilder.obj"
	-@erase "$(INTDIR)\TransformFOTBuilder.obj"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\jade.pdb"
	-@erase ".\dbgbin\jade.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MDd /W3 /GX /Zi /Od /I "include" /I "style" /I "grove" /I "spgrove" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D "SP_MULTI_BYTE" /YX /c
CPP_PROJ=/nologo /MDd /W3 /GX /Zi /Od /I "include" /I "style" /I "grove" /I\
 "spgrove" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP\
 /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/jade.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\jade\Debug/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
RSC_PROJ=/l 0x809 /fo"$(INTDIR)/jade.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/jade.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /debug /machine:I386 /out:"dbgbin\jade.exe"
LINK32_FLAGS=lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/jade.pdb" /debug /machine:I386 /out:"dbgbin\jade.exe" 
LINK32_OBJS= \
	"$(INTDIR)\HtmlFOTBuilder.obj" \
	"$(INTDIR)\jade.obj" \
	"$(INTDIR)\jade.res" \
	"$(INTDIR)\MifFOTBuilder.obj" \
	"$(INTDIR)\RtfFOTBuilder.obj" \
	"$(INTDIR)\RtfOle.obj" \
	"$(INTDIR)\SgmlFOTBuilder.obj" \
	"$(INTDIR)\TeXFOTBuilder.obj" \
	"$(INTDIR)\TransformFOTBuilder.obj" \
	".\grove\Debug\grove.lib" \
	".\spgrove\Debug\spgrove.lib" \
	".\style\Debug\style.lib"

".\dbgbin\jade.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "jadedist - Win32 Release"

# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "jadedist\Release"
# PROP BASE Intermediate_Dir "jadedist\Release"
# PROP BASE Target_Dir "jadedist"
# PROP BASE Cmd_Line "NMAKE /f jadedist.mak"
# PROP BASE Rebuild_Opt "/a"
# PROP BASE Target_File "jadedist\jadedist.exe"
# PROP BASE Bsc_Name "jadedist\jadedist.bsc"
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "jadedist\Release"
# PROP Intermediate_Dir "jadedist\Release"
# PROP Target_Dir "jadedist"
# PROP Cmd_Line "makedist"
# PROP Rebuild_Opt ""
# PROP Target_File "jadedist\jade.zip"
# PROP Bsc_Name ""
OUTDIR=.\jadedist\Release
INTDIR=.\jadedist\Release

ALL : "jade - Win32 Release" 

CLEAN : 
	-@erase 

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

!ELSEIF  "$(CFG)" == "groveoa - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "groveoa\Release"
# PROP BASE Intermediate_Dir "groveoa\Release"
# PROP BASE Target_Dir "groveoa"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "groveoa\Release"
# PROP Intermediate_Dir "groveoa\Release"
# PROP Target_Dir "groveoa"
OUTDIR=.\groveoa\Release
INTDIR=.\groveoa\Release
# Begin Custom Macros
OutDir=.\groveoa\Release
# End Custom Macros

ALL : "spgrove - Win32 Release" "grove - Win32 Release" ".\bin\groveoa.dll"\
 "$(OUTDIR)\regsvr32.trg"

CLEAN : 
	-@erase "$(INTDIR)\CGroveBuilder.obj"
	-@erase "$(INTDIR)\GroveNode.obj"
	-@erase "$(INTDIR)\groveoa.obj"
	-@erase "$(INTDIR)\groveoa.pch"
	-@erase "$(INTDIR)\groveoa.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(OUTDIR)\groveoa.exp"
	-@erase "$(OUTDIR)\groveoa.lib"
	-@erase "$(OUTDIR)\regsvr32.trg"
	-@erase ".\bin\groveoa.dll"
	-@erase ".\groveoa\groveoa.h"
	-@erase ".\groveoa\groveoa.tlb"
	-@erase ".\groveoa\groveoa_i.c"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W3 /GX /O2 /I "include" /I "grove" /I "spgrove" /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /YX /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /I "include" /I "grove" /I "spgrove" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /YX\
 /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\groveoa\Release/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
RSC_PROJ=/l 0x809 /fo"$(INTDIR)/groveoa.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/groveoa.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386 /out:"bin/groveoa.dll"
LINK32_FLAGS=lib\Release\sp133.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll\
 /incremental:no /pdb:"$(OUTDIR)/groveoa.pdb" /machine:I386\
 /def:".\groveoa\groveoa.def" /out:"bin/groveoa.dll"\
 /implib:"$(OUTDIR)/groveoa.lib" 
DEF_FILE= \
	".\groveoa\groveoa.def"
LINK32_OBJS= \
	"$(INTDIR)\CGroveBuilder.obj" \
	"$(INTDIR)\GroveNode.obj" \
	"$(INTDIR)\groveoa.obj" \
	"$(INTDIR)\groveoa.res" \
	"$(INTDIR)\StdAfx.obj" \
	".\grove\Release\grove.lib" \
	".\spgrove\Release\spgrove.lib"

".\bin\groveoa.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

# Begin Custom Build
OutDir=.\groveoa\Release
TargetPath=.\bin\groveoa.dll
InputPath=.\bin\groveoa.dll
SOURCE=$(InputPath)

"$(OutDir)\regsvr32.trg" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   regsvr32 /s /c "$(TargetPath)"
   echo regsvr32 exec. time > "$(OutDir)\regsvr32.trg"

# End Custom Build

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "groveoa\Debug"
# PROP BASE Intermediate_Dir "groveoa\Debug"
# PROP BASE Target_Dir "groveoa"
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "groveoa\Debug"
# PROP Intermediate_Dir "groveoa\Debug"
# PROP Target_Dir "groveoa"
OUTDIR=.\groveoa\Debug
INTDIR=.\groveoa\Debug

ALL : "spgrove - Win32 Debug" "grove - Win32 Debug" ".\dbgbin\groveoa.dll"

CLEAN : 
	-@erase "$(INTDIR)\CGroveBuilder.obj"
	-@erase "$(INTDIR)\GroveNode.obj"
	-@erase "$(INTDIR)\groveoa.obj"
	-@erase "$(INTDIR)\groveoa.pch"
	-@erase "$(INTDIR)\groveoa.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\groveoa.exp"
	-@erase "$(OUTDIR)\groveoa.lib"
	-@erase "$(OUTDIR)\groveoa.pdb"
	-@erase ".\dbgbin\groveoa.dll"
	-@erase ".\dbgbin\groveoa.ilk"
	-@erase ".\groveoa\groveoa.h"
	-@erase ".\groveoa\groveoa.tlb"
	-@erase ".\groveoa\groveoa_i.c"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /I "spgrove" /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D GROVE_NAMESPACE=James_Clark_GROVE /YX /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /I "spgrove"\
 /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /YX\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\groveoa\Debug/
CPP_SBRS=.\.

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL=mktyplib.exe
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
RSC=rc.exe
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
RSC_PROJ=/l 0x809 /fo"$(INTDIR)/groveoa.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/groveoa.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /out:"dbgbin\groveoa.dll"
# SUBTRACT LINK32 /incremental:no
LINK32_FLAGS=lib\Debug\sp133d.lib kernel32.lib user32.lib gdi32.lib\
 winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib\
 uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll\
 /incremental:yes /pdb:"$(OUTDIR)/groveoa.pdb" /debug /machine:I386\
 /def:".\groveoa\groveoa.def" /out:"dbgbin\groveoa.dll"\
 /implib:"$(OUTDIR)/groveoa.lib" 
DEF_FILE= \
	".\groveoa\groveoa.def"
LINK32_OBJS= \
	"$(INTDIR)\CGroveBuilder.obj" \
	"$(INTDIR)\GroveNode.obj" \
	"$(INTDIR)\groveoa.obj" \
	"$(INTDIR)\groveoa.res" \
	"$(INTDIR)\StdAfx.obj" \
	".\grove\Debug\grove.lib" \
	".\spgrove\Debug\spgrove.lib"

".\dbgbin\groveoa.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

################################################################################
# Begin Target

# Name "grove - Win32 Release"
# Name "grove - Win32 Debug"

!IF  "$(CFG)" == "grove - Win32 Release"

!ELSEIF  "$(CFG)" == "grove - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\grove\Node.cxx
DEP_CPP_NODE_=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\config.h"\
	".\include\macros.h"\
	

"$(INTDIR)\Node.obj" : $(SOURCE) $(DEP_CPP_NODE_) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\grove\LocNode.cxx
DEP_CPP_LOCNO=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\config.h"\
	

"$(INTDIR)\LocNode.obj" : $(SOURCE) $(DEP_CPP_LOCNO) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
# End Target
################################################################################
# Begin Target

# Name "spgrove - Win32 Release"
# Name "spgrove - Win32 Debug"

!IF  "$(CFG)" == "spgrove - Win32 Release"

!ELSEIF  "$(CFG)" == "spgrove - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\spgrove\GroveBuilder.cxx
DEP_CPP_GROVE=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CodingSystem.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\grove_inst.cxx"\
	".\spgrove\GroveBuilder.h"\
	".\spgrove\SdNode.h"\
	".\spgrove\threads.h"\
	

"$(INTDIR)\GroveBuilder.obj" : $(SOURCE) $(DEP_CPP_GROVE) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\spgrove\GroveApp.cxx
DEP_CPP_GROVEA=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\spgrove\threads.h"\
	

"$(INTDIR)\GroveApp.obj" : $(SOURCE) $(DEP_CPP_GROVEA) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Project Dependency

# Project_Dep_Name "grove"

!IF  "$(CFG)" == "spgrove - Win32 Release"

"grove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Release" 

!ELSEIF  "$(CFG)" == "spgrove - Win32 Debug"

"grove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Source File

SOURCE=.\spgrove\SdNode.cxx
DEP_CPP_SDNOD=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Location.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveBuilder.h"\
	".\spgrove\SdNode.h"\
	

"$(INTDIR)\SdNode.obj" : $(SOURCE) $(DEP_CPP_SDNOD) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
# End Target
################################################################################
# Begin Target

# Name "style - Win32 Release"
# Name "style - Win32 Debug"

!IF  "$(CFG)" == "style - Win32 Release"

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

!ENDIF 

################################################################################
# Begin Project Dependency

# Project_Dep_Name "grove"

!IF  "$(CFG)" == "style - Win32 Release"

"grove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Release" 

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

"grove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Source File

SOURCE=.\style\stylelib.cxx
DEP_CPP_STYLE=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yc"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yc"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE) \
	

"$(INTDIR)\stylelib.obj" : $(SOURCE) $(DEP_CPP_STYLE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\style.pch" : $(SOURCE) $(DEP_CPP_STYLE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yc"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yc"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\stylelib.obj" : $(SOURCE) $(DEP_CPP_STYLE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stylelib.sbr" : $(SOURCE) $(DEP_CPP_STYLE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\style.pch" : $(SOURCE) $(DEP_CPP_STYLE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\StyleEngine.cxx
DEP_CPP_STYLEE=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\StyleEngine.obj" : $(SOURCE) $(DEP_CPP_STYLEE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StyleEngine.obj" : $(SOURCE) $(DEP_CPP_STYLEE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\StyleEngine.sbr" : $(SOURCE) $(DEP_CPP_STYLEE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\Style.cxx
DEP_CPP_STYLE_=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\Style.obj" : $(SOURCE) $(DEP_CPP_STYLE_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\Style.obj" : $(SOURCE) $(DEP_CPP_STYLE_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\Style.sbr" : $(SOURCE) $(DEP_CPP_STYLE_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\ProcessingMode.cxx
DEP_CPP_PROCE=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\ProcessingMode.obj" : $(SOURCE) $(DEP_CPP_PROCE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\ProcessingMode.obj" : $(SOURCE) $(DEP_CPP_PROCE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\ProcessingMode.sbr" : $(SOURCE) $(DEP_CPP_PROCE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\ProcessContext.cxx
DEP_CPP_PROCES=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\ProcessContext.obj" : $(SOURCE) $(DEP_CPP_PROCES) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\ProcessContext.obj" : $(SOURCE) $(DEP_CPP_PROCES) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\ProcessContext.sbr" : $(SOURCE) $(DEP_CPP_PROCES) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\primitive.cxx
DEP_CPP_PRIMI=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\primitive.h"\
	".\style\primitive_inst.cxx"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\primitive.obj" : $(SOURCE) $(DEP_CPP_PRIMI) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\primitive.obj" : $(SOURCE) $(DEP_CPP_PRIMI) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\primitive.sbr" : $(SOURCE) $(DEP_CPP_PRIMI) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\NumberCache.cxx
DEP_CPP_NUMBE=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\NumberCache.obj" : $(SOURCE) $(DEP_CPP_NUMBE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\NumberCache.obj" : $(SOURCE) $(DEP_CPP_NUMBE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\NumberCache.sbr" : $(SOURCE) $(DEP_CPP_NUMBE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\InterpreterMessages.cxx
DEP_CPP_INTER=\
	".\include\Boolean.h"\
	".\include\config.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Location.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\TypeId.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\xnew.h"\
	".\style\InterpreterMessages.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# SUBTRACT CPP /YX

"$(INTDIR)\InterpreterMessages.obj" : $(SOURCE) $(DEP_CPP_INTER) "$(INTDIR)"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fo"$(INTDIR)/" /c $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# SUBTRACT CPP /YX

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\InterpreterMessages.obj" : $(SOURCE) $(DEP_CPP_INTER) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\InterpreterMessages.sbr" : $(SOURCE) $(DEP_CPP_INTER) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\Interpreter.cxx
DEP_CPP_INTERP=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\charNames.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\sdata.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\Interpreter.obj" : $(SOURCE) $(DEP_CPP_INTERP) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\Interpreter.obj" : $(SOURCE) $(DEP_CPP_INTERP) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\Interpreter.sbr" : $(SOURCE) $(DEP_CPP_INTERP) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\Insn.cxx
DEP_CPP_INSN_=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\Insn.obj" : $(SOURCE) $(DEP_CPP_INSN_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\Insn.obj" : $(SOURCE) $(DEP_CPP_INSN_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\Insn.sbr" : $(SOURCE) $(DEP_CPP_INSN_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\FOTBuilder.cxx
DEP_CPP_FOTBU=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\FOTBuilder.obj" : $(SOURCE) $(DEP_CPP_FOTBU) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\FOTBuilder.obj" : $(SOURCE) $(DEP_CPP_FOTBU) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\FOTBuilder.sbr" : $(SOURCE) $(DEP_CPP_FOTBU) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\Expression.cxx
DEP_CPP_EXPRE=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\Expression.obj" : $(SOURCE) $(DEP_CPP_EXPRE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\Expression.obj" : $(SOURCE) $(DEP_CPP_EXPRE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\Expression.sbr" : $(SOURCE) $(DEP_CPP_EXPRE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\ELObjMessageArg.cxx
DEP_CPP_ELOBJ=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\ELObjMessageArg.obj" : $(SOURCE) $(DEP_CPP_ELOBJ) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\ELObjMessageArg.obj" : $(SOURCE) $(DEP_CPP_ELOBJ) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\ELObjMessageArg.sbr" : $(SOURCE) $(DEP_CPP_ELOBJ) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\ELObj.cxx
DEP_CPP_ELOBJ_=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\ELObj.obj" : $(SOURCE) $(DEP_CPP_ELOBJ_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\ELObj.obj" : $(SOURCE) $(DEP_CPP_ELOBJ_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\ELObj.sbr" : $(SOURCE) $(DEP_CPP_ELOBJ_) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\DssslSpecEventHandler.cxx
DEP_CPP_DSSSL=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\InternalInputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\DssslSpecEventHandler.obj" : $(SOURCE) $(DEP_CPP_DSSSL) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\DssslSpecEventHandler.obj" : $(SOURCE) $(DEP_CPP_DSSSL) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\DssslSpecEventHandler.sbr" : $(SOURCE) $(DEP_CPP_DSSSL) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\Collector.cxx
DEP_CPP_COLLE=\
	".\include\Boolean.h"\
	".\include\config.h"\
	".\include\macros.h"\
	".\style\Collector.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# SUBTRACT CPP /YX

"$(INTDIR)\Collector.obj" : $(SOURCE) $(DEP_CPP_COLLE) "$(INTDIR)"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fo"$(INTDIR)/" /c $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# SUBTRACT CPP /YX

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\Collector.obj" : $(SOURCE) $(DEP_CPP_COLLE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\Collector.sbr" : $(SOURCE) $(DEP_CPP_COLLE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\FlowObj.cxx
DEP_CPP_FLOWO=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FlowObj_inst.cxx"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\FlowObj.obj" : $(SOURCE) $(DEP_CPP_FLOWO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\FlowObj.obj" : $(SOURCE) $(DEP_CPP_FLOWO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\FlowObj.sbr" : $(SOURCE) $(DEP_CPP_FLOWO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\InheritedC.cxx
DEP_CPP_INHER=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\InheritedC.obj" : $(SOURCE) $(DEP_CPP_INHER) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\InheritedC.obj" : $(SOURCE) $(DEP_CPP_INHER) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\InheritedC.sbr" : $(SOURCE) $(DEP_CPP_INHER) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\style_inst.cxx
DEP_CPP_STYLE_I=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\style_inst.obj" : $(SOURCE) $(DEP_CPP_STYLE_I) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\style_inst.obj" : $(SOURCE) $(DEP_CPP_STYLE_I) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\style_inst.sbr" : $(SOURCE) $(DEP_CPP_STYLE_I) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\common_inst.cxx
DEP_CPP_COMMO=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\common_inst.obj" : $(SOURCE) $(DEP_CPP_COMMO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\common_inst.obj" : $(SOURCE) $(DEP_CPP_COMMO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\common_inst.sbr" : $(SOURCE) $(DEP_CPP_COMMO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\InterpreterMessages.msg

!IF  "$(CFG)" == "style - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\style_inst.m4

!IF  "$(CFG)" == "style - Win32 Release"

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\FlowObj_inst.m4

!IF  "$(CFG)" == "style - Win32 Release"

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\common_inst.m4

!IF  "$(CFG)" == "style - Win32 Release"

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\GroveManager.cxx
DEP_CPP_GROVEM=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\GroveManager.obj" : $(SOURCE) $(DEP_CPP_GROVEM) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\GroveManager.obj" : $(SOURCE) $(DEP_CPP_GROVEM) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\GroveManager.sbr" : $(SOURCE) $(DEP_CPP_GROVEM) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\DssslApp.cxx
DEP_CPP_DSSSLA=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\sptchar.h"\
	".\include\StorageManager.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\spgrove\SdNode.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslAppMessages.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\jade_version.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\DssslApp.obj" : $(SOURCE) $(DEP_CPP_DSSSLA) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\DssslApp.obj" : $(SOURCE) $(DEP_CPP_DSSSLA) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\DssslApp.sbr" : $(SOURCE) $(DEP_CPP_DSSSLA) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Project Dependency

# Project_Dep_Name "spgrove"

!IF  "$(CFG)" == "style - Win32 Release"

"spgrove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="spgrove - Win32 Release" 

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

"spgrove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="spgrove - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Source File

SOURCE=.\style\jade_version.h

!IF  "$(CFG)" == "style - Win32 Release"

!ELSEIF  "$(CFG)" == "style - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\Pattern.cxx
DEP_CPP_PATTE=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\Pattern.obj" : $(SOURCE) $(DEP_CPP_PATTE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\Pattern.obj" : $(SOURCE) $(DEP_CPP_PATTE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\Pattern.sbr" : $(SOURCE) $(DEP_CPP_PATTE) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\MacroFlowObj.cxx
DEP_CPP_MACRO=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\MacroFlowObj.obj" : $(SOURCE) $(DEP_CPP_MACRO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\MacroFlowObj.obj" : $(SOURCE) $(DEP_CPP_MACRO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\MacroFlowObj.sbr" : $(SOURCE) $(DEP_CPP_MACRO) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\style\SchemeParser.cxx
DEP_CPP_SCHEM=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\ArcEngine.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\Collector.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\DssslSpecEventHandler.h"\
	".\style\ELObj.h"\
	".\style\ELObjMessageArg.h"\
	".\style\EvalContext.h"\
	".\style\Expression.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	".\style\Insn.h"\
	".\style\Insn2.h"\
	".\style\Interpreter.h"\
	".\style\InterpreterMessages.h"\
	".\style\MacroFlowObj.h"\
	".\style\NumberCache.h"\
	".\style\Pattern.h"\
	".\style\ProcessContext.h"\
	".\style\ProcessingMode.h"\
	".\style\SchemeParser.h"\
	".\style\SosofoObj.h"\
	".\style\Style.h"\
	".\style\style_pch.h"\
	".\style\StyleEngine.h"\
	".\style\stylelib.h"\
	".\style\VM.h"\
	

!IF  "$(CFG)" == "style - Win32 Release"

# ADD CPP /Yu"stylelib.h"

"$(INTDIR)\SchemeParser.obj" : $(SOURCE) $(DEP_CPP_SCHEM) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "spgrove" /I "grove" /I "include" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h" /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "style - Win32 Debug"

# ADD CPP /Yu"stylelib.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "spgrove" /I "grove" /I "include" /D\
 "_DEBUG" /D "WIN32" /D "_WINDOWS" /D DSSSL_NAMESPACE=James_Clark_DSSSL /D\
 SP_NAMESPACE=James_Clark_SP /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /FR"$(INTDIR)/" /Fp"$(INTDIR)/style.pch" /Yu"stylelib.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\SchemeParser.obj" : $(SOURCE) $(DEP_CPP_SCHEM) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

"$(INTDIR)\SchemeParser.sbr" : $(SOURCE) $(DEP_CPP_SCHEM) "$(INTDIR)"\
 "$(INTDIR)\style.pch"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
################################################################################
# Begin Target

# Name "jade - Win32 Release"
# Name "jade - Win32 Debug"

!IF  "$(CFG)" == "jade - Win32 Release"

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\jade\SgmlFOTBuilder.cxx
DEP_CPP_SGMLF=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\CodingSystem.h"\
	".\include\config.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\ExternalId.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\macros.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\xnew.h"\
	".\jade\SgmlFOTBuilder.h"\
	".\style\dsssl_ns.h"\
	".\style\FOTBuilder.h"\
	

"$(INTDIR)\SgmlFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_SGMLF) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\RtfFOTBuilder.cxx
DEP_CPP_RTFFO=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetInfo.h"\
	".\include\CharsetRegistry.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityManager.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\InputSource.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\macros.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\OutputByteStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StorageManager.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\jade\RtfFOTBuilder.h"\
	".\jade\RtfFOTBuilder_inst.cxx"\
	".\jade\RtfMessages.h"\
	".\jade\RtfOle.h"\
	".\jade\TmpOutputByteStream.h"\
	".\style\dsssl_ns.h"\
	".\style\FOTBuilder.h"\
	

"$(INTDIR)\RtfFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_RTFFO) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\jade.cxx
DEP_CPP_JADE_=\
	".\grove\Node.h"\
	".\include\Allocator.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityApp.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrnoMessageArg.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\macros.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserApp.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\sptchar.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\jade\HtmlFOTBuilder.h"\
	".\jade\JadeMessages.h"\
	".\jade\MifFOTBuilder.h"\
	".\jade\RtfFOTBuilder.h"\
	".\jade\SgmlFOTBuilder.h"\
	".\jade\TeXFOTBuilder.h"\
	".\jade\TransformFOTBuilder.h"\
	".\spgrove\GroveApp.h"\
	".\spgrove\GroveBuilder.h"\
	".\style\dsssl_ns.h"\
	".\style\DssslApp.h"\
	".\style\FOTBuilder.h"\
	".\style\GroveManager.h"\
	

!IF  "$(CFG)" == "jade - Win32 Release"

# ADD CPP /D "JADE_MIF"

"$(INTDIR)\jade.obj" : $(SOURCE) $(DEP_CPP_JADE_) "$(INTDIR)"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "include" /I "style" /I "grove" /I\
 "spgrove" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP\
 /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /D "JADE_MIF" /Fp"$(INTDIR)/jade.pch" /YX /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# ADD CPP /D "JADE_MIF"

"$(INTDIR)\jade.obj" : $(SOURCE) $(DEP_CPP_JADE_) "$(INTDIR)"
   $(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "include" /I "style" /I "grove" /I\
 "spgrove" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP\
 /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /D "JADE_MIF" /Fp"$(INTDIR)/jade.pch" /YX /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\HtmlFOTBuilder.cxx
DEP_CPP_HTMLF=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\ErrnoMessageArg.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\IListIter.h"\
	".\include\IListIterBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\macros.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\xnew.h"\
	".\jade\HtmlFOTBuilder.h"\
	".\jade\HtmlFOTBuilder_inst.cxx"\
	".\jade\HtmlMessages.h"\
	".\style\dsssl_ns.h"\
	".\style\FOTBuilder.h"\
	

"$(INTDIR)\HtmlFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_HTMLF) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\HtmlFOTBuilder_inst.m4

!IF  "$(CFG)" == "jade - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\jade.rc
DEP_RSC_JADE_R=\
	".\jade\HtmlMessages.rc"\
	".\jade\JadeMessages.rc"\
	".\jade\RtfMessages.rc"\
	".\jade\TeXMessages.rc"\
	".\style\DssslAppMessages.rc"\
	".\style\InterpreterMessages.rc"\
	

!IF  "$(CFG)" == "jade - Win32 Release"

# ADD BASE RSC /l 0x809 /i "jade"
# ADD RSC /l 0x809 /i "jade" /i "style" /d "JADE_MIF"

"$(INTDIR)\jade.res" : $(SOURCE) $(DEP_RSC_JADE_R) "$(INTDIR)"
   $(RSC) /l 0x809 /fo"$(INTDIR)/jade.res" /i "jade" /i "style" /d "NDEBUG" /d\
 "JADE_MIF" $(SOURCE)


!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# ADD BASE RSC /l 0x809 /i "jade"
# ADD RSC /l 0x809 /i "jade" /i "style" /d "JADE_MIF"

"$(INTDIR)\jade.res" : $(SOURCE) $(DEP_RSC_JADE_R) "$(INTDIR)"
   $(RSC) /l 0x809 /fo"$(INTDIR)/jade.res" /i "jade" /i "style" /d "_DEBUG" /d\
 "JADE_MIF" $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\JadeMessages.msg

!IF  "$(CFG)" == "jade - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\HtmlMessages.msg

!IF  "$(CFG)" == "jade - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\RtfFOTBuilder_inst.m4

!IF  "$(CFG)" == "jade - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\TeXFOTBuilder.cxx
DEP_CPP_TEXFO=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\config.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\ExternalId.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\OutputByteStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\xnew.h"\
	".\jade\TeXFOTBuilder.h"\
	".\jade\TeXFOTBuilder_inst.cxx"\
	".\jade\TeXMessages.h"\
	".\jade\TmpOutputByteStream.h"\
	".\style\dsssl_ns.h"\
	".\style\FOTBuilder.h"\
	

"$(INTDIR)\TeXFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_TEXFO) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Project Dependency

# Project_Dep_Name "grove"

!IF  "$(CFG)" == "jade - Win32 Release"

"grove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Release" 

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

"grove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Project Dependency

# Project_Dep_Name "spgrove"

!IF  "$(CFG)" == "jade - Win32 Release"

"spgrove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="spgrove - Win32 Release" 

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

"spgrove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="spgrove - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Source File

SOURCE=.\jade\RtfMessages.msg

!IF  "$(CFG)" == "jade - Win32 Release"

# PROP Exclude_From_Build 1

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# PROP Exclude_From_Build 1

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\TransformFOTBuilder.cxx
DEP_CPP_TRANS=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\ErrnoMessageArg.h"\
	".\include\ExternalId.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\xnew.h"\
	".\jade\TransformFOTBuilder.h"\
	".\jade\TransformFOTBuilder_inst.cxx"\
	".\style\dsssl_ns.h"\
	".\style\FOTBuilder.h"\
	

"$(INTDIR)\TransformFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_TRANS) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\dsssl\fot.dtd

!IF  "$(CFG)" == "jade - Win32 Release"

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\TransformFOTBuilder_inst.m4

!IF  "$(CFG)" == "jade - Win32 Release"

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\RtfOle.cxx
DEP_CPP_RTFOL=\
	".\include\Boolean.h"\
	".\include\config.h"\
	".\include\OutputByteStream.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\jade\RtfOle.h"\
	".\style\dsssl_ns.h"\
	

"$(INTDIR)\RtfOle.obj" : $(SOURCE) $(DEP_CPP_RTFOL) "$(INTDIR)"
   $(CPP) $(CPP_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Project Dependency

# Project_Dep_Name "style"

!IF  "$(CFG)" == "jade - Win32 Release"

"style - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="style - Win32 Release" 

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

"style - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="style - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Source File

SOURCE=.\jade\MifFOTBuilder.cxx
DEP_CPP_MIFFO=\
	".\grove\Node.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetInfo.h"\
	".\include\CmdLineApp.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityManager.h"\
	".\include\ErrnoMessageArg.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\IList.h"\
	".\include\IListBase.h"\
	".\include\InputSource.h"\
	".\include\IQueue.cxx"\
	".\include\IQueue.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageReporter.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StorageManager.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\jade\MifFOTBuilder.h"\
	".\jade\MifFOTBuilder_inst.cxx"\
	".\jade\MifMessages.h"\
	".\jade\TmpOutputByteStream.h"\
	".\style\dsssl_ns.h"\
	".\style\FOTBuilder.h"\
	

!IF  "$(CFG)" == "jade - Win32 Release"

# ADD CPP /D "JADE_MIF"

"$(INTDIR)\MifFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_MIFFO) "$(INTDIR)"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "include" /I "style" /I "grove" /I\
 "spgrove" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP\
 /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /D "JADE_MIF" /Fp"$(INTDIR)/jade.pch" /YX /Fo"$(INTDIR)/" /c\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

# ADD CPP /D "JADE_MIF"

"$(INTDIR)\MifFOTBuilder.obj" : $(SOURCE) $(DEP_CPP_MIFFO) "$(INTDIR)"
   $(CPP) /nologo /MDd /W3 /GX /Zi /Od /I "include" /I "style" /I "grove" /I\
 "spgrove" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D SP_NAMESPACE=James_Clark_SP\
 /D DSSSL_NAMESPACE=James_Clark_DSSSL /D GROVE_NAMESPACE=James_Clark_GROVE /D\
 "SP_MULTI_BYTE" /D "JADE_MIF" /Fp"$(INTDIR)/jade.pch" /YX /Fo"$(INTDIR)/"\
 /Fd"$(INTDIR)/" /c $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\MifFOTBuilder_inst.m4

!IF  "$(CFG)" == "jade - Win32 Release"

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\jade\TeXFOTBuilder_inst.m4

!IF  "$(CFG)" == "jade - Win32 Release"

!ELSEIF  "$(CFG)" == "jade - Win32 Debug"

!ENDIF 

# End Source File
# End Target
################################################################################
# Begin Target

# Name "jadedist - Win32 Release"

!IF  "$(CFG)" == "jadedist - Win32 Release"

".\jadedist\jade.zip" : 
   CD jadedist
   makedist

!ENDIF 

################################################################################
# Begin Project Dependency

# Project_Dep_Name "jade"

!IF  "$(CFG)" == "jadedist - Win32 Release"

"jade - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="jade - Win32 Release" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Source File

SOURCE=".\jadedist\bin-files.txt"
# End Source File
################################################################################
# Begin Source File

SOURCE=.\jadedist\files.txt
# End Source File
################################################################################
# Begin Source File

SOURCE=.\jadedist\makedist.bat
# End Source File
# End Target
################################################################################
# Begin Target

# Name "groveoa - Win32 Release"
# Name "groveoa - Win32 Debug"

!IF  "$(CFG)" == "groveoa - Win32 Release"

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\groveoa\GroveNode.cxx
DEP_CPP_GROVEN=\
	".\grove\LocNode.h"\
	".\grove\Node.h"\
	".\groveoa\GroveNode.h"\
	".\groveoa\groveoa.h"\
	".\groveoa\StdAfx.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetInfo.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityManager.h"\
	".\include\ExtendEntityManager.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Location.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\OutputByteStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\StorageManager.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\xnew.h"\
	

!IF  "$(CFG)" == "groveoa - Win32 Release"

# ADD CPP /Yu"stdafx.h"

"$(INTDIR)\GroveNode.obj" : $(SOURCE) $(DEP_CPP_GROVEN) "$(INTDIR)"\
 "$(INTDIR)\groveoa.pch" ".\groveoa\groveoa.h"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "include" /I "grove" /I "spgrove" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /c $(SOURCE)


!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

# ADD CPP /Yu"stdafx.h"

"$(INTDIR)\GroveNode.obj" : $(SOURCE) $(DEP_CPP_GROVEN) "$(INTDIR)"\
 ".\groveoa\groveoa.h" "$(INTDIR)\groveoa.pch"
   $(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /I "spgrove"\
 /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\groveoa\groveoa.cxx
DEP_CPP_GROVEO=\
	".\groveoa\CGroveBuilder.h"\
	".\groveoa\groveoa.h"\
	".\groveoa\groveoa_i.c"\
	".\groveoa\StdAfx.h"\
	".\include\Allocator.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\WinApp.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	

!IF  "$(CFG)" == "groveoa - Win32 Release"

# ADD CPP /Yu"stdafx.h"

"$(INTDIR)\groveoa.obj" : $(SOURCE) $(DEP_CPP_GROVEO) "$(INTDIR)"\
 "$(INTDIR)\groveoa.pch" ".\groveoa\groveoa.h" ".\groveoa\groveoa_i.c"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "include" /I "grove" /I "spgrove" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /c $(SOURCE)


!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

# ADD CPP /Yu"stdafx.h"

"$(INTDIR)\groveoa.obj" : $(SOURCE) $(DEP_CPP_GROVEO) "$(INTDIR)"\
 ".\groveoa\groveoa.h" ".\groveoa\groveoa_i.c" "$(INTDIR)\groveoa.pch"
   $(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /I "spgrove"\
 /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\groveoa\groveoa.rc
DEP_RSC_GROVEOA=\
	".\groveoa\GroveBuilder.rgs"\
	".\groveoa\groveoa.tlb"\
	

!IF  "$(CFG)" == "groveoa - Win32 Release"


"$(INTDIR)\groveoa.res" : $(SOURCE) $(DEP_RSC_GROVEOA) "$(INTDIR)"\
 ".\groveoa\groveoa.tlb"
   $(RSC) /l 0x809 /fo"$(INTDIR)/groveoa.res" /i "groveoa" /d "NDEBUG"\
 $(SOURCE)


!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"


"$(INTDIR)\groveoa.res" : $(SOURCE) $(DEP_RSC_GROVEOA) "$(INTDIR)"\
 ".\groveoa\groveoa.tlb"
   $(RSC) /l 0x809 /fo"$(INTDIR)/groveoa.res" /i "groveoa" /d "_DEBUG"\
 $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\groveoa\StdAfx.cxx
DEP_CPP_STDAF=\
	".\groveoa\StdAfx.h"\
	

!IF  "$(CFG)" == "groveoa - Win32 Release"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /O2 /I "include" /I "grove" /I "spgrove" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\groveoa.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /I "spgrove"\
 /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yc"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\groveoa.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\groveoa\CGroveBuilder.cxx
DEP_CPP_CGROV=\
	".\grove\Node.h"\
	".\groveoa\CGroveBuilder.h"\
	".\groveoa\GroveNode.h"\
	".\groveoa\groveoa.h"\
	".\groveoa\StdAfx.h"\
	".\include\Allocator.h"\
	".\include\Attribute.h"\
	".\include\Attributed.h"\
	".\include\Boolean.h"\
	".\include\CharMap.cxx"\
	".\include\CharMap.h"\
	".\include\CharsetDecl.h"\
	".\include\CharsetInfo.h"\
	".\include\CodingSystem.h"\
	".\include\CodingSystemKit.h"\
	".\include\config.h"\
	".\include\constant.h"\
	".\include\ContentToken.h"\
	".\include\CopyOwner.cxx"\
	".\include\CopyOwner.h"\
	".\include\Dtd.h"\
	".\include\ElementType.h"\
	".\include\Entity.h"\
	".\include\EntityCatalog.h"\
	".\include\EntityDecl.h"\
	".\include\EntityManager.h"\
	".\include\ErrorCountEventHandler.h"\
	".\include\Event.h"\
	".\include\EventsWanted.h"\
	".\include\ExternalId.h"\
	".\include\Hash.h"\
	".\include\HashTable.cxx"\
	".\include\HashTable.h"\
	".\include\HashTableItemBase.cxx"\
	".\include\HashTableItemBase.h"\
	".\include\ISet.cxx"\
	".\include\ISet.h"\
	".\include\Link.h"\
	".\include\Location.h"\
	".\include\Lpd.h"\
	".\include\Markup.h"\
	".\include\Message.h"\
	".\include\MessageArg.h"\
	".\include\MessageBuilder.h"\
	".\include\MessageFormatter.h"\
	".\include\MessageTable.h"\
	".\include\Mode.h"\
	".\include\Named.h"\
	".\include\NamedResource.h"\
	".\include\NamedResourceTable.h"\
	".\include\NamedTable.h"\
	".\include\NCVector.h"\
	".\include\Notation.h"\
	".\include\OutputByteStream.h"\
	".\include\OutputCharStream.h"\
	".\include\Owner.cxx"\
	".\include\Owner.h"\
	".\include\OwnerTable.cxx"\
	".\include\OwnerTable.h"\
	".\include\ParserOptions.h"\
	".\include\PointerTable.cxx"\
	".\include\PointerTable.h"\
	".\include\Ptr.cxx"\
	".\include\Ptr.h"\
	".\include\RangeMap.cxx"\
	".\include\RangeMap.h"\
	".\include\Resource.h"\
	".\include\rtti.h"\
	".\include\Sd.h"\
	".\include\SdText.h"\
	".\include\SgmlParser.h"\
	".\include\ShortReferenceMap.h"\
	".\include\sptchar.h"\
	".\include\StringC.h"\
	".\include\StringOf.cxx"\
	".\include\StringOf.h"\
	".\include\StringResource.h"\
	".\include\SubstTable.cxx"\
	".\include\SubstTable.h"\
	".\include\Syntax.h"\
	".\include\Text.h"\
	".\include\TypeId.h"\
	".\include\UnivCharsetDesc.h"\
	".\include\Vector.cxx"\
	".\include\Vector.h"\
	".\include\WinApp.h"\
	".\include\XcharMap.cxx"\
	".\include\XcharMap.h"\
	".\include\xnew.h"\
	".\spgrove\GroveBuilder.h"\
	

!IF  "$(CFG)" == "groveoa - Win32 Release"

# ADD CPP /Yu"stdafx.h"

"$(INTDIR)\CGroveBuilder.obj" : $(SOURCE) $(DEP_CPP_CGROV) "$(INTDIR)"\
 "$(INTDIR)\groveoa.pch" ".\groveoa\groveoa.h"
   $(CPP) /nologo /MD /W3 /GX /O2 /I "include" /I "grove" /I "spgrove" /D\
 "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /c $(SOURCE)


!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

# ADD CPP /Yu"stdafx.h"

"$(INTDIR)\CGroveBuilder.obj" : $(SOURCE) $(DEP_CPP_CGROV) "$(INTDIR)"\
 ".\groveoa\groveoa.h" "$(INTDIR)\groveoa.pch"
   $(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /I "include" /I "grove" /I "spgrove"\
 /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_ATL_STATIC_REGISTRY" /D\
 "_WINDLL" /D SP_NAMESPACE=James_Clark_SP /D "SP_MULTI_BYTE" /D\
 GROVE_NAMESPACE=James_Clark_GROVE /Fp"$(INTDIR)/groveoa.pch" /Yu"stdafx.h"\
 /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c $(SOURCE)


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\groveoa\groveoa.def

!IF  "$(CFG)" == "groveoa - Win32 Release"

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\groveoa\groveoa.idl

!IF  "$(CFG)" == "groveoa - Win32 Release"

# Begin Custom Build
InputDir=".\groveoa"
InputPath=.\groveoa\groveoa.idl

BuildCmds= \
	midl /Oicf /h $(InputDir)\groveoa.h /iid $(InputDir)\groveoa_i.c /proxy\
                                    $(InputDir)\groveoa_p.c /tlb $(InputDir)\groveoa.tlb $(InputPath) \
	

"$(InputDir)\groveoa.tlb" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\groveoa.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\groveoa_i.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

# Begin Custom Build
InputDir=".\groveoa"
InputPath=.\groveoa\groveoa.idl

BuildCmds= \
	midl /Oicf /h $(InputDir)\groveoa.h /iid $(InputDir)\groveoa_i.c /proxy\
                                    $(InputDir)\groveoa_p.c /tlb $(InputDir)\groveoa.tlb $(InputPath) \
	

"$(InputDir)\groveoa.tlb" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\groveoa.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(InputDir)\groveoa_i.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
################################################################################
# Begin Project Dependency

# Project_Dep_Name "grove"

!IF  "$(CFG)" == "groveoa - Win32 Release"

"grove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Release" 

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

"grove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="grove - Win32 Debug" 

!ENDIF 

# End Project Dependency
################################################################################
# Begin Project Dependency

# Project_Dep_Name "spgrove"

!IF  "$(CFG)" == "groveoa - Win32 Release"

"spgrove - Win32 Release" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="spgrove - Win32 Release" 

!ELSEIF  "$(CFG)" == "groveoa - Win32 Debug"

"spgrove - Win32 Debug" : 
   $(MAKE) /$(MAKEFLAGS) /F ".\jade.mak" CFG="spgrove - Win32 Debug" 

!ENDIF 

# End Project Dependency
# End Target
# End Project
################################################################################
