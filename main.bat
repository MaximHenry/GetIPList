echo Start %date% %time% > scriptruntime.txt

for /f "eol=;" %%a in (subnetlist.txt) do for /l %%b in (1,1,254) do call function.bat %%a %%b

echo End %date% %time% >> scriptruntime.txt

