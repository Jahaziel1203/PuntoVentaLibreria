-- Inserciones iniciales en las tablas de la base de datos
-- ERIK JAHAZIEL REYES HERNANDEZ

set search_path to libreria;

-- Inserciones de proveedores
insert into proveedor (razon_social, ciudad, telefono, email) values 
					('Larouse', 'CDMX', '5552919493', 'larouse@gmail.com'),
					('Mc Graw Hill', 'CDMX', '9283627384', 'mchill@gmail.com'),
					('Trillas', 'Guadalajara', '1738493847', 'trillas@gmail.com');
select * from proveedor;


-- Inserciones en autores
insert into autor (nombre, apellidos) values
				('Dennis', 'Zill'),
				('Mario', 'Triola'),
				('Miguel', 'de Cervantes');
select * from autor;


-- Inserciones en los libros
insert into libro (isbn, titulo, editorial, precio_v, precio_c, id_proveedor) values
				(7502957253725, 'Diccionario escolar', 'Larouse', 150.00, 100.00, 1),
				(7502957253726, 'Diccionario en ingles', 'Mc Graw Hill', 203.00, 150.00, 2),
				(7502957253727, 'Arquitectura de computadoras', 'Trillas', 465.00, 380.00, 3),
				(7502957253728, 'Calculo integral', 'Larouse', 220.00, 170.00, 1),
				(7502957253729, 'Contabilidad', 'Trillas', 600.00, 400.00, 2),
				(7502957253730, 'Don Quijote de la mancha', 'Francisco de Robles', 900.00, 690.00, 3);
select * from libro;


-- Inserciones en la tabla autor_libro
insert into autor_libro values 
				(1, 4),
				(3, 6);
select * from autor_libro;


-- Inserciones en la tabla empleado
insert into empleado (nombre, apellido_materno, apellido_paterno, fecha_ingreso, fecha_nacimiento, turno, celular, tipo_usuario, usuario, pass) values
	('Erik', 'Reyes', 'Hernandez', '01-01-2020', '12-03-1999', 'Matutino', 9510000000, 'administrador', 'admi', '1234admi'),
	('Oscar', 'Ramirez', 'Hernandez', '01-01-2020', '01-01-1999', 'Vespertino', 9510000001, 'cajero', 'caje', '1234caje'),
	('Juan', 'Perez', 'Perez', '01-03-2020', '30-05-1985', 'Matutino', 9510000002, 'servicio al cliente', 'serv', '1234serv');
select * from empleado;


-- Inserciones en la tabla compra
insert into compra (id_proveedor) values
	(1),
	(2),
	(3);
select * from compra;



-- Inserciones en la tabla detalle compra
insert into detalle_compra (id_compra, id_libro, cantidad) values
	(1, 1, 5),
	(1, 4, 5);
select * from detalle_venta;


-- Inserciones en la tabla venta
insert into venta (id_empleado) values (2);
select * from venta;

update libreria.venta set numSerie = '0000000001' where id_venta = 1;


-- Inserciones en la tabla detalle_venta
insert into detalle_venta (id_venta, id_libro, cantidad) values (1, 1, 1);
select * from detalle_venta;


-- Inserciones en la tabla devoluciones
insert into devolucion (id_empleado, id_venta) values (2, 1);
select * from devolucion;


-- Inserciones en la tabla detalle_devolucion
insert into detalle_devolucion (id_devolucion, id_libro, cantidad, motivo) values
	(1, 1, 1, 'Pasta rota');
select * from detalle_devolucion;