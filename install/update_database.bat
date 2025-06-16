@echo off
set PGPASSWORD=12345678

rem Limpiar la tabla antes de la restauración
"C:\Program Files\PostgreSQL\13\bin\psql.exe" -U postgres -d postgresEscalator -c "TRUNCATE TABLE type_mold;"

echo La base de datos tiene datos. Actualizando...
"C:\Program Files\PostgreSQL\13\bin\pg_restore.exe" --data-only -U postgres -d postgresEscalator -t type_mold "bd\2-10-2024_install"

echo Restauracion completada.

rem Esperar 3 segundos antes de finalizar
timeout /t 2 /nobreak >nul

exit