@echo off

set LIB_PATH=./lib
set ARGS=%*

set WSC_CLASSPATH=.

for %%j in (%LIB_PATH%/*.jar) do (call  set-classpath.bat %LIB_PATH%/%%j )

:checkConfigFile
if not ""%1"" == """" goto checkLogFile
set ARGS=%ARGS% ./config/sfrm-status/sfrm-request.xml

:checkLogFile
if not ""%2"" == """" goto execCmd
set ARGS=%ARGS% ./logs/sfrm-status.log

:execCmd
@echo on

java -cp "%WSC_CLASSPATH%" hk.hku.cecid.corvus.ws.SFRMStatusQuerySender %ARGS%

PAUSE

