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
