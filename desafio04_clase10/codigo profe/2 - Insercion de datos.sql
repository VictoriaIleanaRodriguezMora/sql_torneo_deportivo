-- Curso SQL
-- Clase 10 - Workshop I
-- Repaso y ejemplo de lo aprendido hasta ahora
-- Profesor: César Aracena

-- INSERCION DE DATOS DE EJEMPLO

USE workshop;

INSERT INTO workshop.categorias_productos (categoria) VALUES
('Remeras'),
('Pantalones'),
('Shorts'),
('Sweaters'),
('Bufandas'),
('Calzado'),
('Accesorios'),
('Sombreros');

INSERT INTO workshop.clientes (nombre, apellido, tipo_documento, documento) VALUES
('Olivie', 'Gedge', 'DNI', 41583858),
('Dorisa', 'Plaide', 'DNI', 70786024),
('Odele', 'Oty', 'DNI', 16859433),
('Isa', 'Claworth', 'DNI', 42601623),
('Flss', 'de Savery', 'DNI', 77587267),
('Gypsy', 'Harlock', 'DNI', 53034717),
('Dasie', 'Mutch', 'DNI', 42982298),
('Tiffany', 'Maffioni', 'DNI', 38140449),
('Patrice', 'Chaucer', 'DNI', 56842451),
('Berthe', 'Beaumont', 'DNI', 22990556),
('Gussy', 'Salsberg', 'DNI', 34561127),
('Annamaria', 'Tills', 'DNI', 45001795),
('Maurice', 'Tremethack', 'DNI', 22057450),
('Natty', 'Jepensen', 'DNI', 22850070),
('Austin', 'Solloway', 'DNI', 16298173),
('Sid', 'Pasterfield', 'DNI', 74661561),
('Mercie', 'Earl', 'DNI', 74128279),
('Tamiko', 'Wyness', 'DNI', 27888190),
('Darbie', 'Chugg', 'DNI', 22722635),
('Blancha', 'O''Nowlan', 'DNI', 66410914),
('Sallee', 'Roxbrough', 'DNI', 52121065),
('Maurice', 'Cogzell', 'DNI', 74786130),
('Laryssa', 'Wedlock', 'DNI', 72479091),
('Haven', 'Driussi', 'DNI', 15695716),
('Cheri', 'Carreck', 'DNI', 49191283),
('Griselda', 'Swancock', 'DNI', 48393644),
('Rhys', 'Troup', 'DNI', 43470820),
('Dulce', 'Glacken', 'DNI', 65024755),
('Augustus', 'Pomeroy', 'DNI', 65027202),
('Harlan', 'Goodisson', 'DNI', 26579818);

INSERT INTO workshop.vendedores (nombre, apellido, tipo_documento, documento) VALUES
('Agustin', 'Sortero', 'DNI', '65434565'),
('Sofia', 'Diestra', 'DNI', '34525456'),
('Monica', 'Gonzales', 'DNI', '65475667');

INSERT INTO workshop.fabricantes (nombre, contacto, clave_facturacion) VALUES
('Zapatos Moreno', 'Jimena Bradon', '23-12312323-2'),
('Pilchas Juanita', 'Juana Banana', '24-34534545-3'),
('Telas y cortes', 'Telocorto Timoteo', '25-45645645-1'),
('Sombreros Heros', 'Heros Fierros', '27-76767546-9');

