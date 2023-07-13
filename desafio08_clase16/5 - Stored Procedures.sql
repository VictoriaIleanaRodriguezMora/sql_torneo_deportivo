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
ORDER BY id_jugador_f + orderby_param

);
END IF;
END IF;

END;

DELIMITER;