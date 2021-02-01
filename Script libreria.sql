-- Database: dblibreria

-- SCRIPT PARA LA BASE DE DATOS LIBRERÍA
-- REYES HERNANDEZ ERIK JAHAZIEL

create schema libreria authorization postgres;

set search_path to libreria;

create table Proveedor (
	id_proveedor serial primary key,
	razon_social varchar (50),
	ciudad varchar (30),
	telefono numeric (10,0),
	email varchar (40)
);

create table Libro (
	id_libro serial primary key,
	isbn numeric (13,0),
	titulo varchar (80),
	editorial varchar (50),
	precio_v numeric (10,2),
	precio_c numeric (10,2),
	existencia int,
	id_proveedor int,
	foreign key (id_proveedor) references Proveedor (id_proveedor)
);

create table Autor (
	id_autor serial primary key,
	nombre varchar (30),
	apellidos varchar (30)
);

create table Autor_Libro (
	id_autor int,
	id_libro int,
	foreign key (id_autor) references Autor (id_autor),
	foreign key (id_libro) references Libro (id_libro)
);

create table Empleado (
	id_empleado serial primary key,
	nombre varchar (30),
	apellido_materno varchar (15),
	apellido_paterno varchar (15),
	fecha_ingreso date,
	fecha_nacimiento date,
	turno varchar (15),
	tipo_usuario varchar (25),
	celular numeric (10,0),
	pass varchar (10),
	usuario varchar (22),
	estado varchar (15)
);

create table Compra (
	id_compra serial primary key,
	fecha date,
	id_proveedor int,
	foreign key (id_proveedor) references Proveedor (id_proveedor)
);

create table Detalle_Compra (
	id_compra int,
	id_libro int,
	cantidad int,
	foreign key (id_compra) references Compra (id_compra),
	foreign key (id_libro) references Libro (id_libro)
);

create table Venta (
	id_venta serial primary key,
	fecha date,
	id_empleado int,
	foreign key (id_empleado) references Empleado (id_empleado)
);

alter table libreria.venta add column numSerie varchar(10);

create table Detalle_Venta (
	id_venta int,
	id_libro int,
	cantidad int,
	precio_v numeric (10, 2),
	foreign key (id_venta) references Venta (id_venta),
	foreign key (id_libro) references Libro (id_libro)
);

create table Devolucion (
	id_devolucion serial primary key,
	fecha date,
	id_empleado int,
	id_venta int,
	foreign key (id_empleado) references Empleado (id_empleado),
	foreign key (id_venta) references Venta (id_venta)
);

create table Detalle_Devolucion (
	id_devolucion int,
	id_libro int,
	cantidad int,
	motivo varchar (60),
	foreign key (id_devolucion) references Devolucion (id_devolucion),
	foreign key (id_libro) references Libro (id_libro)
);