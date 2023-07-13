CREATE DATABASE TorneoDeportivoVictoriaRodriguez;

USE TorneoDeportivoVictoriaRodriguez;
# Si en mi computadora no arrojo esta linea, no me permite insertar dato en las tablas que tienen FK
-- SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.club(
	id_club INT AUTO_INCREMENT,
    nombre_club VARCHAR(60) NOT NULL,
    PRIMARY KEY (id_club)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.jugador_f (
	id_jugador_f INT AUTO_INCREMENT ,
    nombre_j TEXT(40) NOT NULL,
    apellido_j TEXT(40) NOT NULL,
    dni_j INT(11) NOT NULL ,
    categoria INT(4) NOT NULL,
    numero_camiseta INT(2) NOT NULL,
    camiseta_talle TEXT(10) NOT NULL,
    pantalon_talle TEXT(10) NOT NULL,
    partidos_jugados INT NOT NULL,
    goles INT NOT NULL,
	sexo char DEFAULT 'F',
    id_club INT,
    id_comida INT,
    id_posicion INT,
    PRIMARY KEY (id_jugador_f),
    INDEX dni_j (dni_j)
    , CONSTRAINT fk_id_club FOREIGN KEY (id_jugador_f) REFERENCES club (id_club) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.jugador_m (
	id_jugador_m INT AUTO_INCREMENT ,
    nombre_j TEXT(40) NOT NULL,
    apellido_j TEXT(40) NOT NULL,
    dni_j INT(11) NOT NULL ,
    categoria INT(4) NOT NULL,
    numero_camiseta INT(2) NOT NULL,
    camiseta_talle TEXT(10) NOT NULL,
    pantalon_talle TEXT(10) NOT NULL,
    partidos_jugados INT NOT NULL,
    goles INT NOT NULL,
	sexo char DEFAULT 'M',
    id_club INT,
    id_comida INT,
	id_posicion INT,
    PRIMARY KEY (id_jugador_m),
    INDEX dni_j (dni_j)
    , CONSTRAINT fk_id_club_m FOREIGN KEY (id_jugador_m) REFERENCES club (id_club)  ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.equipo_f (
	id_equipo_f INT AUTO_INCREMENT,
    categoria INT NOT NULL,
    id_dt INT  NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT(0),
    partidos_a_jugar INT NOT NULL DEFAULT(0),
	sexo char DEFAULT 'F',
    id_club INT  NOT NULL,
    PRIMARY KEY (id_equipo_f),
    INDEX (categoria, id_club)
    -- foreign key categoria y id_equipo y id_club
	, CONSTRAINT fk_id_equipo_f FOREIGN KEY (id_equipo_f) REFERENCES club (id_club) ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.equipo_m (
	id_equipo_m INT AUTO_INCREMENT,
    categoria INT NOT NULL,
    id_dt INT  NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT(0),
    partidos_a_jugar INT NOT NULL DEFAULT(0),
	sexo char DEFAULT 'M',
    id_club INT  NOT NULL,
    PRIMARY KEY (id_equipo_M),
    INDEX (categoria, id_club)
    -- foreign key categoria y id_equipo y id_club
	, CONSTRAINT fk_id_equipo_m FOREIGN KEY (id_equipo_m) REFERENCES club (id_club) ON UPDATE CASCADE

);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.categoria (
	id_cat INT AUTO_INCREMENT,
    categoria INT NOT NULL,
    PRIMARY KEY (id_cat)
    -- foreign key categoria por que voy a realizar busquedas por la categoria de un jugador
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.partido_f (
	id_partido INT AUTO_INCREMENT,
    id_arbitro INT NOT NULL,
	fecha_hora DATETIME NOT NULL,
    categoria INT NOT NULL DEFAULT 0, 
    id_equipo_local INT NOT NULL,
    id_equipo_visitante INT NOT NULL,
    equipo_local_goles INT NOT NULL DEFAULT 0,
	equipo_visitante_goles INT NOT NULL DEFAULT 0,
    id_equipo_ganador INT NOT NULL DEFAULT 0,
    id_equipo_perdedor INT NOT NULL DEFAULT 0,
    finalizado_correctamente TINYINT,
    sexo_j CHAR DEFAULT 'F',
    PRIMARY KEY (id_partido)
    -- foreign key id_equipo_local y visitante 
	, CONSTRAINT fk_id_equipo_local_f FOREIGN KEY (id_equipo_local) REFERENCES club (id_club)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.partido_m (
	id_partido INT AUTO_INCREMENT,
    id_arbitro INT NOT NULL,
	fecha_hora DATETIME NOT NULL,
    categoria INT NOT NULL DEFAULT 0, 
    id_equipo_local INT NOT NULL,
    id_equipo_visitante INT NOT NULL,
    equipo_local_goles INT NOT NULL DEFAULT 0,
	equipo_visitante_goles INT NOT NULL DEFAULT 0,
    id_equipo_ganador INT NOT NULL DEFAULT 0,
    id_equipo_perdedor INT NOT NULL DEFAULT 0,
    finalizado_correctamente TINYINT,
    sexo_j CHAR DEFAULT 'M',
    PRIMARY KEY (id_partido)
    -- foreign key id_equipo_local y visitante 
	, CONSTRAINT fk_id_equipo_local_m FOREIGN KEY (id_equipo_local) REFERENCES club (id_club)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.posicion (
	id_posicion INT AUTO_INCREMENT UNIQUE,
    nombre_posicion TEXT(18) NOT NULL,
	nombre_posicion_corto TEXT(10) NOT NULL,
    PRIMARY KEY (id_posicion)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.arbitro (
	id_arbitro  INT AUTO_INCREMENT UNIQUE,
	nombre_a TEXT NOT NULL,
    apellido_a TEXT(40) NOT NULL,
    dni_a INT(11) NOT NULL,
    años_experiencia INT NOT NULL,
    mail VARCHAR(80) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    id_partido INT, -- foreign key partido
    PRIMARY KEY (id_arbitro),
    INDEX dni_a (dni_a)
);


CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.goleador (
	id_goleador INT AUTO_INCREMENT,
	id_jugador INT,
    categoria INT(4) NOT NULL,
    cantidad_partidos_jugados INT NOT NULL,
    miuntos_jugados INT NOT NULL,
    goles INT NOT NULL,
    id_club INT NOT NULL,
    PRIMARY KEY (id_goleador)
    -- fk id_jugador, categoria
    -- indice cantidad_partidos
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.condicion_alimentaria (
	id_comidas INT AUTO_INCREMENT,
	nombre_condicion TEXT(25),
    PRIMARY KEY (id_comidas)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.talle (
	id_talle INT AUTO_INCREMENT,
	talle TEXT(25) NOT NULL,
    talle_por_tamaño TEXT(25) NOT NULL,
    PRIMARY KEY (id_talle)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.periodista (
	id_periodista INT AUTO_INCREMENT,
	nombre_p	TEXT(40)  NOT NULL,
	apellido_p	TEXT(40)  NOT NULL,
    dni_p	INT(11)	NOT NULL,
	mail_p VARCHAR(80) NOT NULL,
	telefono_p VARCHAR(20) NOT NULL,
	años_experiencia_p INT NOT NULL,
    prensa TEXT(45),
    PRIMARY KEY (id_periodista)
    -- FK PRENSA para ver a cual pertenece
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.televisacion_prensa (
	id_prensa INT	NOT NULL  AUTO_INCREMENT,
	nro_camaras_disponibles	INT  NOT NULL,
	trae_periodista	TINYINT  NOT NULL,
    id_periodista INT	NOT NULL,
	remuneracion DECIMAL(10, 2)	NOT NULL,
	nombre_empresa	TEXT(60)	NOT NULL,
	mail VARCHAR(80) NOT NULL,
	 telefono VARCHAR(20) NOT NULL,
    oficina_direccion	VARCHAR(60)	NOT NULL,
    PRIMARY KEY (id_prensa)
);

CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.televisacion_prensa (
	id_prensa INT	NOT NULL  AUTO_INCREMENT,
	nro_camaras_disponibles	INT  NOT NULL,
	trae_periodista	TINYINT  NOT NULL,
    id_periodista INT	NOT NULL,
	remuneracion DECIMAL(10, 2)	NOT NULL,
	nombre_empresa	TEXT(60)	NOT NULL,
	mail VARCHAR(80) NOT NULL,
	 telefono VARCHAR(20) NOT NULL,
    oficina_direccion	VARCHAR(60)	NOT NULL,
    PRIMARY KEY (id_prensa)
);


CREATE TABLE IF NOT EXISTS TorneoDeportivoVictoriaRodriguez.autoridad_torneo (
	id_autoridad	INT	NOT NULL  AUTO_INCREMENT,
	nombre_autoridad	TEXT(40) NOT NULL,
	apellido_autoridad	TEXT(40) NOT NULL,
    dni	INT	NOT NULL,
	nombre_torneo	VARCHAR(30)	NOT NULL,
	nombre_empresa	TEXT(60)	NOT NULL,
    PRIMARY KEY (id_autoridad)
);

SET FOREIGN_KEY_CHECKS = 0;