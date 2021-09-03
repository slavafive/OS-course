net start | findstr /v "completed" > c:\lab6\3\services.txt
copy con stop.bat
@echo off
sc stop dnscache
timeout /t 10
net start | findstr /V "completed" > c:\LAB6\3\newservices.txt
c:\lab6\3\find.bat
^Z
copy con find.bat
@echo off
SetLocal EnableDelayedExpansion
for /F "delims=" %%i in (C:\LAB6\3\services.txt) do (
set a=0
for /F "delims=" %%j in (C:\LAB6\3\newservices.txt) do (if %%i==%%j set a=1)
if !a!==0 (set b=%%i && echo.!b:~3! >> different.txt)
)
^Z
copy con start.bat
@echo off
for /F "delims=" %%i in (c:\LAB6\3\different.txt) do (
net start "%%i"
)
^Z
stop.bat
start.bat

