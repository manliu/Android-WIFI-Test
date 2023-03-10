@echo off

echo 已连接设备
adb devices

set /p ipInput=请输入要截图的设备：

rem 截图第一个设备
call :Screenshot  %ipInput%

:Screenshot
set "ip=%1"


rem 设备为ip
echo  IP为：%ip% 
set "dev=%ip%"
::截屏保存到手机/模拟器 的sd卡目录,如果连接了多台设备，需带上-s命令 
echo.
echo 正在截图...
if "%dev%" NEQ "" (
  rem echo 不等
  adb -s %dev% shell screencap -p /sdcard/02.png	
) else (
   rem echo 等
   adb  shell screencap -p /sdcard/02.png
)


::获取当前系统时间戳
::set "filename=%date:~0,4%%date:~5,2%%date:~8,2%0%time:~1,1%%time:~3,2%%time:~6,2%"


::获取日期 将格式设置为：20110820
set "datevar=%date:~0,4%-%date:~5,2%-%date:~8,2%"
::获取时间中的小时 将格式设置为：24小时制
set "timevar=%time:~0,2%"
if /i %timevar% LSS 10 (
set "timevar=0%time:~1,1%"
)

::获取时间中的分、秒 将格式设置为：3220 ，表示 32分20秒
set "timevar=%timevar%%time:~3,2%%time:~6,2%"

::将手机/模拟器的图片复制到电脑的目录下
echo.
rem 截取IP，因为设备名后面带端口号:5555
set "ipStr=%dev:~0,-5%"
echo %ipStr% echo 将手机/模拟器的图片拷贝到电脑的目录下...

if "%dev%" NEQ "" (
  adb -s %dev%  pull /sdcard/02.png  "%datevar% %timevar%(%ipStr%)".png	
) else (
  adb pull /sdcard/02.png  "%datevar% %timevar%(%ipStr%)".png
)

::adb pull /sdcard/02.png  02.png

::type 123.png | clip 

::copy 123.png  563.png
::pause

rem :End
rem pause