INSERT INTO workshop.direcciones (id_cliente, id_vendedor, id_proveedor, direccion, ciudad, provincia, cod_postal, pais, direccion_principal) VALUES
(27, NULL, NULL, '304 Melvin Plaza', 'Mobile', 'Alabama', 51010, 'United States', 1),
(28, NULL, NULL, '86 Bartelt Road', 'Springfield', 'Massachusetts', 36406, 'United States', 1),
(1, NULL, NULL, '53 Riverside Point', 'Chicago', 'Illinois', 63807, 'United States', 1),
(15, NULL, NULL, '153 Ridgeview Point', 'Fort Lauderdale', 'Florida', 49083, 'United States', 1),
(29, NULL, NULL, '1 West Parkway', 'Huntington', 'West Virginia', 31589, 'United States', 0),
(20, NULL, NULL, '9723 Lindbergh Circle', 'Pittsburgh', 'Pennsylvania', 7615, 'United States', 0),
(3, NULL, NULL, '8864 Meadow Ridge Circle', 'Washington', 'District of Columbia', 68024, 'United States', 0),
(11, NULL, NULL, '18595 Bartelt Trail', 'Rockville', 'Maryland', 71298, 'United States', 0),
(3, NULL, NULL, '751 Sommers Drive', 'Athens', 'Georgia', 5506, 'United States', 1),
(17, NULL, NULL, '7913 Hanson Point', 'Columbus', 'Ohio', 21554, 'United States', 1),
(2, NULL, NULL, '80 Crest Line Junction', 'Knoxville', 'Tennessee', 9412, 'United States', 0),
(23, NULL, NULL, '72 Melvin Circle', 'Washington', 'District of Columbia', 70706, 'United States', 0),
(23, NULL, NULL, '4094 Norway Maple Drive', 'Anchorage', 'Alaska', 25099, 'United States', 0),
(23, NULL, NULL, '45 Nova Court', 'New York City', 'New York', 15714, 'United States', 1),
(23, NULL, NULL, '3 Goodland Junction', 'Columbus', 'Georgia', 28541, 'United States', 0),
(19, NULL, NULL, '22 Darwin Parkway', 'Monticello', 'Minnesota', 50928, 'United States', 0),
(29, NULL, NULL, '2260 Northview Trail', 'Scranton', 'Pennsylvania', 67393, 'United States', 0),
(15, NULL, NULL, '17074 Erie Street', 'New York City', 'New York', 57220, 'United States', 0),
(15, NULL, NULL, '85 Holy Cross Drive', 'Wichita Falls', 'Texas', 3396, 'United States', 1),
(15, NULL, NULL, '94784 Sundown Plaza', 'Hyattsville', 'Maryland', 27272, 'United States', 0),
(14, NULL, NULL, '152 Petterle Parkway', 'Pueblo', 'Colorado', 49609, 'United States', 0),
(7, NULL, NULL, '94434 Grim Circle', 'Loretto', 'Minnesota', 33077, 'United States', 0),
(29, NULL, NULL, '993 South Way', 'Minneapolis', 'Minnesota', 35317, 'United States', 1),
(29, NULL, NULL, '4 Valley Edge Center', 'Anaheim', 'California', 42674, 'United States', 0),
(8, NULL, NULL, '698 Sloan Junction', 'Houston', 'Texas', 66730, 'United States', 1),
(4, NULL, NULL, '23302 Kipling Circle', 'Philadelphia', 'Pennsylvania', 35237, 'United States', 0),
(5, NULL, NULL, '85 Grasskamp Plaza', 'Portland', 'Oregon', 67619, 'United States', 1),
(15, NULL, NULL, '3 Maryland Circle', 'Pueblo', 'Colorado', 36265, 'United States', 0),
(7, NULL, NULL, '08912 Independence Center', 'Orlando', 'Florida', 58825, 'United States', 1),
(23, NULL, NULL, '98 Debra Parkway', 'Fort Lauderdale', 'Florida', 78075, 'United States', 0),
(NULL, 1, NULL, '4 Valley Edge Center', 'Anaheim', 'California', 42674, 'United States', 1),
(NULL, 2, NULL, '698 Sloan Junction', 'Houston', 'Texas', 66730, 'United States', 1),
(NULL, 3, NULL, '23302 Kipling Circle', 'Philadelphia', 'Pennsylvania', 35237, 'United States', 1),
(NULL, NULL, 1, '8864 Meadow Ridge Circle', 'Washington', 'District of Columbia', 68024, 'United States', 1),
(NULL, NULL, 2, '18595 Bartelt Trail', 'Rockville', 'Maryland', 71298, 'United States', 1),
(NULL, NULL, 3, '751 Sommers Drive', 'Athens', 'Georgia', 5506, 'United States', 1),
(NULL, NULL, 4, '7913 Hanson Point', 'Columbus', 'Ohio', 21554, 'United States', 1);

