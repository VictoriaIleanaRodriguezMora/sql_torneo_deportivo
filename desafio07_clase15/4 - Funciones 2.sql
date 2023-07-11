-- DROP FUNCTION `torneodeportivovictoriarodriguez`.`contar_comidas`;
DELIMITER $$
CREATE FUNCTION contar_comidas(id_comida_param INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_id INT;
SET total_id = 
(
SELECT 
	   COUNT(jf.id_comida)
FROM
        condicion_alimentaria AS ca
JOIN 
	jugador_f AS jf 
ON 
	ca.id_comidas = jf.id_comida

WHERE jf.id_comida = id_comida_param
GROUP BY ca.id_comidas
LIMIT 1
);


RETURN (total_id)
;
END $$
DELIMITER ;