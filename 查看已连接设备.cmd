@echo off
title adb测试是否配置adb环境
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
echo.
echo 查看已连接设备
echo.
adb devices
echo.
pause