@echo off
title adb�򿪵��Զ˿ڲ������ֻ�
rem 0��������ɫ��B��������ɫ
color 0B
rem �ı䴰���С���룺mode con cols=115 lines=40
echo.
echo 1������ǵ�һ�����ӣ�������USB���������ӵ��ԣ������ֻ�������ѡ�USB����ѡ���� ������硱ģʽ������ADB���� ����Ҳ��
echo 2����һ�����ӳɹ��󣬾��ܰγ�USB�������ˣ����涼����ҪUSB����������
echo 3��������ʧ��ʱ���ֻ�������ػ�������Ҫ����ʹ��USB���������ӡ�
echo 4������ֻ�IP���Ĺ������ڡ����ӹ����ֻ�IP.txt���ļ�����IP
echo.
rem ���������ӳ٣�һ������ѭ���ڻ���if����ڲ����õı���
setlocal enabledelayedexpansion
echo �����ӵ��豸�б�
adb devices
echo.
rem IP�ļ�
set ipPath=1.���ӹ����ֻ�IP_2.txt
if exist %ipPath% (
  rem echo ���ڸ��ļ�
  goto Re
) else (
  rem echo  �����ڸ��ļ�
  rem ���ɡ�1.���ӹ����ֻ�IP.txt���ļ�
  echo 2> %ipPath%
  goto Con
)

:Re
set ipStr=""
rem ��ȡ ��%ipPath%���ļ�
echo ���ڶ�ȡ��%ipPath%���ļ���
for /f "tokens=* delims=" %%i in (%ipPath%) do (
 set "ipStr=%%i"
 
)

echo  IPΪ��%ipStr% 

:Con
echo.
rem echo ���ڶϿ��������ӣ�
rem adb disconnect 
echo.
rem echo ���ڿ����ֻ����Զ˿ڣ�
rem adb tcpip 5555
echo.

if %ipStr% EQU "" (
   rem echo IPΪ��	
   goto In
) else (
  rem echo IP��Ϊ��
  echo ���������ֻ���ֻ����connected to xxx��ʾ���ӳɹ�������ʧ�ܣ���
  adb connect %ipStr% 
  goto En
)


:In
set /p var=������Ҫ���ӵ��ֻ���IP��
echo ���������ֻ�%var%��ֻ����connected to xxx��ʾ���ӳɹ�������ʧ�ܣ���
adb connect %var%
echo %var%>.\%ipPath%


:En
echo.
echo �����ӵ��豸�б�
adb devices
echo.

echo ���ӳɹ����Ȳ�Ҫ�����رմ˴��ڣ�ʹ��AS��HBuilder������һ�²Źرգ���Ȼadb���̻ᱻ�رյ�
echo.
rem pause
cmd