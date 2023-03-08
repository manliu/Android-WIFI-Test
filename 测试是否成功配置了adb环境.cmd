@echo off
title adb测试是否配置adb环境
rem 0：窗体颜色，B：字体颜色
color 0B
rem 改变窗体大小代码：mode con cols=115 lines=40
echo.
echo adb测试是否配置adb环境
echo.
adb version
echo.
echo 出现版本号表示成功
echo 如果出现“‘adb’不是内部或外部命令，也不是可运行的程序或批处理文件”，说明配置adb环境失败，需要检查下重新配置adb环境。 
pause