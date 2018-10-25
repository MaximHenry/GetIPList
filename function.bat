set dnsserver=YourDNS-Server

set ip=
set mac= 
set dnsname=

set dd=
set mm=
set yy=

set ip=%1%2

ping -n 1 -w 1000 %ip%

If not "(%errorlevel%)" == "(0)" goto :end

for /f "tokens=2" %%i in ('"arp -a | findstr %ip%"') do set mac=%%i

for /f "skip=3 tokens=2 eol=A" %%i in ('nslookup %ip% %dnsserver%') do set dnsname=%%i

for /f "tokens= 1,2,3 delims=." %%a in ('echo %date%') do set dd=%%a& set mm=%%b& set yy=%%c

set revdate=%yy%.%mm%.%dd%

rem echo %ip%,%mac%,%dnsname%,%revdate% >> %cd%\Lists\iplist_%date%.csv

echo %ip%,%mac%,%dnsname%,%revdate% > %cd%\Lists\%ip%.txt

:end

