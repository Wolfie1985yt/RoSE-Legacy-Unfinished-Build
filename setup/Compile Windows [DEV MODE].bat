@echo off
color 0a
cd ..
haxelib set hxCodec 3.0.2
haxelib --global update haxelib
echo TESTING GAME
lime test windows
echo.
echo done.
pause
pwd
explorer.exe export\release\windows\bin