@echo off
set PGPASSWORD=12345678

rem Comprobar si la base de datos contiene tablas
for /f "tokens=*" %%A in ('^""C:\Program Files\PostgreSQL\13\bin\psql.exe" --username=postgres --dbname=postgresEscalator -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='public';"^') do set table_count=%%A

rem Eliminar espacios en blanco alrededor de la salida
set table_count=%table_count: =%

rem Comprobar si la base de datos está vacía
if "%table_count%"=="0" (
    echo La base de datos está vacía. Restaurando...
    "C:\Program Files\PostgreSQL\13\bin\pg_restore.exe" --username=postgres --dbname=postgresEscalator "bd\26-05-2025_install"
) else (
    echo La base de datos ya contiene tablas. No se realizará la restauración.
)

rem Esperar 3 segundos antes de finalizar
timeout /t 2 /nobreak >nul

exit