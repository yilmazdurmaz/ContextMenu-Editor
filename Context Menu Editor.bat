::Made By TheJoshua974
@echo off
echo.Hello %username%
echo.Please avoid using spaces, you could break your registry value, try to use spaces only when it's for paths or file names
echo.What do you want the Menu to be called?
set /p MUIVerb=
echo.Where is the icon file?
echo.WARNING: USE "\\" IN PATH ; EXAMPLE: C:\Windows.ico BECOME C:\\Windows.ico
set /p Icon=
echo.Where is the executable?
echo.WARNING: USE "\\" IN PATH ; EXAMPLE: C:\Windows.exe BECOME C:\\Windows.exe
set /p exec=
echo.What do you want it to be?
echo.[1] a Menu ("Open %exec%" plus "Open %exec% Elevated")
echo.[2] one entry (Open %exec%)
choice /c 12
IF %ERRORLEVEL% == 1 goto two
IF %ERRORLEVEL% == 2 goto one
exit

:two
set type=Menu
echo.Windows Registry Editor Version 5.00 > Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\Menu_%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\Menu_%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\background\shell\Menu_%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo."ExtendedSubCommandsKey"="Directory\\ContextMenus\\Menu_%MUIVerb%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu_%MUIVerb%\shell\%MUIVerb%_admin] >> Menu.reg
echo."MUIVerb"="%MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="powershell.exe -Command Start-Process %exec% -Verb RunAs" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu_%MUIVerb%\shell\%MUIVerb%] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu_%MUIVerb%\shell\%MUIVerb%_admin\command] >> Menu.reg
echo."MUIVerb"="%MUIVerb% Elevated" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="powershell.exe -Command Start-Process %exec% -Verb RunAs" >> Menu.reg
echo."HasLUAShield"="" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Menu_%MUIVerb%\shell\%MUIVerb%\command] >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo.@="%exec%" >> Menu.reg
goto done

:one
set type=Entry
echo.Windows Registry Editor Version 5.00 > Menu.reg
echo.  >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\Entry_%MUIVerb%]  >> Menu.reg
echo.@="" >> Menu.reg
echo."Extended"="" >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\shell\Entry_%MUIVerb%\command] >> Menu.reg 
echo.@="%exec%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\Background\shell\Entry_%MUIVerb%] >> Menu.reg 
echo.@="" >> Menu.reg
echo."MUIVerb"="%MUIVerb%" >> Menu.reg
echo."Icon"="%Icon%" >> Menu.reg
echo. >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\Background\shell\Entry_%MUIVerb%\command] >> Menu.reg 
echo.@="%exec%" >> Menu.reg
echo.[HKEY_CLASSES_ROOT\Directory\ContextMenus\Entry_%MUIVerb%\] >> Menu.reg
goto done

:done
echo Done!
echo Open the file "menu.reg" to apply changes!
echo if you wanna remove the context menu either use the given file or do it manually
echo to do it manually, open "regedit.exe" and
echo   first go to [HKEY_CLASSES_ROOT\Directory\shell] and remove %type%_%MUIVerb%
echo   then go to [HKEY_CLASSES_ROOT\Directory\ContextMenus] and remove %type%_%MUIVerb%
echo   finally go to [HKEY_CLASSES_ROOT\Directory\backround\shell] and remove %type%_%MUIVerb%
echo   and the menu will be removed!

pause
