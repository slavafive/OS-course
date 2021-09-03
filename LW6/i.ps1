md C:\LAB6
systeminfo | findstr "\<OS" | findstr "Version" > OS_Version.txt
systeminfo | findstr "Available" | findstr "Page" > memory.txt
systeminfo | findstr "In Use" >> memory.txt
wmic logical disk get name | find /v "Name" > HardDiscs.txt
md TEST
xcopy C:\LAB6\1 C:\LAB6\1\TEST
copy HardDiscs.txt+memory.txt+OS_Version.txt all.txt
del HardDiscs.txt memory.txt OS_Version.txt


