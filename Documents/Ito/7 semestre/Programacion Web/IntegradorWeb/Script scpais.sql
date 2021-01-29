select * from scpais.pais;

select * from scpais.ciudad;

create table scpais.pais (
	idpais serial primary key,
	pais varchar (20)
);

create table scpais.ciudad (
	idciudad serial primary key,
	idpais int not null,
	ciudad varchar(20),
	foreign key (idpais) references scpais.pais (idpais)
);

insert into scpais.pais (pais) values ('Mexico'), ('Argentina'), ('Estados Unidos');

insert into scpais.ciudad (idpais, ciudad) values
	(1, 'Oaxaca'),
	(1, 'Jalisco'),
	(3, 'New York');