-- Funciones de la libreria
-- ERIK JAHAZIEL REYES HERNANDEZ

-----------------------------------------------------------------------------------------------------------
/* Funcion para obtener la informacion del detalle de venta simplificado */
create or replace function detalleVenta(id_venta int) returns table(isbn numeric (13), titulo varchar(80), 
												editorial varchar(50), precio_v numeric(10, 2), cantidad int) as
$$
	select l.isbn, l.titulo, l.editorial, dv.precio_v, dv.cantidad
	from libreria.libro as l natural join libreria.venta as v natural join libreria.detalle_venta as dv
	where v.id_venta = $1
	order by l.id_libro;
$$
language sql;

-- select * from detalleVenta(1);
-----------------------------------------------------------------------------------------------------------
/* Funcion para obtener la informacion del detalle de compra simplificado */
create or replace function detalleCompra(id_compra int) returns table(isbn numeric (13), titulo varchar(80), 
												editorial varchar(50), precio_c numeric(10, 2), cantidad int) as
$$
	select l.isbn, l.titulo, l.editorial, l.precio_c, dc.cantidad
	from libreria.libro as l natural join libreria.compra as v natural join libreria.detalle_compra as dc
	where v.id_compra = $1
	order by l.id_libro;
$$
language sql;

-- select * from detalleCompra(1);
-----------------------------------------------------------------------------------------------------------
/* Funcion para obtener la informacion del detalle de devolucion simplificado */
create or replace function detalleDevolucion(id_devolucion int) returns table(isbn numeric (13), 
	  titulo varchar(80), editorial varchar(50), precio_v numeric(10, 2), cantidad int, motivo varchar(60)) as
$$
	select l.isbn, l.titulo, l.editorial, l.precio_c, dd.cantidad, dd.motivo
	from libreria.libro as l natural join libreria.devolucion as v natural join libreria.detalle_devolucion as dd
	where v.id_devolucion = $1
	order by l.id_libro;
$$
language sql;

-- select * from detalleDevolucion(1);
-----------------------------------------------------------------------------------------------------------