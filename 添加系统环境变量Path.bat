@echo off

rem �������ԱȨ�޿�ʼ
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 

if '%errorlevel%' NEQ '0' (  
    goto UACPrompt  
) else ( goto gotAdmin )  
   
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs" 
    "%temp%\getadmin.vbs" 
    exit /B  
   
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%" 
    CD /D "%~dp0" 
 
:begin
rem �������ԱȨ�޽���

title ���ϵͳ��������Path
rem 0��������ɫ��B��������ɫ
color 0B
rem �ı䴰���С���룺mode con cols=115 lines=40

echo.
echo ע�⣺���û����������ܻᱻ��ȫ������أ��밴����!

rem ���������ӳ٣�һ������ѭ���ڻ���if����ڲ����õı���
setlocal enabledelayedexpansion

rem ��ѯע����path����������·��
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment  
for /f "skip=2 delims=Z tokens=2*" %%a in ('reg QUERY "%regpath%" /v "path"') do (  
    set "L=%%a"  
    set "P=%%b"  
)  

set "path=%L%"

rem ȥ��ǰ��ո�
:intercept_left
if "%path:~0,1%"==" " set "path=%path:~1%"&goto intercept_left

rem ȥ����β�ո�
:intercept_right
if "%path:~-1%"==" " set "path=%path:~0,-1%"&goto intercept_right


rem �ȱ���path��������
echo.
echo ���ڱ��ݵ�ǰϵͳ��������Path����path������������_����ǰ.txt���ļ��У�%path%;
echo %path% >.\path������������_����ǰ.txt
echo.

rem endlocal��setlocalһ�ԣ��رձ����ӳ٣���������رգ����رյĻ�����Ӱ��findstr����
endlocal

:input_path
rem ������ӵ�·��
set /p "var=������Ҫ��ӵ�ϵͳ��������Path�е�·����"

rem ��ȡ���һ���ַ�
set "pLast=%var:~-1%"

set "pPath=%var%"
rem �ж����һ���ַ��Ƿ�;�ֺ�
if "%pLast%" NEQ ";" (
    set "pPath=%var%;"
) 

rem  ���¶�ȡ�ղű��ݵ�path
setlocal enabledelayedexpansion
for /f "delims=" %%i in (path������������_����ǰ.txt) do (
 set "textStr=%%i"
)

set "tPath=%textStr%"

:add_reg
echo ��������Path����������������ܻ����أ��밴����...
setx path "%pPath%%tPath%" -m  >nul 
echo.
echo ����Path������������

:end
echo.
pause
