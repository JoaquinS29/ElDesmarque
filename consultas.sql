drop table JugadoresGoles;
drop table Jugadores;
drop table Equipos;

create table Equipos(
	id int primary key AUTO_INCREMENT,
	nombre varchar(20) not null
);

create table Jugadores(
	id int primary key AUTO_INCREMENT,
	id_equipo int not null references Equipo,
	nombre varchar(30)
);

create table JugadoresGoles(
	id_jugador int primary key references Jugadores,
	goles int not null
);

insert into Equipos(nombre) values('Sevilla');
insert into Equipos(nombre) values('Betis');

insert into Jugadores(id_equipo, nombre) values(1, 'Diego González');
insert into Jugadores(id_equipo, nombre) values(1, 'Vietto');
insert into Jugadores(id_equipo, nombre) values(2, 'Rubén Castro');
insert into Jugadores(id_equipo, nombre) values(2, 'Bruno');
insert into Jugadores(id_equipo, nombre) values(2, 'Adán');

insert into JugadoresGoles values(1, 9);
insert into JugadoresGoles values(2, 11);
insert into JugadoresGoles values(3, 10);
insert into JugadoresGoles values(4, 4);
insert into JugadoresGoles values(5, 3);

-- 1) Listar todos los jugadores junto con su equipo, ordenados por el nombre del equipo y el nombre del jugador.

select e.nombre, j.nombre from Equipos e, Jugadores j
where e.id = j.id_equipo order by e.nombre, j.nombre;

-- 2) Listar el total de goles marcados por cada equipo, ordenado por el total de goles.

select e.nombre, sum(jg.goles) from Equipos e, Jugadores j, JugadoresGoles jg
where e.id = j.id_equipo and j.id = jg.id_jugador
group by e.nombre;

-- 3) Insertar un nuevo jugador

insert into Jugadores(id_equipo, nombre) values(1, 'Jovetic');

-- 4) Borrar el jugador recién creado

delete from Jugadores
order by id desc limit 1;

-- 5) Incrementar los goles de un jugador en 5

update JugadoresGoles set goles = goles+5
where id_jugador = (select id from Jugadores
                    where nombre = 'Vietto');

-- 6) Listar el máximo goleador de cada equipo