INSERT INTO workshop.emails (id_cliente, id_vendedor, id_proveedor, email, email_principal) VALUES
(25, NULL, NULL, 'mocalleran0@time.com', 0),
(26, NULL, NULL, 'sthacke1@businesswire.com', 1),
(30, NULL, NULL, 'ngoulbourn2@gnu.org', 0),
(2, NULL, NULL, 'estockwell3@behance.net', 1),
(3, NULL, NULL, 'pscamerden4@marriott.com', 1),
(29, NULL, NULL, 'achasmoor5@gizmodo.com', 1),
(13, NULL, NULL, 'mivoshin6@jugem.jp', 1),
(5, NULL, NULL, 'sstealfox7@wufoo.com', 0),
(19, NULL, NULL, 'tonions8@elpais.com', 0),
(6, NULL, NULL, 'dbleasdille9@weather.com', 0),
(1, NULL, NULL, 'aoshevlana@foxnews.com', 0),
(1, NULL, NULL, 'vderyebarrettb@reuters.com', 1),
(8, NULL, NULL, 'mpolinic@netscape.com', 1),
(18, NULL, NULL, 'ojaycockd@bloomberg.com', 0),
(1, NULL, NULL, 'ctotteme@usgs.gov', 0),
(29, NULL, NULL, 'swoodcraftf@imdb.com', 1),
(19, NULL, NULL, 'alauretg@abc.net.au', 1),
(14, NULL, NULL, 'dwillingaleh@people.com.cn', 1),
(20, NULL, NULL, 'lweildi@craigslist.org', 0),
(25, NULL, NULL, 'aclashj@sfgate.com', 0),
(27, NULL, NULL, 'mtorrentk@economist.com', 1),
(20, NULL, NULL, 'kaldissl@moonfruit.com', 1),
(17, NULL, NULL, 'tscalesm@nytimes.com', 1),
(20, NULL, NULL, 'amauldenn@mac.com', 0),
(21, NULL, NULL, 'hbestmano@123-reg.co.uk', 1),
(22, NULL, NULL, 'gterrettp@discuz.net', 1),
(23, NULL, NULL, 'csimkinq@comsenz.com', 1),
(4, NULL, NULL, 'olockwoodr@taobao.com', 1),
(17, NULL, NULL, 'abeatens@angelfire.com', 0),
(8, NULL, NULL, 'ffanningt@businesswire.com', 0),
(NULL, 1, NULL, 'gterrdettp@discuz.net', 1),
(NULL, 2, NULL, 'csimkeinq@comsenz.com', 1),
(NULL, 3, NULL, 'olockswoodr@taobao.com', 1),
(NULL, NULL, 1, 'ctottemfe@usgs.gov', 1),
(NULL, NULL, 2, 'swoodcdraftf@imdb.com', 1),
(NULL, NULL, 3, 'alaurestg@abc.net.au', 1),
(NULL, NULL, 4, 'dwillgingaleh@people.com.cn', 1);

