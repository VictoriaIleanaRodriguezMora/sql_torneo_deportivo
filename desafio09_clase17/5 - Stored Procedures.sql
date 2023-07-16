# Para probarlo
# call torneodeportivovictoriarodriguez.info_por_categoria(1998, 5, 'F', 'ASC');
# call torneodeportivovictoriarodriguez.info_por_categoria(1996, 2, 'M', 'ASC');

DELIMITER $$
# Este procedure devuelve datos segun la categoria, id_club y sexo de las tablas jugador_f y jugador_m
CREATE PROCEDURE info_por_categoria (cat_param INT, id_club_param INT,  sexo_param CHAR, orderby_param TEXT)
BEGIN
IF sexo_param = "F" THEN
(
SELECT 
		  id_jugador_f
        , categoria
        , id_club
FROM jugador_f 
WHERE categoria = cat_param	AND id_club = id_club_param
ORDER BY id_jugador_f + orderby_param
);

ELSE IF sexo_param = "M" THEN
(
SELECT 
		  id_jugador_m
        , categoria
        , id_club
FROM jugador_m 
WHERE categoria = cat_param	AND id_club = id_club_param
ORDER BY id_jugador_m + orderby_param

);
END IF;
END IF;

END;

DELIMITER;





DELIMITER $$
# Este procedure devuelve datos segun la categoria, id_club y sexo de las tablas jugador_f y jugador_m

CREATE PROCEDURE goles_por_jugador (id_jug_param INT)
BEGIN
(
 SELECT 
		id_jugador_f, nombre_j, apellido_j, dni_j, categoria,goles, id_club, id_posicion
 FROM jugador_f 
 WHERE id_jugador_f = id_jug_param 
);
END;

DELIMITER;
# Para probarlo
# call torneodeportivovictoriarodriguez.goles_por_jugador(6);





DELIMITER $$
CREATE PROCEDURE goleador_por_categoria(cat_param INT)
BEGIN

(
SELECT id_jugador_f, goles 
FROM jugador_f
WHERE categoria = cat_param  AND goles =
	(
	SELECT MAX(goles) FROM jugador_f WHERE categoria = cat_param 
	)
);

END;
DELIMITER;
