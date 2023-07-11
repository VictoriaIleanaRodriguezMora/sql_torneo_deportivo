CREATE VIEW workshop.productos_vw AS (
    SELECT 
        nombre AS nombre,
        descripcion AS descripcion,
        color AS color,
        precio AS precio
    FROM
        productos
    GROUP BY nombre, descripcion, color, precio
);