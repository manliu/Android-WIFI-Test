@echo off

set ipPath1=1.连接过的手机IP.txt

rem 截图第一个设备
call :Screenshot %ipPath1%

:Screenshot
set ipPath=%1
set ip=""

rem 读取 “%ipPath%”文件
echo.
echo 正在读取“%ipPath%”文件：
for /f "tokens=* delims=" %%i in (%ipPath%) do (
 set "ip=%%i"
)
rem 设备为ip:5555
echo  IP为：%ip% 
set "dev=%ip%:5555"
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
echo 将手机/模拟器的图片拷贝到电脑的目录下...
if "%dev%" NEQ "" (
  adb -s %dev%  pull /sdcard/02.png  "%datevar% %timevar%(%ip%)".png	
) else (
  adb pull /sdcard/02.png  "%datevar% %timevar%(%ip%)".png
)

::adb pull /sdcard/02.png  02.png

::type 123.png | clip 

::copy 123.png  563.png
::pause

rem :End
rem pause