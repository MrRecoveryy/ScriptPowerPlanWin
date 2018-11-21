@echo off
MODE CON cols=90 lines=5
title Windows Power Plan [Menu]
color f
::Verifica si tienes permisos de Administrador
:check_Permissions
    echo.
	echo.
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Espere...
		ping -n 5 localhost>nul  
		goto:verificado
    ) else (
        echo Error: No tienes Permisos de Administrador.
    )

    pause >nul
set var=0
:verificado
::Si se tiene permisos de Administrador,el programa pasara a abrirse.
color d
MODE CON cols=90 lines=20
:menu
title Windows Power Plan [Menu]
echo.
echo    Mas updates en: https://github.com/MrRecoveryy
echo 	  -----------------------------------
echo 	  -     Windows Power Plan [Menu]   -
echo 	  -----------------------------------
echo 	  -                                 -
echo           -      1. Maximo Rendimiento      
echo 	  -      2. Alto Rendimiento        -
echo 	  -      3. Ahorro de Energia       -
echo 	  -      4. Equilibrado             -
echo 	  -      5. Salir                   -
echo 	  -----------------------------------
echo.
echo           /. Creado por MrRecoveryy
echo                v1.01 (21/11/2018) 
echo.
echo.
echo.
set /p var=admin@%username%:~# 
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto exit
::Mensaje de error,validacion cuando se ejecuta una opcion inexistente
echo. error "%var%" no existe
pause>nul
cls 
goto:menu 

:op1
echo.
cls
::Codigo
echo Creando Carpeta en C:\UltimatePlan...
ping -n 2 localhost>nul
cls
echo Anadiendo Ultimate Plan...
ping -n 3 localhost>nul
cls
mkdir c:\UltimatePlan
%dir%
xcopy UltimatePlan.pow C:\UltimatePlan
cls
powercfg -import c:\UltimatePlan\UltimatePlan.pow
pause
goto:menu

:op2
echo.
cls
::Codigo
powercfg -setactive scheme_min
goto:menu

:op3
echo.
cls
::Codigo
powercfg -setactive scheme_max
goto:menu

:op4
echo.
cls
::Codigo
powercfg -setactive scheme_balanced
goto:menu

:exit
echo.
cls
::Codigo
@cls&exit


