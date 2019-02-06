@echo off
rem -- ###このファイルを置いた場所にフォルダを作ってその中にシステム情報を収集します
rem -- ###windows 10,
rem -- ###

set rslt_YMD=%DATE:~-10,4%%DATE:~-5,2%%DATE:~-2%
rem -- set rslt_date=%DATE:~-10,4%%DATE:~-5,2%%DATE:~-2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

mkdir "%cd%\getinfo_result_%computername%_%rslt_YMD%"
set rslt_dir=%cd%\getinfo_result_%computername%_%rslt_YMD%

rem -- ==============================================================================
cd %rslt_dir%

copy "%windir%\system32\drivers\etc\hosts" "hosts.txt"
sc query 	>sc_query_active.txt
sc query state= inactive >sc_query_inactive.txt
route print 	>route_print.txt
systeminfo 	>systeminfo.txt
ipconfig /all 	>ipconfig_all.txt
echo list volume | diskpart 	>>diskpart.txt
dir c:\ /B >dir_c.txt
echo ================================== >>dir_c.txt
rem -- tree c:\ >>dir_c.txt

net user >LocalUser.txt
net localgroup >LocalGroup.txt

driverquery >driverquery.txt
powercfg /devicequery all_devices >powercfg_devicequery.txt


w32tm /query /status 	>w32tm_status.txt
echo ==================================	>>w32tm_status.txt
w32tm /query /configuration 	>>w32tm_status.txt

netsh firewall show config verbose = ENABLE >firewall_conf.txt

rem -- option (重い）
rem -- msinfo32.exe /nfo "msinfo32.nfo"
rem -- dism /online /get-packages > KBLIST.txt





