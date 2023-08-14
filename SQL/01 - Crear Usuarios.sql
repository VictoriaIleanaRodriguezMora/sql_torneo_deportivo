# Implementación de sentencias
# Se deberán crear dos usuarios nuevos a los cuales se le asignará una serie de permisos.
# Aspectos a incluir
# Uno de los usuarios creados deberá tener permisos de sólo lectura sobre todas las tablas.
# El otro usuario deberá tener permisos de Lectura, Inserción y Modificación de datos.
# Ninguno de ellos podrá eliminar registros de ninguna tabla.
# Cada sentencia GRANT y CREATE USER deberá estar comentada con lo que realiza la misma.


USE mysql;
SELECT * FROM user;

# Se asgina permiso de SELECT, UPDATE E INSERT sobre todas las tablas
CREATE USER  'lectura_insercion_modificacion' IDENTIFIED WITH mysql_native_password BY 'lectura_insercion_modificacion888';
GRANT SELECT, UPDATE, INSERT ON *.* TO  'lectura_insercion_modificacion';
SHOW GRANTS FOR  'lectura_insercion_modificaciondominio';

# Se asigna permisos de SELECT sobre todas las tablas.
CREATE USER  'usuario_lectura@dominio' IDENTIFIED WITH mysql_native_password BY 'usuario_lectura999';
GRANT SELECT ON *.* TO 'usuario_lectura@dominio';
SHOW GRANTS FOR 'usuario_lectura@dominio';
