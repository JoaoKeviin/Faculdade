-- tipos de atributos
-- simples e composto
-- simples: não pode ser dividido em subpartes
-- exemplo simples: bairro
-- composto: pode/deve ser dividido em subparte
-- exemplo composto: endereço
-- dividido em: logradouro, numero, cep, cidade, bairro, e pais


insert into pessoa (endereco) values

('Rua haddock lobo', 595, 'bairro cerqueira cesar', 'São paulo');

select * from pressoa where endereco like '%São Paulo%';


-- telefone DDI--DDD e prefixo e sufixo
-- +55 11 987654321

select * from pressoa where telefone like '%11%';


-- Atributo monovalorado e multivalorado

-- exemplo monovalorado: bairro

-- atributo multivalorado 

-- O sistema precisa ter, pelo menos 2 telefones cadastrados

-- atributo derivado

-- idade 

-- atributo identificador
-- chave primaria 

-- entidade fraca é quando uma tabela precisa de outra para existir
-- entidade forte é quando não depende de uma tabela precisa de outra para existir
-- sempre insirir os dados primeiro na entidade forte, e depois na entidade fraca

use sprint2;

create table funcionario (
idFunc int primary key auto_increment, -- atributo identificador
nome varchar(45), -- atributo simples
cep char(8), -- atributo composto (endereço) + numero + complemento
numEndereco varchar(45),
complemento varchar(45),
telCelular varchar(45), -- atributo multivalorados + telFixo
telFixo varchar(45));

insert into funcionario value
(default, 'picapau', '04253-000', '1500', 'apto 76', '11983822382', '111556677');


alter table funcionario modify column cep char(9);

select * from funcionario;

insert into funcionario values
(default, 'smurf', '04253-000', '1500', 'apto 80', '11983822382', '111556677');



create table dependente (
idDep int,
fkFunc int, 
constraint pkComposta primary key (idDep, fkFunc),
nome varchar (45),
parentesco varchar(45),
dtNasc date,
constraint fkFuncDep foreign key (fkFunc) references funcionario(idFunc));


insert into dependente values
(1,1, 'Joao', 'irmão', '1999-01-01'),
(2,1, 'Joana', 'Irmã', '2006-01-01'),
(1,2, 'Douglas', 'Pai', '1954-01-01');

select * from dependente;

select funcionario.nome as NomeFunc, dependente.nome as NomeDep from funcionario join dependente on idFunc = fkFunc;

select nome, timestampdiff(YEAR, dtNasc, now()) from dependente;
select nome, timestampdiff(MONTH, dtNasc, now()) from dependente;

insert into funcionario values
(default, 'bob espoja', '04253-000', '1500', 'apto 90', '11983822382', '111556677');


select * from funcionario;

select * from funcionario left join dependente on idFunc = fkFunc; -- esta trazendo todos os dados da tabela a esquerda, mesmo nao tendo dependente, caso tivesse a direita é right