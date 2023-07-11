DROP FUNCTION `torneodeportivovictoriarodriguez`.`contar_comidas`;
USE torneodeportivovictoriarodriguez;

DELIMITER $$
CREATE FUNCTION contar_comidas(id_comida_param INT, sexo_param CHAR)
# A esta funcion se le pasa un id de la tabla condiciones_alimentarias y devuelve el total de jugadores con esa condicion.  Tambien, filtra por sexo
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_id INT;

IF sexo_param = "F" THEN
SET total_id = 
(SELECT COUNT(jf.id_comida) FROM condicion_alimentaria AS ca JOIN jugador_f AS jf ON ca.id_comidas = jf.id_comida
WHERE jf.id_comida = id_comida_param GROUP BY ca.id_comidas);

ELSE IF sexo_param = "M" THEN
-- ELSE 
SET total_id = 
(SELECT COUNT(jm.id_comida) FROM condicion_alimentaria AS ca JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
WHERE jm.id_comida = id_comida_param GROUP BY ca.id_comidas);
END IF;

-- ELSE SET total_id = 0;
END IF;

RETURN (total_id);
END $$
DELIMITER ;

