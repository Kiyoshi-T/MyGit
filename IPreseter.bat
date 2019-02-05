@echo off

set IFNAME="���[�J�� �G���A�ڑ� 16"
rem -- set IFNAME="�C�[�T�l�b�g"

set IPADDR=192.168.10.123
set MASK=255.255.252.0
set GW=0.0.0.0
set DNS1=192.168.10.11
set DNS2=192.168.10.12

echo [1] : DHCP�ݒ�Ƀ��Z�b�g�I�I
echo [2] : set Static IP address 
echo [3] : �����񂾂� (�L�E�ցE)
echo  ---
set /p NUM="�ǂ����邩�I�Ԃ��悢--->"
if "%NUM%"=="1" goto dhcp
if "%NUM%"=="2" goto ipconf
if "%NUM%"=="3" goto end

:dhcp
netsh interface ipv4 set address name=%IFNAME% dhcp
netsh interface ipv4 set dnsservers name=%IFNAME% dhcp
goto end

:ipconf
netsh interface ipv4 set address name=%IFNAME% static %IPADDR% %MASK% %GW% 1
netsh interface ipv4 set dnsservers name=%IFNAME% static %DNS1% primary validate=no
netsh interface ipv4 add dnsservers name=%IFNAME% %DNS2% index=2 validate=no
goto end

:end