INSERT INTO workshop.productos (id_categoria, id_fabricante, nombre, descripcion, color, talle, precio) VALUES
(1, 2, 'Remera Lisa Primavera', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc aliquam nunc eget aliquet ultrices. Class aptent taciti sociosqu ad litora torquent per conubia nostra', 'Blanco', 'M', 1099.99),
(2, 3, 'Pantalon Rayado Suelto', 'Praesent eget luctus turpis. Nunc ac congue risus', 'Gris', 'S', 799.90),
(2, 3, 'Pantalon Rayado Suelto', 'Praesent eget luctus turpis. Nunc ac congue risus', 'Gris', 'M', 799.90),
(2, 3, 'Pantalon Rayado Suelto', 'Praesent eget luctus turpis. Nunc ac congue risus', 'Gris', 'L', 799.90),
(2, 3, 'Pantalon Rayado Suelto', 'Praesent eget luctus turpis. Nunc ac congue risus', 'Gris', 'XL', 799.90),
(8, 4, 'Sombrero Elegante Caribe', 'Quisque eros est, ullamcorper eu justo in, fermentum eleifend purus. Nullam eu maximus nunc. Ut varius aliquet tincidunt. Praesent a ex eros', 'Madera', '7', 489.90),
(8, 4, 'Sombrero Elegante Caribe', 'Quisque eros est, ullamcorper eu justo in, fermentum eleifend purus. Nullam eu maximus nunc. Ut varius aliquet tincidunt. Praesent a ex eros', 'Madera', '8', 489.90),
(8, 4, 'Sombrero Elegante Caribe', 'Quisque eros est, ullamcorper eu justo in, fermentum eleifend purus. Nullam eu maximus nunc. Ut varius aliquet tincidunt. Praesent a ex eros', 'Madera', '9', 489.90);

INSERT INTO workshop.telefonos (id_cliente, id_vendedor, id_proveedor, cod_pais, telefono, telefono_principal) VALUES
(1, NULL, NULL, 53, 92215171, 0),
(1, NULL, NULL, 53, 98786756, 1),
(2, NULL, NULL, 55, 69612438, 1),
(3, NULL, NULL, 52, 81663583, 1),
(4, NULL, NULL, 53, 23214311, 1),
(5, NULL, NULL, 56, 84334227, 1),
(6, NULL, NULL, 57, 19793555, 1),
(6, NULL, NULL, 57, 23453432, 0),
(7, NULL, NULL, 56, 18203276, 1),
(8, NULL, NULL, 58, 27958006, 1),
(9, NULL, NULL, 56, 40690515, 1),
(10, NULL, NULL, 58, 46538920, 1),
(11, NULL, NULL, 56, 46367335, 1),
(12, NULL, NULL, 52, 28358358, 1),
(13, NULL, NULL, 57, 78195456, 1),
(14, NULL, NULL, 55, 77483515, 1),
(15, NULL, NULL, 55, 24989743, 1),
(16, NULL, NULL, 58, 15198942, 1),
(17, NULL, NULL, 58, 92610691, 1),
(18, NULL, NULL, 53, 64696895, 1),
(19, NULL, NULL, 53, 96125691, 1),
(20, NULL, NULL, 58, 40848371, 1),
(21, NULL, NULL, 52, 54440738, 1),
(22, NULL, NULL, 54, 27547297, 1),
(23, NULL, NULL, 58, 63793706, 1),
(24, NULL, NULL, 52, 39724570, 1),
(25, NULL, NULL, 58, 35135536, 1),
(26, NULL, NULL, 53, 67176888, 1),
(27, NULL, NULL, 53, 65461242, 1),
(28, NULL, NULL, 58, 78559627, 1),
(29, NULL, NULL, 54, 20023634, 1),
(30, NULL, NULL, 52, 40176136, 1),
(NULL, 1, NULL, 57, 78195456, 1),
(NULL, 2, NULL, 55, 77483515, 1),
(NULL, 3, NULL, 55, 24989743, 1),
(NULL, NULL, 1, 58, 15198942, 1),
(NULL, NULL, 2, 58, 92610691, 1),
(NULL, NULL, 3, 53, 64696895, 1),
(NULL, NULL, 4, 53, 96125691, 1);

INSERT INTO workshop.facturacion (id_cliente, id_vendedor, subtotal, iva, total) VALUES
(1, 2, 1899.89, 398.98, 2298.87),
(3, 3, 1289.80, 270.86, 1560.66),
(6, 1, 489.90, 102.88, 592.78),
(14, 1, 2389.79, 501.86, 2891.65);

INSERT INTO workshop.productos_facturados (id_factura, id_producto, cantidad, precio) VALUES
(1, 1, 1, 1099.99),
(1, 3, 1, 799.90),
(2, 2, 1, 799.90),
(2, 6, 1, 489.90),
(3, 8, 1, 489.90),
(4, 1, 1, 1099.90),
(4, 2, 1, 799.90),
(4, 7, 1, 489.90);









