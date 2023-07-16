CREATE TRIGGER al_insertar_goleadores
AFTER INSERT ON goleador
FOR EACH ROW
INSERT INTO log_goleador ( id_jugador, categoria, goles, id_club)
VALUES (NEW.id_jugador, NEW.categoria, NEW.goles, NEW.id_club);



CREATE TRIGGER al_actualizar_goleadores
AFTER UPDATE ON goleador
FOR EACH ROW
UPDATE log_goleador SET  id_jugador = NEW.id_jugador,  categoria = NEW.categoria, goles = NEW.goles, id_club = NEW.id_club,
  id_jugador_old = OLD.id_jugador WHERE NEW.categoria = OLD.categoria ;

