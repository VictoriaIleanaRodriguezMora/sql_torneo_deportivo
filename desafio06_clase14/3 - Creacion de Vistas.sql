# Desafio 14
# Condiciones alimentarias
CREATE VIEW contador_condicion_alimentaria_f AS(
SELECT 
       ca.id_comidas
       , ca.nombre_condicion
	   , COUNT(jf.id_comida) AS 'cantidad de jugadores F'
FROM
        condicion_alimentaria AS ca
JOIN 
	jugador_f AS jf 
ON 
	ca.id_comidas = jf.id_comida
GROUP BY id_comidas
ORDER BY id_comidas ASC
)
;

CREATE VIEW contador_condicion_alimentaria_m AS(
SELECT 
       ca.id_comidas
       , ca.nombre_condicion
	   , COUNT(jm.id_comida) AS 'cantidad de jugadores M'
       -- , COUNT(jm.id_comida) AS 'cantidad de jugadores'
FROM
        condicion_alimentaria AS ca
JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
-- JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
GROUP BY id_comidas
ORDER BY id_comidas ASC
)
;








