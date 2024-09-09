
use sprint2;

create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
telFixo varchar(45),
telCell varchar(45),
cep char(9),
rua varchar(45),
numero varchar(45),
complemento varchar(45));

insert into cliente values 
(default, 'Joao Kevin', '115565454', '11987654321', '05822-010', 'Antonio ramos rosa', '12A', 'Casa');


insert into cliente values 
(default, 'Matheus', '115565454', '11987654321', '05822-010', 'Antonio ramos rosa', '223', 'Casa'),
(default, 'Kevin', '115565454', '11987654321', '05822-010', 'Antonio ramos rosa', '85', 'Casa'),
(default, 'Laise', '115565454', '11987654321', '05822-010', 'Antonio ramos rosa', '354', 'Casa'),
(default, 'Guilherme', '115565454', '11987654321', '05822-010', 'Antonio ramos rosa', '20A', 'Casa');

select * from cliente;

create table pet (
idPet int auto_increment,
fkCliente int,
constraint pkComposta primary key (idPet, fkCliente), 
tipo varchar(45),
nome varchar(45),
raca varchar(45),
dtNasc date,
constraint fkClientePet foreign key (fkCliente) references cliente(idCliente)) auto_increment = 101 ;

insert into pet values
(default,1, 'Cachorro', 'joaozinho', 'vira-lata', '2005-07-07'),
(default,1, 'Cachorro', 'guilherme', 'vira-lata', '2004-01-07'),
(default,3, 'Gato', 'Matheuzinho', 'Bulldog', '2010-10-10'),
(default,3, 'Gato', 'Miau', 'Siames', '2024-01-04'),
(default,4, 'Cachorro', 'Calica', 'Husk', '2020-12-01'); 

insert into pet values
(default,5, 'Cachorro', 'Otavio', 'yorkshine', '2000-07-07'),
(default,5, 'Cachorro', 'Rubsvaldo', 'vira-lata', '2014-11-17'),
(default,2, 'Gato', 'Gari', 'Bulldog', '2009-10-10'),
(default,2, 'Gato', 'JK', 'Siames', '2024-03-04'),
(default,3, 'Cachorro', 'Osvaldo', 'Vira-Lata', '2010-12-01');
insert into pet values
(default,1, 'Gato', 'JU', 'Vira-Lata', '2005-05-05');
select * from pet;
select * from cliente;

select * from pet where tipo like 'Gato';
select nome, dtNasc from pet;
select * from pet order by nome asc;
select * from cliente order by rua desc;
select * from pet where nome like 'M%';
select * from cliente where nome like 'Laise';

update cliente set telCell = '11977777777' where idCliente = 1; 

select * from cliente;

select * from pet join cliente on pet.fkCliente = cliente.idCliente;
select * from pet join cliente on pet.fkCliente = cliente.idCliente where idCliente = 1;

delete from pet where idPet = 102;

select * from pet;

drop table pet;
drop table cliente;

------------------------------------------------------------------------------------------------------

-- atividade 2

create table pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
profissao varchar(45));

create table gasto (
idGasto int auto_increment,
fkPessoa int,
constraint fkComposta primary key (idGasto, fkPessoa),
dt date,
valor decimal (9,2),
descricao varchar(45),
constraint fkPessoaGasto foreign key (fkPessoa) references pessoa(idPessoa));


insert into pessoa values 
(default, 'Joao Kevin', '2005-07-07', 'DBA'),
(default, 'Guilherme', '2004-04-15', 'DEV'),
(default, 'Laise', '2006-12-31', 'Analista');

insert into gasto values
(default,1, '2024-04-10', 1200.00 , 'Fatura do cartão'),
(default,1, '2024-04-07', 24.00 , 'Coxinha do seu zé'),
(default,1, '2024-03-07', 150.00 , 'FC24'),
(default,2, '2024-04-24', 1500.00 , 'Fatura do cartão'),
(default,2, '2024-03-28', 1000.00 , 'Parcela do Corsa'),
(default,2, '2024-04-01', 200.00 , 'Livro mente milionaria'),
(default,3, '2024-04-10', 2000.00 , 'Fatura do cartão');

