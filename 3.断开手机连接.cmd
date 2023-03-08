@echo off
title adb断开手机连接
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
echo.
echo 已连接设备列表
adb devices
echo 正在断开连接
adb disconnect 
pause