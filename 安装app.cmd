@echo off
title adb��װapp
rem 0��������ɫ��B��������ɫ
color 0B
rem �ı䴰���С���룺mode con cols=115 lines=40
setlocal enabledelayedexpansion
echo.
echo �����ӵ��豸�б�
adb devices
:A
echo �뽫apk�ļ��ϵ�����ٵ�����ڣ��ٰ�����Enter����װ������������˶���豸�����ȸ���ճ���豸����
set /p var=��װapk/����ճ���豸����
set a=.apk
echo %var%| findstr  %a%>nul && (
   rem ����apk��������װ
   goto I
) || (
    rem ������apk
    goto B
)

:I
echo.
echo ���ڰ�װapk������Success��ʾ��װ�ɹ�����װʱ��ȡ�������绷�������ʱ��̫������Ctrl + C������ȡ����װ
adb install %var%
echo.
goto A

:B
echo.
set /p var2=��װapk���豸%var%��
echo.
echo %var%
echo ���ڰ�װapk������Success��ʾ��װ�ɹ�����װʱ��ȡ�������绷�������ʱ��̫������Ctrl + C������ȡ����װ
adb -s %var%  install %var2%
rem goto B
echo.
pause