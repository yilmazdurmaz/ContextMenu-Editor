@echo off
echo.[1] custom mode [2] normal mode
choice /c 12
echo.Context entries added "ContextMenu-Editor" are named "Menu_*" or "Entry_*"
echo.
echo.Use the full name shown like "Menu_myProgram" or "Entry_Start"
IF %ERRORLEVEL% == 1 goto custom:
IF %ERRORLEVEL% == 2 goto normal
echo. ERROR: Invalid choice
pause
exit

:normal
echo.---
echo.Which value do you wanna remove?
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo...
echo.
set value=
set /p value=
IF "%value%" == "" GOTO empty
IF NOT "%value%" == "" reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%"
IF NOT "%value%" == "" reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%"
IF NOT "%value%" == "" reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%"
echo.
echo.all done!
pause
exit

:custom
echo.---
echo.Which value do you wanna remove? (might be empty)
reg query "HKEY_CLASSES_ROOT\Directory\ContextMenus"
echo...
echo.
set value=
set /p value=
IF NOT "%value%" == "" reg delete "HKEY_CLASSES_ROOT\Directory\ContextMenus\%value%"

echo.Which one of these is meant to be removed with the value before?
reg query "HKEY_CLASSES_ROOT\Directory\Background\shell"
echo...
echo.
set value=
set /p value=
IF NOT "%value%" == "" reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%value%"

echo.Which one of these is meant to be removed with the value before?
reg query "HKEY_CLASSES_ROOT\Directory\shell"
echo...
echo.
set value=
set /p value=
IF NOT "%value%" == "" reg delete "HKEY_CLASSES_ROOT\Directory\shell\%value%"
echo.
echo.all done!
pause
exit

:empty
echo.you select nothing
echo.If you dont see what you want, try deleting manually, open "regedit.exe" and
echo   first go to [HKEY_CLASSES_ROOT\Directory\shell] and remove 01Menu*
echo   then go to [HKEY_CLASSES_ROOT\Directory\ContextMenus] and remove Menu*
echo   finally go to [HKEY_CLASSES_ROOT\Directory\backround\shell] and remove Menu*
echo   and the menu will be removed! 
pause
