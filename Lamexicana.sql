create database lamexicana;

use lamexicana;

create table res(
dni int not null primary key,
nombre varchar(255),
precio float,
entro float,
merma float,
dvendido float,
stock float,
result float,
venta float
);

create table puerco(
dni int not null primary key,
nombre varchar(255),
precio float,
merma float,
entro float,
dvendido float,
stock float,
result float,
venta float
);

create table pollo(
dni int not null primary key,
nombre varchar(255),
precio float,
merma float,
entro float,
dvendido float,
stock float,
result float,
venta float
);

create table pez(
dni int not null primary key,
nombre varchar(255),
precio float,
entro float,
merma float,
dvendido float,
stock float,
result float,
venta float
);


delimiter //
CREATE PROCEDURE mostrar_res(in id int)
begin
select result from pez where dni = id;
end//
delimiter ;

create procedure consultadnipuerco()
select nombre from puerco;

create procedure consultadnires()
select nombre from res;

create procedure consultadnipollo()
select nombre from pollo;

create procedure consultadnipez()
select nombre from pez;

call consultadnires();

create procedure consultaridres(in id int)
select * from res where dni = id;

create procedure consultaridpez(in id int)
select * from pez where dni = id;

create procedure consultaridpollo(in id int)
select * from pollo where dni = id;

#Editar puerco
delimiter //
CREATE PROCEDURE edit_puerco(IN id int,IN ent float ,IN mer float,IN dinvend float)
begin
if exists(select id from puerco where dni like id)
then
update puerco set entro = ent, merma = mer, dvendido = dinvend, result = (stock+entro-merma-dvendido), venta = (dvendido*precio),stock=(result) where dni like id;
end if;
end//
delimiter ;

#Editar res
delimiter //
CREATE PROCEDURE edit_res(IN id int,IN ent float ,IN mer float,IN dinvend float)
begin
if exists(select id from res where dni like id)
then
update res set entro = ent, merma = mer, dvendido = dinvend, result = (stock+entro-merma-dvendido), venta = (dvendido*precio), stock=(result)where dni like id;
end if;
end//
delimiter ;

#Editar pollo
delimiter //
CREATE PROCEDURE edit_pollo(IN id int,IN ent float ,IN mer float,IN dinvend float)
begin
if exists(select id from pollo where dni like id)
then
update pollo set entro = ent, merma = mer, dvendido = dinvend, result = (stock+entro-merma-dvendido) , venta = (dvendido*precio), stock=(result)where dni like id;
end if;
end//
delimiter ;

#Editar pez
delimiter //
CREATE PROCEDURE edit_pez(IN id int,IN ent float ,IN mer float,IN dinvend float)
begin
if exists(select id from pez where dni like id)
then
update pez set entro = ent, merma = mer, dvendido = dinvend, result = (stock+entro-merma-dvendido), venta = (dvendido*precio),stock=(result) where dni like id;
end if;
end//
delimiter ;

#Alta pollo
delimiter //
CREATE PROCEDURE alta_pollo(IN id int, IN nom varchar(255), IN pre float, IN stok float)
begin
if not exists(select id from pollo where nombre like nom)
then
insert into pollo (dni,nombre,precio,stock) values (id,nom,pre,stok);
end if;
end//
delimiter ;

#Alta puerco
delimiter //
CREATE PROCEDURE alta_puerco(IN id int, IN nom varchar(255), IN pre float, IN stok float)
begin
if not exists(select id from puerco where nombre like nom)
then
insert into puerco (dni,nombre,precio,stock) values (id,nom,pre,stok);
end if;
end//
delimiter ;

#Alta res
delimiter //
CREATE PROCEDURE alta_res(IN id int, IN nom varchar(255), IN pre float, IN stok float)
begin
if not exists(select id from res where nombre like nom)
then
insert into res (dni,nombre,precio,stock) values (id,nom,pre,stok);
end if;
end//
delimiter ;


#Alta pez
delimiter //
CREATE PROCEDURE alta_pez(IN id int, IN nom varchar(255), IN pre float, IN stok float)
begin
if not exists(select id from pez where nombre like nom)
then
insert into pez (dni,nombre,precio,stock) values (id,nom,pre,stok);
end if;
end//
delimiter ;

select dni,nombre,precio,stock from res;

#Eliminar pollo
delimiter // 
create procedure elim_pollo(in id int) 
begin 
if exists (select dni from pollo where dni like id) 
then 
    delete from pollo where dni like id;  
end if; 
end// 
delimiter ;

#Eliminar pez
delimiter // 
create procedure elim_pez(in id int) 
begin 
if exists (select dni from pez where dni like id) 
then 
    delete from pez where dni like id;  
end if; 
end// 
delimiter ;

#Eliminar puerco
delimiter // 
create procedure elim_puerco(in id int) 
begin 
if exists (select dni from puerco where dni like id) 
then 
    delete from puerco where dni like id;  
end if; 
end// 
delimiter ;

#Eliminar res
delimiter // 
create procedure elim_res(in id int) 
begin 
if exists (select dni from res where dni like id) 
then 
    delete from res where dni like id;  
end if; 
end// 
delimiter ;

#Backup
create table bacup(
dni int,
nombre varchar(255),
precio float,
entro float,
merma float,
dvendido float,
stock float,
result float,
venta float
);

#Por si acaso res
delimiter //
create trigger deleted after delete on res for each row
	begin
		insert into bacup (dni,nombre,precio,entro,merma,dvendido,stock,result,venta) values (old.dni,old.nombre,old.precio,old.entro,old.merma,old.dvendido,old.stock,old.result,old.venta);
end//
delimiter ;

select * from res;