select * from pessoa;
select * from gasto;

select * from pessoa where profissao like 'DBA';
select * from gasto where descricao like 'Fatura do cartão';

select pessoa.nome as NomePessoa , pessoa.dtNasc as DataNascimento, pessoa.profissao as ProfissaoPessoa,
 gasto.dt as DataGasto, gasto.valor as ValorGastado, gasto.descricao as DescricaoDoGasto from pessoa
 join gasto on gasto.fkPessoa = pessoa.idPessoa;
 
 select pessoa.*, gasto.* from pessoa join gasto on gasto.fkPessoa = pessoa.idPessoa where nome like 'Joao Kevin';
 
 update pessoa set profissao = 'Analista' where idPessoa = 1;

 select pessoa.*, gasto.* from pessoa join gasto on gasto.fkPessoa = pessoa.idPessoa where nome like 'Joao Kevin';
 
 delete from gasto where idGasto = 2;
 select pessoa.*, gasto.* from pessoa join gasto on gasto.fkPessoa = pessoa.idPessoa where nome like 'Joao Kevin';
 
 -------------------------------------------------------------------------
 -- atividade 3
 
 create table setor ( 
 idSetor int primary key,
 nome varchar(45),
 andar int);
 
 create table funcionario (
 idFunc int primary key auto_increment,
 nome varchar(45),
 telCell varchar(45),
 telFixo varchar(45),
 salario decimal (9,2),
 check (salario > 0),
 fkSetor int, 
 constraint fkSetorFunc foreign key (fkSetor) references setor(idSetor));
 
 create table acompanhante (
 idAcomp int auto_increment,
 fkFunc int,
 constraint composta primary key (idAcomp, fkFunc),
 nome varchar(45),
 relacao varchar(45),
 dtNasc date,
 constraint fkFuncAcomp foreign key (fkFunc) references funcionario(idFunc));
 
 
 insert into setor values
 (1, 'Recursos humanos', 10),
 (2, 'Marketing', 9),
 (3, 'Vendas', 8),
 (4, 'Relacionamento', 7);
 
 insert into funcionario values 
 (default, 'Joao Kevin', '11987654321', '5511626327', 5300.00, 2),
 (default, 'Kauan', '11987654321', '5511626327', 7300.00, 2),
 (default, 'Laise', '11987654321', '5511626327', 2300.00, 1),
 (default, 'Guilherme', '11987654321', '5511626327', 7300.00, 3),
 (default, 'Kevin', '11987654321', '5511626327', 9300.00, 4);
 
 insert into funcionario values
 (default, 'Cleiton', '11987654321', '5511626327', 6000.00, 1),
 (default, 'Ronaldo', '11987654321', '5511626327', 1000.00, 3),
 (default, 'Rogerio', '11987654321', '5511626327', 1000.00, 4);
 

insert into acompanhante values 
(default, 1, 'vanessa', 'mãe', '1982-12-27'),
(default, 1, 'adilson', 'pai', '1968-06-30'),
(default, 2, 'cleiton', 'tio', '1998-07-20'),
(default, 3, 'osvaldo', 'namorado', '2004-10-15'),
(default, 4, 'isadora', 'namorada', '2005-08-10'),
(default, 5, 'Ana Julia', 'namorada', '2005-03-03');

insert into acompanhante values 
(default, 6, 'Olinda', 'mãe', '1956-06-06'),
(default, 7, 'Antonia', 'madrasta', '1986-10-16'),
(default, 8, 'Marcelo', 'irmao', '2000-01-22');

select * from setor;
select * from funcionario;
select * from acompanhante;

select * from setor join funcionario on funcionario.fkSetor = setor.idSetor;
select * from setor join funcionario on funcionario.fkSetor = setor.idSetor where setor.nome like 'relacionamento';
select funcionario.nome as NomeFuncionario, 
funcionario.telCell as CelularFuncionario, 
funcionario.telFixo as 'Telefone Fixo Funcionario',
 funcionario.salario as SalarioFuncionario,
 acompanhante.nome as 'Nome do Acompanhante',
 acompanhante.relacao as 'Relacao do Acompanhante com Funcionario',
 acompanhante.dtNasc as 'Data de nascimento acompanhante' from funcionario join acompanhante on acompanhante.fkFunc = funcionario.idFunc;
 
