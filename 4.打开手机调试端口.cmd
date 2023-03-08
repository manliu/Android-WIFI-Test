@echo off
title adb开启手机调试端口
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
echo.
echo 请先用USB数据线连接电脑，并打开手机开发者选项，USB调试选项，最好 “仅充电”模式下允许ADB调试 设置也打开
echo.
echo 已连接的设备列表：
adb devices
echo 正在开启手机调试端口：
adb tcpip 5555
echo.
echo 1、如果出现“restarting in TCP mode port: 5555”，则表示成功开启手机调试端口
echo.
echo 2、如果出现 “error: device not found”开启失败，表示还没有设备连接到电脑，请检查有没有用USB数据线连接电脑
echo.
echo 3、如果出现“error: more than one device and emulator”开启失败，是电脑连接了多个设备，请复制粘贴上面需要开启的设备
echo.
set /p var=开启的调试端口的设备名 （如果连接成功后不需再操作）：
adb -s %var% tcpip 5555
echo.
rem pause是让窗口执行命令完继续显示，如果，不需要继续显示窗口，将pause去掉，运行脚本会闪一下
pause