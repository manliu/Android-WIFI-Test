@echo off
title adb�����ֻ�����
rem 0��������ɫ��B��������ɫ
color 0B
rem �ı䴰���С���룺mode con cols=115 lines=40
echo.
echo �����ӵ��豸�б�
adb devices
set /p var=������Ҫ���ӵ��ֻ���IP��
adb connect %var%
echo.
echo %var% >.\1.���ӹ����ֻ�IP
echo �����ӵ��豸�б�
adb devices
pause