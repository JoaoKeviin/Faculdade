use sprint2;

create table pet (
idPet int primary key auto_increment,
nome varchar(45),
pedigree varchar(45) constraint chkPedigree check (pedigree in('sim', 'nao')),
raca varchar(45),
fkMae int,
constraint fkMaePet foreign key (fkMae) references pet(idPet),
fkPai int,
constraint fkPai foreign key (fkPai) references pet(idPet));


create table dono (
idDono int primary key auto_increment,
nome varchar(45),
bairro varchar(45),
telefone char(11));

alter table pet add column fkDono int, add constraint fkDono foreign key (fkDono) references dono(idDono);

insert into pet (nome, pedigree, raca) values
('jack', 'sim', 'buldog'),
('joao', 'sim', 'yorkshine'),
('anderson', 'nao', 'poodle'),
('gonsalve', 'sim', 'yorkshine');


insert into dono (nome, bairro, telefone) values
('guilherme', 'aricanduva', '11941481101'),
('laise', 'penha', '11973288789'),
('Joao Kevin', 'jdsaoluiz', '11976900686');


update pet set fkPai = 4 where idPet = 3;
update pet set fkPai = 2 where idPet = 1;
update pet set fkDono = 3 where idPet = 1;
update pet set fkDono = 1 where idPet = 2;
update pet set fkDono = 2 where idPet = 4;
update pet set fkDono = 2 where idPet = 3;

select pet.nome as NomePet, dono.nome as NomeDono from pet join dono on fkDono = idDono; 

select pet.nome as NomePet, pai.nome as NomeDoPai from pet as pet join pet as pai on pet.fkPai = pai.idPet;

-------------------------------------------------------------------------------------------------------------------

create table motorista (
idMotorista int primary key auto_increment,
nome varchar(45),
cnh char(9),
dtValidade date,
fkMotoristaReserva int,
constraint fkMotoristaReserva foreign key (fkMotoristaReserva) references motorista(idMotorista));

create table carro (
idCarro int primary key auto_increment,
nome varchar(45),
placa char(7),
marca varchar(45));

alter table motorista add column fkCarro int, add constraint fkCarro foreign key (fkCarro) references carro(idCarro);

insert into motorista (nome, cnh, dtValidade) values 
('Joao Kevin', '987654321', '2030-07-07'),
('Guilherme', '986543821', '2027-12-07'),
('Murilo', '109267839', '2025-08-27'),
('Laise', '567389120', '2029-06-12');

insert into carro values 
(default, 'hb20', 'AJK9984', 'hyundai'),
(default, 'creta', 'JKF7689', 'hyundai'),
(default, 'x1', 'JOK6584', 'BMW'),
(default, 'sw4', 'LAJ7893', 'Toyota');  

update motorista set fkMotoristaReserva = 4 where idMotorista = 1;
update motorista set fkMotoristaReserva = 3 where idMotorista = 2;
update motorista set fkCarro = 4 where idMotorista = 1;
update motorista set fkCarro = 3 where idMotorista = 2;


select motorista.nome as NomeDoMotorista, carro.nome as NomeDoCarro from motorista join carro on motorista.fkCarro = carro.idCarro;

--------------------------------------------------------------------------------------------------------------------------------------------


create table empresa (
idEmp int primary key auto_increment,
nome varchar(45),
cnpj char(14),
fkMatriz int,
constraint fkMatrizEmp foreign key (fkMatriz) references empresa(idEmp));

create table funcionario (
idFunc int primary key auto_increment,
nome varchar(45),
area varchar (45),
salario decimal (8,2),
FkSupervisor int, 
constraint fkSupervisorFuncionario foreign key (fkSupervisor) references funcionario(idFunc));

INSERT INTO empresa (nome, cnpj) VALUES 
('Google', '12345678000100'),
('Google EUA', '12345678000100'),
('Apple Inc.', '98765432000199'),
('Apple Inc. EUA', '98765432000199'),
('Microsoft Corporation', '45678901234567'),
('Microsoft Corporation Holanda', '45678901234567'),
('Amazon', '78901234567890'),
('Facebook (Meta Platforms, Inc.)', '23456789012345'),
('Alphabet Inc.', '56789012345678'),
('IBM', '89012345678901'),
('Intel Corporation', '90123456789012'),
('NVIDIA', '34567890123456');

INSERT INTO funcionario (nome, area, salario) VALUES
('João Silva', 'Vendas', 3500.00),
('Maria Santos', 'Vendas', 3200.00),
('Pedro Oliveira', 'Vendas', 3000.00),
('Ana Pereira', 'Marketing', 4000.00),
('Carlos Costa', 'Marketing', 3800.00),
('Marta Ferreira', 'Marketing', 3500.00),
('Rafael Santos', 'TI', 4500.00),
('Luana Rodrigues', 'TI', 4200.00),
('Felipe Oliveira', 'TI', 4000.00);

alter table funcionario add column fkEmpresa int, add constraint fkEmpresaFunc foreign key (fkEmpresa) references empresa(idEmp);


update empresa set fkMatriz = 2 where idEmp = 1;
update empresa set fkMatriz = 4 where idEmp = 3;
update empresa set fkMatriz = 6 where idEmp = 5;
update funcionario set FkSupervisor = 2 where idFunc = 1;
update funcionario set FkSupervisor = 4 where idFunc = 3;
update funcionario set FkSupervisor = 6 where idFunc = 5;
update funcionario set FkEmpresa = 1 where idFunc in (1, 2);
update funcionario set FkEmpresa = 3 where idFunc in (3, 4);
update funcionario set FkEmpresa = 6 where idFunc in (5, 6);

select * from empresa;
select * from funcionario;

select empresa.nome as NomeEmpresa, Matriz.nome as MatrizEmpresa, funcionario.nome as NomeFuncionario,
supervisor.nome as NomeSupervisor from funcionario 
join empresa on empresa.idEmp = funcionario.fkEmpresa
join empresa as Matriz on empresa.fkMatriz = Matriz.idEmp
join funcionario as supervisor on funcionario.fkSupervisor = supervisor.idFunc;
