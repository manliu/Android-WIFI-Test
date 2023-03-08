@echo off

rem 请求管理员权限开始
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
rem 请求管理员权限结束

title 添加系统环境变量Path
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40

echo.
echo 注意：设置环境变量可能会被安全软件拦截，请按允许!

rem 开启变量延迟，一般用于循环内或者if语句内部设置的变量
setlocal enabledelayedexpansion

rem 查询注册表的path环境变量的路径
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment  
for /f "skip=2 delims=Z tokens=2*" %%a in ('reg QUERY "%regpath%" /v "path"') do (  
    set "L=%%a"  
    set "P=%%b"  
)  

set "path=%L%"

rem 去除前面空格
:intercept_left
if "%path:~0,1%"==" " set "path=%path:~1%"&goto intercept_left

rem 去除后尾空格
:intercept_right
if "%path:~-1%"==" " set "path=%path:~0,-1%"&goto intercept_right


rem 先备份path环境变量
echo.
echo 正在备份当前系统环境变量Path到“path环境变量备份_设置前.txt”文件中：%path%;
echo %path% >.\path环境变量备份_设置前.txt
echo.

rem endlocal和setlocal一对，关闭变量延迟，必须在这关闭，不关闭的话，会影响findstr命令
endlocal

:input_path
rem 输入添加的路径
set /p "var=请输入要添加的系统环境变量Path中的路径："

rem 截取最后一个字符
set "pLast=%var:~-1%"

set "pPath=%var%"
rem 判断最后一个字符是否;分号
if "%pLast%" NEQ ";" (
    set "pPath=%var%;"
) 

rem  重新读取刚才备份的path
setlocal enabledelayedexpansion
for /f "delims=" %%i in (path环境变量备份_设置前.txt) do (
 set "textStr=%%i"
)

set "tPath=%textStr%"

:add_reg
echo 正在设置Path环境变量，软件可能会拦截，请按允许...
setx path "%pPath%%tPath%" -m  >nul 
echo.
echo 设置Path环境变量结束

:end
echo.
pause
