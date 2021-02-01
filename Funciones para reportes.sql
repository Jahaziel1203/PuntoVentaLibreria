/* Funciones correspondientes a los reportes */
--Funcion que saca el total de ventas por dia
create or replace FUNCTION reporteVentas(fecha_i date, fecha_f date)
RETURNS TABLE(fecha date, total numeric)
as
$$
	SELECT fecha, sum(cantidad*precio_v) FROM libreria.venta NATURAL JOIN libreria.detalle_venta
	WHERE fecha BETWEEN $1 AND $2
	GROUP BY fecha ORDER BY fecha
$$
language sql;

--Funcion que saca el total de compras por dia
create or replace FUNCTION reporteCompras(fecha_i date, fecha_f date)
RETURNS TABLE(fecha date, total numeric)
as
$$
SELECT fecha, sum(cantidad*precio_c) FROM libreria.compra NATURAL JOIN libreria.detalle_compra NATURAL JOIN libreria.libro
WHERE fecha BETWEEN $1 AND $2
GROUP BY fecha ORDER BY fecha
$$
language sql;

/* Prueba de funcion por separado
SELECT * FROM reporteVentas('2021-01-28','2021-01-31');
SELECT * FROM reporteCompras('2021-01-28','2021-01-31');
*/

SELECT v.fecha, v.total, c.fecha as cfecha, c.total as ctotal 
FROM reporteVentas('2021-01-28','2021-01-31') 
	as v FULL OUTER JOIN reporteCompras('2021-01-28','2021-01-31')
	as c on v.fecha=c.fecha;