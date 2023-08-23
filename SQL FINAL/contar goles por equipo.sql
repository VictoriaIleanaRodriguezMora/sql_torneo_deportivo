DROP PROCEDURE contar_goles_por_equipo;



DELIMITER $$
CREATE PROCEDURE contar_goles_por_equipo (id_equipo_param INT)
BEGIN

DECLARE goles_de_local INT;
DECLARE goles_de_visitante INT;
DECLARE goles_totales_equipo INT;


SET goles_de_local = (SELECT SUM(equipo_local_goles) FROM partido_f WHERE  (id_equipo_local = 1) GROUP BY id_equipo_local ); 

SET goles_de_visitante = (SELECT SUM(equipo_visitante_goles) FROM partido_f WHERE  (id_equipo_visitante = 1) GROUP BY id_equipo_visitante ); 

SET goles_totales_equipo = (goles_de_local + goles_de_visitante );

-- RETURN goles_totales_equipo;

END $$
DELIMITER ;
