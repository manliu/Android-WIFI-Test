@echo off
title adb�����ֻ����Զ˿�
rem 0��������ɫ��B��������ɫ
color 0B
rem �ı䴰���С���룺mode con cols=115 lines=40
echo.
echo ������USB���������ӵ��ԣ������ֻ�������ѡ�USB����ѡ���� ������硱ģʽ������ADB���� ����Ҳ��
echo.
echo �����ӵ��豸�б�
adb devices
echo ���ڿ����ֻ����Զ˿ڣ�
adb tcpip 5555
echo.
echo 1��������֡�restarting in TCP mode port: 5555�������ʾ�ɹ������ֻ����Զ˿�
echo.
echo 2��������� ��error: device not found������ʧ�ܣ���ʾ��û���豸���ӵ����ԣ�������û����USB���������ӵ���
echo.
echo 3��������֡�error: more than one device and emulator������ʧ�ܣ��ǵ��������˶���豸���븴��ճ��������Ҫ�������豸
echo.
set /p var=�����ĵ��Զ˿ڵ��豸�� ��������ӳɹ������ٲ�������
adb -s %var% tcpip 5555
echo.
rem pause���ô���ִ�������������ʾ�����������Ҫ������ʾ���ڣ���pauseȥ�������нű�����һ��
pause