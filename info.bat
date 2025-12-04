@echo off
echo Generando reporte completo de tu equipo...
echo.
echo === REPORTE DE INVENTARIO - %COMPUTERNAME% - %DATE% %TIME% === > "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
echo. >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
echo HOSTNAME: %COMPUTERNAME% >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
echo USUARIO: %USERNAME% >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
echo. >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"

wmic computersystem get Manufacturer,Model,TotalPhysicalMemory /format:list >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors /format:list >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
wmic memorychip get BankLabel,Capacity,Speed,MemoryType,DeviceLocator /format:list >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
wmic diskdrive get Model,Size,MediaType,InterfaceType /format:list >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
wmic baseboard get Product,Manufacturer,Version /format:list >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
echo. >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"
systeminfo | findstr /i "Nombre del sistema Memoria Disco" >> "%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"

echo.
echo ¡Listo! El archivo se guardó en tu escritorio como:
echo Inventario_%COMPUTERNAME%.txt
echo Súbelo al formulario. ¡Gracias!
pause