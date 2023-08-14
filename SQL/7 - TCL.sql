# Sentencias del sublenguaje TCL

# En la primera tabla, si tiene registros, deberás eliminar algunos de ellos iniciando previamente una transacción. Si no tiene registros la tabla, reemplaza eliminación por inserción.
# Deja en una línea siguiente, comentado la sentencia Rollback, y en una línea posterior, la sentencia Commit.
# Si eliminas registros importantes, deja comentadas las sentencias para re-insertarlos.
# En la segunda tabla, inserta ocho nuevos registros iniciando también una transacción. 
# Agrega un savepoint a posteriori de la inserción del registro #4 y otro savepoint a posteriori del registro #8
# Agrega en una línea comentada la sentencia de eliminación del savepoint de los últimos 4 registros insertados.

# CONSIGNA 01
START TRANSACTION;

INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Eugenie', 'Yukhtin', 73651936, 4, 'eyukhtin0@unblog.fr', '3939446174');
INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Werner', 'Bonsale', 76364399, 8, 'wbonsale1@networksolutions.com', '8647081661');
INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Ferrel', 'Crick', 50387638, 2, 'fcrick2@meetup.com', '6439663974');
INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Cynthea', 'Hambling', 82426544, 4, 'chambling3@deviantart.com', '3746269067');

SAVEPOINT cuatro_primeros_arbitros;

INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Carlyle', 'Feldstern', 18052519, 8, 'cfeldstern4@e-recht24.de', '7386589758');
INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Pammy', 'Simonini', 65227379, 2, 'psimonini5@feedburner.com', '8375281442');
INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Guenna', 'Morriss', 87309630, 14, 'gmorriss6@princeton.edu', '1617402635');
INSERT INTO arbitro (id_arbitro, nombre_a, apellido_a, dni_a, años_experiencia, mail, telefono) VALUES (NULL, 'Rhiamon', 'Clausner', 74922984, 10, 'rclausner7@princeton.edu', '7174241210');

SAVEPOINT cuatro_ultimos_arbitros;

ROLLBACK TO cuatro_primeros_arbitros;

COMMIT; 
# CONSIGNA 01



# CONSIGNA 02
SELECT * FROM torneodeportivovictoriarodriguez.periodista;

START TRANSACTION;
DELETE FROM periodista WHERE (id_periodista = 1);
DELETE FROM periodista WHERE (id_periodista = 2);

ROLLBACK;

SELECT * FROM torneodeportivovictoriarodriguez.periodista;

COMMIT;

# CONSIGNA 02


