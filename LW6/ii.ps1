echo %computername%
copy con copy.bat
forfiles /p c:\cd /c "cmd /c if @fsize LSS 2097152 (attrib -a @file) else (attrib +a @file)" 
xcopy /a /Z c:\CD \\%computername%\temp
^Z
schtasks /create /SC MINUTE /TN "CopyTask" /TR "C:\LAB6\2\copy.bat"
taskkill /F /IM cmd.exe /T
FC /B c:\CD\wireshark-win32-1.2.6.exe \\%computername%\temp\wireshark-win32-1.2.6.exe
schtasks /run /TN "CopyTask"


