
(
SELECT id_jugador_f, categoria, MAX(goles)
FROM jugador_f 
WHERE goles > 0  GROUP BY id_jugador_f 
);