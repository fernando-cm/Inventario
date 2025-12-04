@echo off
REM Cambiar codificacion para evitar caracteres extraños
chcp 437 > nul
set "output=%USERPROFILE%\Desktop\Inventario_%COMPUTERNAME%.txt"

echo Generando reporte completo de tu equipo...

REM ENCABEZADO
echo ==== REPORTE DE INVENTARIO ==== > "%output%"
echo Equipo: %COMPUTERNAME% >> "%output%"
echo Usuario: %USERNAME% >> "%output%"
echo Fecha: %DATE% Hora: %TIME% >> "%output%"
echo. >> "%output%"

REM INFORMACION DEL SISTEMA
echo === INFORMACION DEL SISTEMA === >> "%output%"
wmic computersystem get Manufacturer,Model,TotalPhysicalMemory /value | findstr /r /v "^$" >> "%output%"
echo. >> "%output%"

REM PROCESADOR
echo === PROCESADOR === >> "%output%"
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors /value | findstr /r /v "^$" >> "%output%"
echo. >> "%output%"

REM MEMORIA RAM
echo === MEMORIA RAM === >> "%output%"
wmic memorychip get BankLabel,Capacity,Speed,MemoryType,DeviceLocator /value | findstr /r /v "^$" >> "%output%"
echo. >> "%output%"

REM DISCO
echo === DISCO === >> "%output%"
wmic diskdrive get Model,Size,MediaType,InterfaceType /value | findstr /r /v "^$" >> "%output%"
echo. >> "%output%"

REM PLACA BASE
echo === PLACA BASE === >> "%output%"
wmic baseboard get Product,Manufacturer,Version /value | findstr /r /v "^$" >> "%output%"
echo. >> "%output%"

REM RED (IPV4)
echo === RED (IPv4) === >> "%output%"
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /R /C:"IPv4"') do (
    set "ip=%%a"
    setlocal enabledelayedexpansion
    if not "!ip!"=="" echo IP: !ip:~1! >> "%output%"
    endlocal
)
echo. >> "%output%"

echo Reporte generado con exito.
echo Archivo guardado en: %output%

REM Espera 3 segundos antes de cerrar
timeout /t 3 > nul
exit
