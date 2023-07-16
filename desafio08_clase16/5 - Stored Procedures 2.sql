DELIMITER $$
CREATE PROCEDURE trabajar_goles ()

BEGIN

DECLARE ganador_var INT;
DECLARE perdedor_var INT;

(
SELECT 
		  id_partido
        , categoria  
		, id_equipo_local
        , id_equipo_visitante
        , equipo_local_goles
        , equipo_visitante_goles
        , id_equipo_ganador
        , id_equipo_perdedor
FROM partido_f
WHERE equipo_local_goles AND equipo_visitante_goles  IS NOT NULL
-- (UPDATE partido_f SET id_equipo_ganador = WHERE );
)
;


END;
DELIMITER;



DROP PROCEDURE `torneodeportivovictoriarodriguez`.`trabajar_goles`;
DELIMITER $$
CREATE PROCEDURE trabajar_goles ()
BEGIN

DECLARE ganador_var INT;
DECLARE perdedor_var INT;

SET ganador_var = (SELECT equipo_local_goles FROM partido_f WHERE equipo_local_goles IS NOT NULL AND equipo_local_goles > 0);
SET perdedor_var = (SELECT equipo_visitante_goles FROM partido_f WHERE equipo_local_goles IS NOT NULL AND equipo_visitante_goles > 0);

IF ganador_var > perdedor_var THEN
(
UPDATE partido_f SET id_equipo_ganador = 
WHERE (`id_partido` = '1');
);

END IF;

END;
DELIMITER;
