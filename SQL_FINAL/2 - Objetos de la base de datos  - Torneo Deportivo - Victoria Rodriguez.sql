
#######################################################################
###################   OBJETOS DE LA BASE DE DATOS   ###################
#######################################################################

USE torneodeportivovictoriarodriguez;

#############################################################
#############################################################
####################   INICIO - TRIGGERS  ###################
#############################################################
#############################################################

CREATE TRIGGER actualizar_goleadores
AFTER UPDATE ON goleador
FOR EACH ROW
INSERT INTO log_goleador (id_goleador, id_jugador, old_id_jugador, categoria, goles, id_club)
VALUES (NEW.id_goleador, NEW.id_jugador, OLD.id_jugador, NEW.categoria, NEW.goles, NEW.id_club);

#############################################################
#############################################################
######################   FIN - TRIGGERS  ####################
#############################################################
#############################################################

#############################################################
#############################################################
#####################  INICIO - VISTAS  #####################
#############################################################
#############################################################


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
      
FROM
        condicion_alimentaria AS ca
JOIN jugador_m AS jm 
ON ca.id_comidas = jm.id_comida
GROUP BY id_comidas
ORDER BY id_comidas ASC
)
;



CREATE VIEW prensa_y_periodista AS(
# Esta vista muestra unificadamente, que periodistas, estan con qué empresa. Y sus datos de contacto.
SELECT 
tv_p.id_prensa, tv_p.nro_camaras_disponibles, tv_p.nombre_empresa, tv_p.mail, tv_p.telefono, tv_p.oficina_direccion,
	 p.id_periodista, p.apellido_p, p.dni_p, p.mail_p, p.telefono_p 
FROM periodista AS p
JOIN televisacion_prensa AS tv_p
ON p.id_periodista = tv_p.id_periodista
)
;

CREATE VIEW cuanto_se_usa_cada_talle AS(
# Esta vista informa cuanto de cada talle se necesita/es usado por cada jugador. 
SELECT 
  t.id_talle
 , t.talle
 , COUNT(jf.camiseta_talle) AS 'total jugadores'
FROM talle AS t
JOIN  jugador_f AS jf
ON t.id_talle = jf.camiseta_talle
GROUP BY  t.id_talle
)
;

#############################################################
#############################################################
######################  FIN - VISTAS  #######################
#############################################################
#############################################################


#############################################################
#############################################################
################  INICIO - STORED PROCEDURES  ###############
#############################################################
#############################################################

DELIMITER $$
# Este procedure devuelve datos segun la categoria, id_club y sexo de las tablas jugador_f y jugador_m
CREATE PROCEDURE info_por_categoria (cat_param INT, id_club_param INT,  sexo_param CHAR, orderby_param TEXT)
BEGIN
IF sexo_param = "F" THEN
(
SELECT 
		  id_jugador_f , categoria , id_club
FROM jugador_f 
WHERE categoria = cat_param	AND id_club = id_club_param
ORDER BY id_jugador_f + orderby_param
);

ELSE IF sexo_param = "M" THEN
(
SELECT   id_jugador_m , categoria , id_club
FROM jugador_m 
WHERE categoria = cat_param	AND id_club = id_club_param
ORDER BY id_jugador_m + orderby_param
);
END IF;
END IF;

END $$
DELIMITER ; 



DELIMITER $$
# Este procedure devuelve datos segun la categoria, id_club y sexo de las tablas jugador_f y jugador_m
CREATE PROCEDURE goles_por_jugador (id_jug_param INT)
BEGIN
(
 SELECT 
		id_jugador_f, nombre_j, apellido_j, dni_j, categoria,goles, id_club, id_posicion
 FROM jugador_f 
 WHERE id_jugador_f = id_jug_param 
);
END $$
DELIMITER ;
# Para probarlo
# call torneodeportivovictoriarodriguez.goles_por_jugador(6);


DELIMITER $$
CREATE PROCEDURE goleador_por_categoria(cat_param INT)
BEGIN
(
SELECT id_jugador_f, goles 
FROM jugador_f
WHERE categoria = cat_param  AND goles =
(SELECT MAX(goles) FROM jugador_f WHERE categoria = cat_param )
);

END $$
DELIMITER ;



DELIMITER $$
# Este SP, recibe un id_equipo, de la tabla partido_f, y te dice cuantos partidos ganó y perdió ese equipo
CREATE PROCEDURE partidos_ganados_y_perdidos_por_equipo (id_equipo_param INT)
BEGIN
(
SELECT 
(SELECT COUNT(id_equipo_ganador) FROM partido_f WHERE id_equipo_ganador = id_equipo_param)  AS 'partidos ganados',
(SELECT COUNT(id_equipo_perdedor) FROM partido_f WHERE id_equipo_perdedor = id_equipo_param) AS 'partidos perdidos'
);
END $$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE partido_con_mas_goles (categoria_param INT)
# Este SP dice, cual es el partido, en el que mas goles se realizaron. Por categoria.
BEGIN
DECLARE maxima_cantidad_goles INT;
SET maxima_cantidad_goles = (SELECT GREATEST(MAX(equipo_local_goles), MAX(equipo_visitante_goles)) FROM partido_f);
(SELECT * FROM partido_f WHERE (equipo_local_goles = maxima_cantidad_goles) OR  (equipo_visitante_goles = maxima_cantidad_goles) AND (categoria = categoria_param) );

END $$
DELIMITER ;

#############################################################
#############################################################
#################  FIN - STORED PROCEDURES ##################
#############################################################
#############################################################


#############################################################
#############################################################
####################  INICIO - FUNCIONES  ###################
#############################################################
#############################################################

USE torneodeportivovictoriarodriguez;

DELIMITER $$
CREATE FUNCTION contar_comidas(id_comida_param INT, sexo_param CHAR)
# A esta funcion se le pasa un id de la tabla condiciones_alimentarias y devuelve el total de jugadores con esa condicion.  Tambien, se le pasa el sexo a seleccionar.

RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_id INT;

IF sexo_param = "F" THEN
SET total_id = 
(SELECT COUNT(jf.id_comida) FROM condicion_alimentaria AS ca 
JOIN jugador_f AS jf ON ca.id_comidas = jf.id_comida
WHERE jf.id_comida = id_comida_param GROUP BY ca.id_comidas);

ELSE IF sexo_param = "M" THEN

SET total_id = 
(SELECT COUNT(jm.id_comida) FROM condicion_alimentaria AS ca 
JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
WHERE jm.id_comida = id_comida_param GROUP BY ca.id_comidas);
END IF;

END IF;

RETURN (total_id);
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION total_contar_comidas(id_comida_param INT)
# A esta funcion se le pasa un id de la tabla condiciones_alimentarias y devuelve la cantidad de jugadores con esta condicion tanto de femeninos, como masculinos.
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

SET total_m = 
(SELECT COUNT(jm.id_comida) FROM condicion_alimentaria AS ca 
JOIN jugador_m AS jm ON ca.id_comidas = jm.id_comida
WHERE jm.id_comida = id_comida_param GROUP BY ca.id_comidas);

SET total_id = total_f + total_m;

RETURN (total_id);

END $$
DELIMITER ;

#############################################################
#############################################################
######################  FIN - FUNCIONES  ####################
#############################################################
#############################################################