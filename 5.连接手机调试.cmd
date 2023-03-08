@echo off
title adb连接手机调试
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
echo.
echo 已连接的设备列表：
adb devices
set /p var=请输入要连接的手机的IP：
adb connect %var%
echo.
echo %var% >.\1.连接过的手机IP
echo 已连接的设备列表：
adb devices
pause