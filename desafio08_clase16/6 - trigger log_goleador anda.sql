CREATE TRIGGER actualizar_goleadores
AFTER UPDATE ON goleador
FOR EACH ROW
INSERT INTO log_goleador (id_goleador, id_jugador, categoria, goles, id_club)
VALUES (NEW.id_goleador, NEW.id_jugador, NEW.categoria, NEW.goles, NEW.goleadoractualizar_goleadoresid_club)

