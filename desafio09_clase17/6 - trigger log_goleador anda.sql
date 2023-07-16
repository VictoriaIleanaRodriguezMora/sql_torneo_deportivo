CREATE TRIGGER actualizar_goleadores
AFTER INSERT ON goleador
FOR EACH ROW
INSERT INTO log_goleador ( id_jugador, categoria, goles, id_club)
VALUES (NEW.id_jugador, NEW.categoria, NEW.goles, NEW.id_club)

