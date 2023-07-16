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