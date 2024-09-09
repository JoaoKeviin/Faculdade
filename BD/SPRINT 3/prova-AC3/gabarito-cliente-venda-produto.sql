create database venda;
use venda;

create table cliente(
idcliente int primary key auto_increment,
nome varchar(45),
Email varchar(55),
endereço varchar(45),
fkindicação int,
 constraint fkindicação foreign key (fkindicação)
 references cliente(idcliente)
 );
 
 create table venda(
idVenda int primary key ,
Total int,
dtVenda datetime default current_timestamp,
fkcliente int,
constraint fkcliente foreign key (fkcliente)
 references cliente(idcliente)
 )auto_increment=10;
 
 create table Produto(
 idProduto int primary key,
 Nome varchar(45),
 descrição varchar(45),
 Preço decimal(10,2)
 )auto_increment=100;
 
 insert into cliente values
 (null,'Marcos','marcos,atlas@sptech.school','Paulista',1),
 (null,'Rafael','rafa.el@sptech.school','Tatuape',1),
 (null,'Sara','sara.silva@sptech.school','Carrão',2),
 (null,'Andreia','andreia.santos@sptech.school','Dom Bosco',1);
 
 insert into venda values
 (10,2,default,1),
 (11,1,default,2),
 (12,3,default,3),
 (13,1,default,4);
 
 insert into Produto values
 (100,'dogtown','rodas',129.90),
 (101,'Freedom','truck',219.90),
 (102,'Element','shape',119.90);
 
 CREATE TABLE Quantidade_Venda (
idQtdVenda int,
fkVenda int,
fkProduto int,
Qtd int,
Desconto varchar(9),
constraint fkVenda foreign key (fkVenda)
	references venda(idVenda),
constraint fkProduto foreign key (fkProduto)
	references Produto(idProduto),
constraint pkComposta primary key (idQtdVenda, fkVenda, fkProduto)
);
  insert into Quantidade_Venda values
  (200,10,101,2,'30%'),
  (201,11,100,1,'0%'),
  (201,12,102,3,'50%'),
  (203,13,100,1,'0%');
  
  select*from cliente;
  select*from venda;
  select*from Produto;
  select*from Quantidade_Venda;
 
 select*from cliente join venda
 on idcliente = fkcliente;

select*from cliente join venda
 on idcliente = fkcliente
 where nome='Marcos';
 
  select*from cliente as indicador JOIN cliente as indicado
ON indicado.fkindicação = indicador.idcliente;

select*from cliente as indicador JOIN cliente as indicado
ON indicado.fkindicação = indicador.idcliente
where indicado.nome = 'sara';

select*from produto join venda 
join cliente as indicador JOIN cliente as indicado
ON indicado.fkindicação = indicador.idcliente;

select*from produto join Quantidade_Venda on idProduto = fkProduto
join venda on idVenda = fkVenda
join cliente as indicado on indicado.idCliente = fkCliente
JOIN cliente as indicador on indicado.fkindicação = indicador.idcliente;

-- Aula 12 - 02/05
-- funções matematicas

select * from cliente;

alter table cliente add column cep char(9);
alter table cliente add column numEnd varchar(45);

alter table cliente drop column endereço;
desc cliente;

alter table cliente rename column fkIndicação to fkIndicador;


 select venda.dtVenda, produto.nome, Quantidade_Venda.Qtd 
 from Quantidade_Venda join venda
 on idVenda = fkVenda join Produto
 on idProduto = fkProduto; 

select * from cliente;

alter table cliente add genero char(1);
alter table cliente add salario decimal(10,2);

update cliente set genero = 'm', salario = 100.99
	where idcliente = 1;

update cliente set genero = 'm', salario = 79.99
	where idcliente = 2;
 
update cliente set genero = 'f', salario = 99.99
	where idcliente = 3;
    
update cliente set genero = 'f', salario = 9.99
	where idcliente = 4;
    
select * from cliente;

-- count()
select count(*) from cliente;
select count(genero) from cliente;

insert into cliente (nome, genero) VALUES
	('Isabel', 'f');
    
select count(salario) from cliente;
select count(*) from cliente;

-- maior salario
select max(salario) from cliente;

-- menor salario
select min(salario) from cliente;

select max(salario) as Maior,
min(salario) as Menor
from cliente;

-- soma
select sum(salario) from cliente;
select sum(salario)/count(salario) from cliente;

-- media
select avg(salario) from cliente;

-- round
select round(avg(salario),2) from cliente;

select * from cliente;
update cliente set salario = 9.99 where idcliente = 5;

-- distinct
select sum(distinct salario) from cliente;
select sum(salario) from cliente;

select sum(distinct salario), sum(salario) from cliente;

select round(avg(salario),1) from cliente;
select round(avg(salario),2) from cliente;

-- truncate
select truncate(avg(salario),1) from cliente;

-- group by
select genero, sum(salario) from cliente group by genero;
select genero, sum(salario) from cliente where genero = 'm' group by genero;
