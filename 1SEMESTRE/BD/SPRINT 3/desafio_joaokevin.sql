
create database sprint3;
use sprint3;


create table departamento (
idDepto int primary key,
nomeDepto varchar(45),
fkGerente int,
dataInicioGer date);

insert into departamento values
(105, 'pesquisa', 2, '2008-05-22'),
(104, 'administração', 7, '2015-01-01'),
(101, 'matriz', 8, '2001-06-19');

create table funcionario (
idFunc int primary key,
nomeFunc varchar(30),
salario decimal(9,2),
sexo varchar(10)
CONSTRAINT chk_sexo CHECK (sexo IN ('masculino', 'feminino')),
fkSuperVisor int,
dataNasc date,
fkDepto int,
foreign key (fkDepto) references departamento(idDepto));

insert into funcionario values
(1, 'Joao Silva', 3500.00, 'masculino', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500.00, 'masculino', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500.00, 'feminino', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300.00, 'feminino', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800.00, 'masculino', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500.00, 'feminino', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500.00, 'masculino', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500.00, 'masculino', null, '1957-11-10', 101);


create table projeto (
idProj int primary key,
nomeProj varchar(100),
localProj varchar(50),
fkDepto int,
foreign key (fkDepto) references departamento(idDepto));

insert into projeto values
(1, 'produto x', 'Santo André', 105),
(2, 'produto y', 'Itu', 105),
(3, 'produto z', 'São Paulo', 105),
(10, 'Informatização', 'Maua', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Beneficios', 'Maua', 104);

create table FuncProj(
fkFunc int,
fkProj int,
horas decimal(3,1),
primary key (fkFunc, fkProj),
foreign key (fkFunc) references funcionario(idFunc),
foreign key (fkProj) references projeto(idProj));

insert into FuncProj values
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.5),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 15.0),
(8, 20, null);

alter table funcionario add constraint fkSupervisorFunc foreign key (fkSupervisor) references funcionario(idFunc);
alter table departamento add constraint fkGerenteFunc foreign key (fkGerente) references funcionario(idFunc);


-- Questão 1
select * from departamento;
select * from funcionario;
select * from projeto;
select * from FuncProj;
 -- Questão 2
 
 insert into funcionario values
 (null, 'Cecilia Ribeiro', 2800.00, 'feminino', 4, '1980-04-05', 107);
 
 -- Conseguiu inserir? Por que?
 -- R: Não consegui, pois a chave primaria não pode ser nula!
 
-- Questão 3

 insert into funcionario values
 (3, 'Alice Sousa', 2800.00, 'feminino', 4, '1980-04-05', 104);
  -- Conseguiu inserir? Por que?
 -- R: Não consegui, pois a chave primaria está se repetindo, ou seja já existe na tabela funcionario um funcionario com essa chave primaria!
 
 -- questão 4
  insert into funcionario values
 (9, 'Cecilia Ribeiro', 2800.00, 'feminino', 4, '1980-04-05', 107);
 
  -- Conseguiu inserir? Por que?
 -- R: Não consegui, pois não existe um departamento com o id 107!
 
 -- questão 5
 
 delete from FuncProj where fkFunc = 3 and fkProj = 10;
   -- Conseguiu excluir? Por que?
 -- R: Consegui, por conta que existe essas duas fk na tabela!
 
 -- questão 6
 delete from funcionario where idFunc = 4;
 
   -- Conseguiu excluir? Por que?
 -- R: Não Consegui, por conta que ela está fazendo parte da fkSuperVisor, ou seja sendo supervisor de um funcionario, para excluir esse idFunc, 
 -- precisa altera a tupla que ela é supervisor!
 
 
 -- questão 7
 delete from funcionario where idFunc = 2;
  -- Conseguiu excluir? Por que?
  -- R: Não consegui, pois esse id é gerente em de um departamento, ou seja para excluir esse id, precisa ser alterado o gerente do departamento pesquisa!
  
  -- questão 8
  update funcionario set salario = 2800 where idFunc = 3;
 
 -- Conseguiu excluir? Por que?
 -- R: Conseguir alterar por conta que o salario do id 3 era 2500, e agora passou para 2800
 
	-- questão 9
    
update funcionario set fkDepto = 101 where idFunc = 3;
 -- Conseguiu excluir? Por que?
 -- R: Conseguir por conta que a fkDepto antes do id 3 era a 104, agora passou a ser 101.
 
 -- questão 10
 update funcionario set fkDepto = 107 where idFunc = 3;
  -- Conseguiu excluir? Por que?
  -- R: não consegui, pois não existe o departamento com id 107.
  
  select nomeFunc, dataNasc, salario from funcionario where idFunc = 1;
  
  select salario from funcionario;
  
  select distinct salario from funcionario;
  
  select * from funcionario order by nomeFunc;
  
  select * from funcionario order by salario desc; 
  select * from funcionario where salario BETWEEN 2000 AND 4000;
  select nomeFunc, salario from funcionario where nomeFunc like '%J%';
  select nomeFunc, salario from funcionario where nomeFunc like '%a';
  select nomeFunc, salario from funcionario where nomeFunc like '__n%';	
  select nomeFunc, dataNasc from funcionario where nomeFunc like '%s____';	
  select * from funcionario where fkDepto = 105;
  select * from funcionario where fkDepto = 105 and salario >= 3500;
  select * from funcionario where fkDepto = 105 and nomeFunc like 'j%';
  
  select funcionario.idFunc as idFuncionario,
  funcionario.nomeFunc as NomeFuncionario,
  supervisor.idFunc as idSupervisor,
  supervisor.nomeFunc as NomeSupervisor from funcionario 
  join funcionario as supervisor on funcionario.fkSupervisor = supervisor.idFunc;
  
  select projeto.idProj as idProjeto,
  departamento.idDepto as NumeroDepartamento,
  funcionario.nomeFunc as NomeGerente,
  funcionario.dataNasc as DataNascGerente from projeto 
 join departamento on projeto.fkDepto = departamento.idDepto
 join funcionario on departamento.fkGerente = funcionario.idFunc where localProj like 'São Paulo';
 
 select funcionario.idFunc as IdFuncionario,
 funcionario.nomeFunc as NomeFuncionario,
 projeto.idProj as NumeroDoProjeto,
 projeto.nomeProj as NomeProjeto,
 FuncProj.horas as HorasTrabalhadas from FuncProj
 join funcionario on FuncProj.fkFunc = funcionario.idFunc
 join projeto on FuncProj.fkProj = projeto.idProj;
 
select nomeFunc from funcionario where dataNasc <= '1980-01-01';
select count(distinct salario) from funcionario;
select count(distinct localProj) from projeto;

select round(avg(salario)) as mediaSalario, sum(salario) as SomaDosSalarios from funcionario;
select min(salario) as MenorSalario, max(salario) as MaiorSalario from funcionario;

select departamento.idDepto as IdDepartamento,
round(avg(funcionario.salario)) as MediaSalario,
sum(funcionario.salario) as somaSalario from funcionario 
join departamento on funcionario.fkDepto = departamento.idDepto group by departamento.idDepto;

select departamento.idDepto as  IdDepartamento,
min(funcionario.salario) as menorSalario,
max(funcionario.salario) as maiorSalario from funcionario
join departamento on funcionario.fkDepto = departamento.idDepto group by departamento.idDepto;

insert into funcionario values
(10, 'José da silva', 1800.00, 'masculino', 3, '2000-10-12', null),
(11, 'Benedito Almeida', 1200.00, 'masculino', 5, '2001-09-01', null);

insert into departamento values
(110, 'RH', 3, '2018-11-10');

