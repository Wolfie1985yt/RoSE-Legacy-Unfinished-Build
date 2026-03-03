@echo off
color 0a
cd ..
haxelib set hxCodec 2.5.1
haxelib set extension-androidtools 1.8.0
echo BUILDING GAME
lime build android -D NO_PRECOMPILED_HEADERS -final -verbose
echo.
echo done.
pause
pwd
explorer.exe export\release\android\bin