@echo off
title adb打开调试端口并连接手机
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
echo.
echo 1、如果是第一次连接，请先用USB数据线连接电脑，并打开手机开发者选项，USB调试选项，最好 “仅充电”模式下允许ADB调试 设置也打开
echo 2、第一次连接成功后，就能拔出USB数据线了，后面都不需要USB数据线连接
echo 3、当连接失败时，手机重启或关机过，需要重新使用USB数据线连接。
echo 4、如果手机IP更改过，请在“连接过的手机IP.txt”文件更改IP
echo.
rem 开启变量延迟，一般用于循环内或者if语句内部设置的变量
setlocal enabledelayedexpansion
echo 已连接的设备列表：
adb devices
echo.
rem IP文件
set ipPath=1.连接过的手机IP_2.txt
if exist %ipPath% (
  rem echo 存在该文件
  goto Re
) else (
  rem echo  不存在该文件
  rem 生成“1.连接过的手机IP.txt”文件
  echo 2> %ipPath%
  goto Con
)

:Re
set ipStr=""
rem 读取 “%ipPath%”文件
echo 正在读取“%ipPath%”文件：
for /f "tokens=* delims=" %%i in (%ipPath%) do (
 set "ipStr=%%i"
 
)

echo  IP为：%ipStr% 

:Con
echo.
rem echo 正在断开所有连接：
rem adb disconnect 
echo.
rem echo 正在开启手机调试端口：
rem adb tcpip 5555
echo.

if %ipStr% EQU "" (
   rem echo IP为空	
   goto In
) else (
  rem echo IP不为空
  echo 正在连接手机（只出现connected to xxx表示连接成功，其他失败）：
  adb connect %ipStr% 
  goto En
)


:In
set /p var=请输入要连接的手机的IP：
echo 正在连接手机%var%（只出现connected to xxx表示连接成功，其他失败）：
adb connect %var%
echo %var%>.\%ipPath%


:En
echo.
echo 已连接的设备列表：
adb devices
echo.

echo 连接成功后，先不要立即关闭此窗口，使用AS、HBuilder等运行一下才关闭，不然adb进程会被关闭掉
echo.
rem pause
cmd