use sprint3;


create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
cep char(9),
rua varchar(45),
numero varchar(45),
complemento varchar(45),
fkIndicador int,
foreign key (fkIndicador) references cliente(idCliente));



create table venda (
idVenda int primary key,
total decimal(5,2),
dtVenda date,
fkCliente int,
foreign key (fkCliente) references cliente(idCliente));

create table produto (
idProduto int primary key,
nome varchar(45),
descricao varchar(45),
preco decimal (5,2));

create table revenda (
idRevenda int,
fkProduto int,
fkVenda int,
primary key (idRevenda, fkProduto, fkVenda),
desconto decimal(5,2),
qtdProdutoVendido int);


-- Inserção de clientes
insert into cliente (nome, email, cep, rua, numero, complemento, fkIndicador) values 
(null, 'João Silva', 'joao@email.com', '12345678', 'Rua das Flores', '123', 'Apto 101', NULL),
(null, 'Maria Souza', 'maria@email.com', '98765432', 'Avenida Principal', '456', NULL, 1),
(null, 'Carlos Oliveira', 'carlos@email.com', '54321678', 'Rua dos Passarinhos', '789', 'Casa 2', 2);

-- Inserção de vendas
insert into venda (idVenda, total, dtVenda, fkCliente) values 
(1, 150.00, '2024-05-01', 1),
(2, 250.00, '2024-05-03', 2),
(3, 100.00, '2024-05-05', 3);

insert into venda (idVenda, total, dtVenda, fkCliente) values 
(4, 200.00, '2024-05-06', 1);

-- Inserção de produtos
insert into produto (idProduto, nome, descricao, preco) values 
(1, 'Camiseta', 'Camiseta de algodão', 25.00),
(2, 'Calça Jeans', 'Calça jeans azul', 50.00),
(3, 'Tênis', 'Tênis esportivo', 80.00);

-- Inserção de vendas de produtos
insert into revenda (idRevenda, fkProduto, fkVenda, desconto, qtdProdutoVendido) values 
(1, 1, 1, 5.00, 2),
(1, 2, 1, 0.00, 1),
(1, 3, 2, 10.00, 1),
(2, 1, 3, 0.00, 3);


select * from cliente;

select * from venda;
select * from produto;
select * from revenda;


select * from cliente join venda on  fkCliente = idCliente;
select * from cliente join venda on  fkCliente = idCliente where cliente.nome like 'João Silva';

select * from cliente join cliente as indicador on cliente.fkIndicador = indicador.idCliente;
select * from cliente join cliente as indicador on cliente.fkIndicador = indicador.idCliente where indicador.nome like 'João Silva';

select * from cliente join cliente as indicador on cliente.fkIndicador = indicador.idCliente
join venda on venda.fkCliente = cliente.idCliente
join revenda on revenda.fkVenda = venda.idVenda
join produto on revenda.fkProduto = produto.idProduto;


select venda.dtVenda as DataVenda,
produto.nome as NomeProduto,
revenda.qtdProdutoVendido as QuantidadeDeProdutoVendido from venda 
join revenda on revenda.fkVenda = venda.idVenda
join produto on revenda.fkProduto = produto.idProduto where idVenda = 1;


select produto.nome as NomeProduto,
produto.preco as ValorProduto,
sum(revenda.qtdProdutoVendido) as SomaQTDproduto
from produto join revenda on revenda.fkProduto = produto.idProduto group by produto.nome, produto.preco;

insert into cliente (nome, email, cep, rua, numero, complemento, fkIndicador) values 
('joseana', 'joseana@email.com', '12345678', 'Rua das Flores', '123', 'Apto102', 2);

select * from cliente left join venda on venda.fkCliente = cliente.idCliente;

select min(preco), max(preco) from produto;

select sum(preco), round(avg(preco)) as media from produto;

SELECT COUNT(*) AS Quantidade FROM produto WHERE preco > (SELECT AVG(preco) FROM produto);

select sum(distinct preco) from produto;

select sum(preco) from produto join revenda on revenda.fkProduto = produto.idProduto
join venda on revenda.fkVenda = venda.idVenda where idVenda = 1;
