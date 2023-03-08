@echo off
title adb安装app
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
setlocal enabledelayedexpansion
echo.
echo 已连接的设备列表：
adb devices
:A
echo 请将apk文件拖到这里，再点击窗口，再按两下Enter键安装（如果是连接了多个设备，请先复制粘贴设备名）
set /p var=安装apk/复制粘贴设备名：
set a=.apk
echo %var%| findstr  %a%>nul && (
   rem 包含apk，跳到安装
   goto I
) || (
    rem 不包含apk
    goto B
)

:I
echo.
echo 正在安装apk，出现Success表示安装成功，安装时间取决于网络环境，如果时间太长，按Ctrl + C键可以取消安装
adb install %var%
echo.
goto A

:B
echo.
set /p var2=安装apk到设备%var%：
echo.
echo %var%
echo 正在安装apk，出现Success表示安装成功，安装时间取决于网络环境，如果时间太长，按Ctrl + C键可以取消安装
adb -s %var%  install %var2%
rem goto B
echo.
pause