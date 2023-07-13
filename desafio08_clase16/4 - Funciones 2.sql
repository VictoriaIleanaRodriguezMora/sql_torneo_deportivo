DROP FUNCTION `torneodeportivovictoriarodriguez`.`total_contar_comidas`;
USE torneodeportivovictoriarodriguez;

DELIMITER $$
CREATE FUNCTION total_contar_comidas(id_comida_param INT)
# A esta funcion se le pasa un id de la tabla condiciones_alimentarias y devuelve el total de jugadores con esa condicion.  Tambien, filtra por sexo
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_id INT;
DECLARE total_f INT;
DECLARE total_m INT;

SET total_f = 
(SELECT COUNT(jf.id_comida) FROM condicion_alimentaria AS ca 
JOIN jugador_f AS jf ON ca.id_comidas = jf.id_comida
WHERE jf.id_comida = id_comida_param GROUP BY ca.id_comidas);

-- ELSE 
SET total_m = 
(SELECT COUNT(jm.id_comida) FROM condicion_alimentaria AS ca 
JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
WHERE jm.id_comida = id_comida_param GROUP BY ca.id_comidas);

-- ELSE SET total_id = 0;

SET total_id = total_f + total_m;

RETURN (total_id);
END $$
DELIMITER ;
