@echo off

echo �������豸
adb devices

set /p ipInput=������Ҫ��ͼ���豸��

rem ��ͼ��һ���豸
call :Screenshot  %ipInput%

:Screenshot
set "ip=%1"


rem �豸Ϊip
echo  IPΪ��%ip% 
set "dev=%ip%"
::�������浽�ֻ�/ģ���� ��sd��Ŀ¼,��������˶�̨�豸�������-s���� 
echo.
echo ���ڽ�ͼ...
if "%dev%" NEQ "" (
  rem echo ����
  adb -s %dev% shell screencap -p /sdcard/02.png	
) else (
   rem echo ��
   adb  shell screencap -p /sdcard/02.png
)


::��ȡ��ǰϵͳʱ���
::set "filename=%date:~0,4%%date:~5,2%%date:~8,2%0%time:~1,1%%time:~3,2%%time:~6,2%"


::��ȡ���� ����ʽ����Ϊ��20110820
set "datevar=%date:~0,4%-%date:~5,2%-%date:~8,2%"
::��ȡʱ���е�Сʱ ����ʽ����Ϊ��24Сʱ��
set "timevar=%time:~0,2%"
if /i %timevar% LSS 10 (
set "timevar=0%time:~1,1%"
)

::��ȡʱ���еķ֡��� ����ʽ����Ϊ��3220 ����ʾ 32��20��
set "timevar=%timevar%%time:~3,2%%time:~6,2%"

::���ֻ�/ģ������ͼƬ���Ƶ����Ե�Ŀ¼��
echo.
rem ��ȡIP����Ϊ�豸��������˿ں�:5555
set "ipStr=%dev:~0,-5%"
echo %ipStr% echo ���ֻ�/ģ������ͼƬ���������Ե�Ŀ¼��...

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