select funcionario.nome as NomeFuncionario, 
funcionario.telCell as CelularFuncionario, 
funcionario.telFixo as 'Telefone Fixo Funcionario',
 funcionario.salario as SalarioFuncionario,
 acompanhante.nome as 'Nome do Acompanhante',
 acompanhante.relacao as 'Relacao do Acompanhante com Funcionario',
 acompanhante.dtNasc as 'Data de nascimento acompanhante'
from funcionario join acompanhante on acompanhante.fkFunc = funcionario.idFunc where funcionario.nome like 'Joao Kevin';

select * from setor
join funcionario on funcionario.fkSetor = setor.idSetor
join acompanhante on acompanhante.fkFunc = funcionario.idFunc;

----------------------------------------------------------------------------------------------------------------------------
-- atividade 4

create table treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
telCell varchar(45) unique,
email varchar(100) unique,
fkTreinadorExp int,
constraint fkTreinadorExperiente foreign key (fkTreinadorExp) references treinador(idTreinador));
alter table treinador auto_increment 100;

create table nadador (
idNadador int primary key auto_increment,
nome varchar(45),
estadoOrigem varchar(45),
dtNasc date,
fkTreinador int,
constraint fkTreinadorNadador foreign key (fkTreinador) references treinador(idTreinador))auto_increment 10;

insert into treinador (idTreinador, nome, telCell, email) values 
(default, 'Joao Kevin', '11976900686', 'joao.matos@sptech.school'),
(default, 'Matheus', '119007800686', 'matheus100@gmail.com'),
(default, 'Moises', '11978900543', 'robson.bambu10@gmail.com'),
(default, 'Raiany', '11956991686', 'raiany56@outlook.com'),
(default, 'Sophia', '11901356686', 'sol.santos@gmail.com'),
(default, 'Alessandra', '11992910686', 'ale12305@gmail.com'),
(default, 'Sandro', '119776822010', 'sandrinho@hotmail.com');

update treinador set fkTreinadorExp = 100 where idTreinador in (103, 104, 106);
update treinador set fkTreinadorExp = 101 where idTreinador in (102, 105);

insert into nadador values 
(default,'Marcos', 'Bahia', '1986-10-11', 104),
(default,'Alessandro' , 'São Paulo', '1998-02-17', 104),
(default,'Maco aulerio' , 'São Paulo', '1978-05-05', 101),
(default,'Ronaldo' , 'Alagoas', '1967-06-12', 103),
(default,'Silvana' , 'Paraiba', '2000-08-15', 102),
(default,'Juliana' , 'São Paulo', '2000-05-05', 100),
(default, 'Amadeu', 'Ceara', '2005-07-07', 105),
(default, 'Vivian', 'Minas Gerais', '2005-12-07', 106);

select * from treinador;
select * from nadador;

select * from treinador join nadador on nadador.fkTreinador = treinador.idTreinador;
select * from treinador join nadador on nadador.fkTreinador = treinador.idTreinador where treinador.nome like 'sophia';
select * from treinador join treinador as experiente on experiente.fkTreinadorExp = treinador.idTreinador;
select * from treinador join treinador as experiente on experiente.fkTreinadorExp = treinador.idTreinador where treinador.nome like 'Matheus';


select treinador.nome as NomeTreinadorResponsavel,
responsavel.nome as nomeTreinador,
nadador.nome as NomeNadador from treinador
join nadador on nadador.fkTreinador = treinador.idTreinador
join treinador as responsavel on responsavel.fkTreinadorExp = treinador.idTreinador;

select treinador.nome as NomeTreinadorResponsavel,
responsavel.nome as nomeTreinador,
nadador.nome as NomeNadador from treinador
join nadador on nadador.fkTreinador = treinador.idTreinador
join treinador as responsavel on responsavel.fkTreinadorExp = treinador.idTreinador where treinador.nome like 'Joao Kevin';

------------------------------------------------------------------------------------------------------------------------------------------



