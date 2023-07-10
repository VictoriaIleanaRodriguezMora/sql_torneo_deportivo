DELIMITER$$
CREATE FUNCTION contar_partidos_ganados(id_equipo INT)
RETURNS INT
DETERMINISTIC
BEGIN


SELECT 
		COUNT(pf.id_equipo_ganador) AS partidos_ganados
        , ef.partidos_jugados
        , ef.id_equipo_f
        , ef.id_club
FROM 
		partido_f AS pf

JOIN equipo_f AS ef
ON pf.id_equipo_ganador = ef.id_equipo_f AND ef.partidos_jugados > 0
GROUP BY ef.id_equipo_f


END$$
DELIMITER;




