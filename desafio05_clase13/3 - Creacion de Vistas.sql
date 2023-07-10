# Desafio Clase 14

CREATE VIEW contador_condicion_alimentaria_f AS(
# Vista para ver la condicion alimentaria de las jugadoras femeninas. Para ver que cantidad y que tipo de comida se debe preparar/encargar para el torneo.
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
GROUP BY ca.id_comidas
ORDER BY ca.id_comidas ASC
)
;

# Habria forma de hacer estas dos tablas en una? La verdad que lo intenté pero no pude. 

CREATE VIEW contador_condicion_alimentaria_m AS(
# Vista para ver la condicion alimentaria de los jugadores masculinos. Para ver que cantidad y que tipo de comida se debe preparar/encargar para el torneo.
SELECT 
       ca.id_comidas
       , ca.nombre_condicion
	   , COUNT(jm.id_comida) AS 'cantidad de jugadores M'
       -- , COUNT(jm.id_comida) AS 'cantidad de jugadores'
FROM
        condicion_alimentaria AS ca
JOIN jugador_m AS jm 
ON ca.id_comidas = jm.id_comida
-- JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
GROUP BY id_comidas
ORDER BY id_comidas ASC
)
;

CREATE VIEW nombre_filtrados AS (
# Esta tabla no tiene ningun fin útil. La hice por falta de tiempo. Muestra Los nombres de jugadores que empiecen por A y su apellido empiece por B
SELECT 
		 id_jugador_f
        , nombre_j
        , apellido_j
 FROM jugador_f WHERE nombre_j LIKE 'A%' AND apellido_j LIKE 'B%'
 )
 ;
 
 CREATE VIEW arbitros_por_partidos AS (
# Esta es una vista para poder ver a cuantos partidos fue asignado cada arbitro. Para ver si la cantidad es equitativa
SELECT 
        (pf.id_arbitro)
        , arb.nombre_a
        , COUNT(arb.id_arbitro) AS 'cantidad partidos por arbitro'
FROM partido_f AS pf
JOIN arbitro AS arb 
ON pf.id_arbitro = arb.id_arbitro
GROUP BY pf.id_arbitro
ORDER BY arb.id_arbitro ASC

)
;

CREATE VIEW contador_posiciones AS(
# Esta vista muestra cuantas veces es elegida una posicion por un jugador.
SELECT 
		jf.id_posicion
        , COUNT(pscn.id_posicion)
        , pscn.nombre_posicion
FROM jugador_f AS jf
JOIN posicion AS pscn
ON pscn.id_posicion = jf.id_posicion
GROUP BY pscn.id_posicion
)
;

CREATE VIEW contador_posiciones AS(
# Esta vista muestra cuantas veces es elegida una posicion por un jugador.
SELECT 
		jm.id_posicion
        , COUNT(pscn.id_posicion)
        , pscn.nombre_posicion
FROM jugador_m AS jm
JOIN posicion AS pscn
ON pscn.id_posicion = jm.id_posicion
GROUP BY pscn.id_posicion
)
;

# SELECT
#		(jf.id_jugador_f)
#        , jf.categoria
#        , jf.goles
#        , jf.id_posicion
#        , (posc.id_posicion)
# FROM jugador_f AS jf
# -- WHERE id_posicion = 1
# JOIN posicion AS posc
# ON jf.id_posicion = 1 AND posc.id_posicion = 1










