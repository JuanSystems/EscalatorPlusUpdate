@echo off
setlocal

timeout /t 2 /nobreak >nul
REM >>> Ajusta el nombre del servicio según tu instalación (puede ser "postgresql-x64-13" o similar)
set SERVICE_NAME=postgresql

NET START "%SERVICE_NAME%" >nul 2>&1

timeout /t 5 /nobreak >nul

REM >>> Configura aquí tu contraseña de forma más segura si es posible (.pgpass en %APPDATA%\postgresql\pgpass.conf)
set PGPASSWORD=12345678

echo Creando base de datos "postgresEscalator"...
"C:\Program Files\PostgreSQL\13\bin\psql.exe" --username=postgres --command="CREATE DATABASE \"postgresEscalator\""

if errorlevel 1 (
    echo [ERROR] Falló la creación de la base de datos.
    exit /b 1
) else (
    echo Base de datos creada con éxito.
)

endlocal
exit /b 0