-- Funciones y trigger de la libreria
-- ERIK JAHAZIEL REYES HERNANDEZ

set search_path to libreria;

-- drop trigger fechaCompraHoy on libreria.compra;
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para poner la existencia en 0 en un nuevo libro */
create or replace function existenciaCero() returns trigger as
$$
declare
	precio_c int;
	precio_v int;
begin
	precio_c = new.precio_c;
	precio_v = new.precio_v;
	
	if (precio_c < precio_v) then
		begin
			update libreria.libro set existencia = 0 where id_libro = new.id_libro;
			raise notice 'La existencia se puso en 0 correctamente';
			return new;
		end;
	else
		begin
			raise notice 'El precio de compra debe ser menor que el de venta';
			return null;
		end;
	end if;
end;
$$
language plpgsql;

create trigger existenciaInicial after insert on libreria.libro
for each row execute procedure existenciaCero();
-----------------------------------------------------------------------------------------------------------
/* 	Funcion y trigger para dejar en nulo los campos de usuario y contrasena en algunos empleados
	Funcion y trigger para poner la existencia en 0 en un nuevo libro */
create or replace function definirAcceso() returns trigger as
$$
declare
	id_e int;
begin
	id_e = new.id_empleado;
	if (new.tipo_usuario = 'servicio al cliente') then
		begin
			update libreria.empleado set estado = 'activo', usuario = null, pass = null where id_empleado = id_e;
			raise notice 'Empleado sin credenciales para acceso al sistema';
			return new;
		end;
	else
		begin
			update libreria.empleado set estado = 'activo' where id_empleado = id_e;
			raise notice 'Empleado con credenciales para acceso al sistema';
			return new;
		end;
	end if;
end;
$$
language plpgsql;

create trigger definirAccesoEmpleado after insert on libreria.empleado
for each row execute procedure definirAcceso();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para poner la fecha de compra como hoy */
create or replace function fechaCompra() returns trigger as
$$
declare

begin	
	update libreria.compra set fecha = current_date where id_compra = new.id_compra;
	raise notice 'La existencia se puso en 0 correctamente';
	return new;
end;
$$
language plpgsql;

create trigger fechaCompraHoy after insert on libreria.compra
for each row execute procedure fechaCompra();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para actualizar la existencia despues de una compra */
create or replace function actualizaCantComp() returns trigger as
$$
declare
	cantidad int;
	existenciaA int;
begin
	cantidad = new.cantidad;
	
	update libreria.libro set existencia = existencia + cantidad where id_libro = new.id_libro;
	raise notice 'La existencia se actualizo correctamente';
	return new;
end;
$$
language plpgsql;

create trigger actualizaCantCompra after insert on libreria.detalle_compra
for each row execute procedure actualizaCantComp();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para poner la fecha de venta como hoy */
create or replace function fechaVenta() returns trigger as
$$
declare

begin	
	update libreria.venta set fecha = current_date where id_venta = new.id_venta;
	raise notice 'La fecha de venta se puso correctamente';
	return new;
end;
$$
language plpgsql;

create trigger fechaVentaHoy after insert on libreria.venta
for each row execute procedure fechaVenta();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para actualizar la cantidad en existencia despues de una venta */
create or replace function actualizaCantVenta() returns trigger as
$$
declare
	cantidad int;
	existenciaA int;
begin
	cantidad:=new.cantidad;
	existenciaA:= (select existencia from libreria.libro where id_libro = new.id_libro);
	
	if (cantidad <= existenciaA) then
		begin
			update libreria.libro set existencia = existencia - cantidad where id_libro = new.id_libro;
			raise notice 'La existencia se actualizo correctamente';
			return new;
		end;
	else
		begin
			raise notice 'No se puede vender esa cantidad solo se tienen % ejemplares',existenciaA;
			return null;
		end;
	end if;
end;
$$
language plpgsql;

create trigger actualizaCantVenta before insert on libreria.detalle_venta
for each row execute procedure actualizaCantVenta();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para fijar el precio de venta en los detalles de una venta */
create or replace function fijaPrecioV() returns trigger as
$$
declare
	precio int;
begin
	precio:= (select precio_v from libreria.libro where id_libro = new.id_libro);
	
	update libreria.detalle_venta set precio_v = precio where id_libro = new.id_libro and id_venta = new.id_venta;
	raise notice 'El precio se fijó correctamente';
	return new;
end;
$$
language plpgsql;

create trigger fijarPrecioVenta after insert on libreria.detalle_venta
for each row execute procedure fijaPrecioV();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para poner la fecha de devolucion como hoy */
create or replace function fechaDevolucion() returns trigger as
$$
declare

begin	
	update libreria.devolucion set fecha = current_date where id_devolucion = new.id_devolucion;
	raise notice 'La fecha de devolución se puso correctamente';
	return new;
end;
$$
language plpgsql;

create trigger fechaDevolucionHoy after insert on libreria.devolucion
for each row execute procedure fechaDevolucion();
-----------------------------------------------------------------------------------------------------------
/* Funcion y trigger para actualizar la existencia despues de una devolucion */
create or replace function actualizaCantDevo() returns trigger as
$$
declare
	cantD int;
	id_v int;
	id_l int;
	cantV int;
	id_d int;
begin
	cantD = new.cantidad;
	id_d = new.id_devolucion;
	id_l = new.id_libro;
	id_v = (select id_venta from libreria.devolucion where id_devolucion = id_d);
	cantV = (select cantidad from libreria.detalle_venta where id_venta = id_v and id_libro = id_l);
	
	if (cantV >= cantD) then
		begin
			update libreria.libro set existencia = existencia + cantD where id_libro = id_l;
			update libreria.detalle_venta set cantidad = cantidad - cantD where id_libro = id_l and id_venta = id_v;
			raise notice 'La existencia se actualizo correctamente';
			return new;
		end;
	else
		begin
			delete from detalle_devolucion where id_devolucion = id_d and id_libro = id_l and cantidad = cantD;
			raise notice 'No se pueden devolver % ejemplares ya que solo se vendieron %', cantD, cantV;
			return null;
		end;
	end if;
end;
$$
language plpgsql;

create trigger actualizaCantCDevolucion after insert on libreria.detalle_devolucion
for each row execute procedure actualizaCantDevo();
-----------------------------------------------------------------------------------------------------------