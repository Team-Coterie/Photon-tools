@echo off
echo             -[Photon Development Tools]-
ECHO                   by:Redbaron2005
echo                         v0.3
echo.
echo.
pause
:MENU
ECHO ..............................................................
ECHO                  Welcome to the toolbox
ECHO                   All files/imgs are located
ECHO                   in the files folder in the main
ECHO                    directory... Help yourself :)
ECHO ..............................................................
ECHO.
ECHO 1 - Root Device
ECHO -----------The below might require fastboot mode--------------
ECHO 2 - Flash cwmrecovery.img
ECHO 3 - Flash recovery.img
ECHO 4 - Flash boot.img
ECHO 5 - Flash Joker's Recovery 3
ECHO 6 - Flash Joker's Recovery 4
ECHO --------------------------------------------------------------
echo.
echo 7 - EXIT
echo.
SET /P M=Please choose from the following...
echo then press ENTER
echo.
IF %M%==1 GOTO ROOT
IF %M%==2 GOTO FLASHCWM
IF %M%==3 GOTO FLASHRC
IF %M%==4 GOTO BOOT
IF %M%==5 GOTO FLASHJR3
IF %M%==6 GOTO FLASHJR4
IF %M%==7 GOTO EOF
:FLASHCWM
cd
fastboot.exe flash recovery files/cwmrecovery.img
echo CWMrecovery.img flashed!
GOTO MENU
:FLASHJR3
cd
fastboot.exe flash recovery files/joker3.img
echo CWMrecovery.img flashed!
GOTO MENU
:FLASHJR4
cd
fastboot.exe flash recovery files/joker4.img
echo CWMrecovery.img flashed!
GOTO MENU
:FLASHRC
cd
fastboot.exe flash recovery files/recovery.img
echo recovery.img has been flashed!
GOTO MENU
:BOOT
cd
fastboot.exe flash boot files/boot.img
echo Success!
echo Device will now reboot
fastboot.exe reboot
GOTO MENU
:ROOT
adb.exe kill-server
adb.exe start-server
echo Setting up device
adb shell rm /data/local/12m.bak > NUL
adb shell mv /data/local/12m /data/local/12m.bak > NUL
adb shell ln -s /data /data/local/12m > NUL
echo Rebooting...
adb reboot
echo.
adb kill-server > NUL
adb wait-for-device > NUL
adb wait-for-device > NUL
echo.
echo Charging my Lazor!
adb shell rm /data/local/12m > NUL
adb shell mv /data/local/12m.bak /data/local/12m > NUL
adb shell rm /data/local.prop.bak > NUL
adb shell mv /data/local.prop /data/local.prop.bak > NUL
adb shell echo "ro.sys.atvc_allow_netmon_usb=0" ^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_netmon_ih=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_res_core=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_res_panic=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_all_adb=1" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_all_core=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_efem=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_bp_log=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_ap_mot_log=0" ^>^> /data/local.prop
adb shell echo "ro.sys.atvc_allow_gki_log=0" ^>^> /data/local.prop
adb reboot
echo.
echo Still charging!!!
adb.exe wait-for-device > NUL
adb.exe wait-for-device > NUL
adb.exe remount
adb.exe push rootsetup /data/local/tmp/rootsetup
adb.exe shell chmod 755 /data/local/tmp/rootsetup
adb.exe shell /data/local/tmp/rootsetup
adb.exe shell rm /data/local/tmp/rootsetup
adb.exe shell sync
echo SHOOP
adb.exe push su /system/xbin/su
adb.exe push Superuser.apk /system/app/Superuser.apk
adb.exe push busybox /system/xbin/busybox
adb.exe push remount /system/xbin/remount
echo DA
adb.exe shell chmod 755 /system/xbin/busybox
adb.exe shell chmod 755 /system/xbin/remount
adb.exe shell chown root.shell /system/xbin/su
adb.exe shell chmod 6755 /system/xbin/su
adb.exe shell ln -s /system/xbin/su /system/bin/su
echo AAAHHH
adb.exe shell /system/xbin/busybox --install -s /system/xbin
@ping 127.0.0.1 -n 6 -w 1000 > nul
adb.exe shell rm /data/local/tmp/*
echo WOOOP!
echo.
echo.
echo.
echo.
echo SHOOP DA WOOP!!!
pause
adb.exe reboot
echo Your device is OVER 9000!!!
echo That in it's self means your device is now rooted
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
ping -n 1 127.0.0.1 > nul
echo.
pause
adb.exe kill-server
GOTO MENU