/* 
PARA BORRAR DATOS AUTO GENERADOS POR EL ORACLE
1. Ejecutar query
2. Copiar resultado y ejecutarlo
*/


SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;