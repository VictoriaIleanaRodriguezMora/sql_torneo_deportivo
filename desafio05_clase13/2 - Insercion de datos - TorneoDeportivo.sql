USE torneodeportivovictoriarodriguez;

INSERT INTO torneodeportivovictoriarodriguez.arbitro (id_arbitro,nombre_a,apellido_a,dni_a,años_experiencia,mail,telefono)
VALUES 
(NULL,'Leonardo','Alvarez',25444666,3,'leonardo_alvarez311@gmail.com','5491133334444'),
(NULL,'Camila','Ortega',77888999,5,'cam51ortega@hotmail.com','5491145677894'),
(NULL,'Azul','Perez',55666222,4,'perezazul988@gmail.com','5491178945612')
;

INSERT INTO autoridad_torneo (id_autoridad,nombre_autoridad,apellido_autoridad,dni,nombre_torneo,nombre_empresa)
VALUES
(NULL,'Ismael','Ruiz',12345678,'FeMeBal','FederacionDeportiva'),
(NULL,'Viviana','Gonzalez',87654321,'FeMeBal','FederacionDeportiva'),
(NULL,'Ileana','Mora',45678954,'FeMeBal','FederacionDeportiva')
;

INSERT INTO club (id_club, nombre_club)
VALUES 
(NULL,'CASLA'),
(NULL,'CARP'),
(NULL,'CABJ'),
(NULL,'SEDALO'),
(NULL,'AAAJ'),
(NULL,'DORREGO'),
(NULL,'PLATENSE'),
(NULL,'SAG POLVORINES'),
(NULL,'LUJAN'),
(NULL,'VELEZ')
;

INSERT INTO categoria (id_cat, categoria)
VALUES 
(NULL,2000),
(NULL,1999),
(NULL,1998),
(NULL,1997),
(NULL,1996),
(NULL,1995)
;

INSERT INTO condicion_alimentaria (id_comidas,nombre_condicion)
VALUES
(NULL,'vegetariano'),
(NULL,'vegano'),
(NULL,'omnivoro'),
(NULL,'diabetico'),
(NULL,'celiaco')
;


INSERT INTO periodista (id_periodista,nombre_p,apellido_p,dni_p,mail_p,telefono_p,años_experiencia_p,prensa)
VALUES
(NULL,'Esteban','Echeverria',45126577,'eche_este@gmail.com','5491111123321',3,0),
(NULL,'Ludmila','Olivero',77888999,'olivero456@gmail.com','5491112344321',5,0),
(NULL,'Micaela','Sans',99542567,'micasans13@gmail.com','54977704777',4,0)
;

INSERT INTO posicion (id_posicion,nombre_posicion,nombre_posicion_corto)
VALUES
(NULL,'central','cen'),
(NULL,'armado_derecho','ar_der'),
(NULL,'armado_izquierdo','ar_izq'),
(NULL,'lateral_derecho','lat_der'),
(NULL,'lateral_izquierdo','lat_izq'),
(NULL,'arquero','arq'),
(NULL,'suplente','sup')
;

INSERT INTO televisacion_prensa (id_prensa,nro_camaras_disponibles,trae_periodista,id_periodista,remuneracion,nombre_empresa,mail,telefono,oficina_direccion)

VALUES
(NULL,20,1,1,40000,'A.S.G Entertainment','asgentertainment@gmail.com','5491145655566','Av. Boedo 450' ),
(NULL,40,0,0,65000,'Servicios TV TODO','tvtodo_contacto@hotmail.com','5491188253201', 'Av Libertador 666'),
(NULL,30,1,2,50000,'Hermanos CUH', 'cuhhnos@gmail.com' ,'5491185213698','Av Gaona 789')
;

INSERT INTO talle(id_talle, talle, talle_por_tamaño)
VALUES 
(NULL, 'S', 'S'),
(NULL, 'XS', 'S'),
(NULL, 'M', 'M'),
(NULL, 'L', 'L'),
(NULL, 'XL', 'L'),
(NULL, '2XL', 'L')
;

