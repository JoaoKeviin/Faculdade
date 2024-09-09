create database sprint2;

use sprint2;


create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45));

insert into empresa values
(default, 'STEFANINI', 'Daniela'),
(default, 'C6BANK', 'Vanessa');

select * from empresa;

create table aluno (
ra char(8) primary key,
nome varchar(45),
bairro varchar(45),
fkEmpresa int,
constraint fkAlunoEmpresa foreign key (fkEmpresa)
	references empresa(idEmpresa));
    
    -- criar a tablea empresa
    -- ALTER TABLE aluno ADD COLUMN fkEmpresa int not null, add constraint fkAlunoEmpresa foreign key (fkEmpresa) references empresa (idEmpresa);
    alter table aluno modify column fkEmpresa int not null;
    insert into aluno values
    ('01241999', 'WILL', 'CONSOLAÇÃO', 1),
	('01241998', 'WALL', 'TRIANON MASP', 1),
	('01241997', 'WELL', 'PARAISO', 2);
    
    
    select * from aluno;
    
    -- exibir as empresas e seus respectivos interessados
    
    select * from empresa join aluno on idEmpresa = fkEmpresa;  -- todo JOIN tem o ON. e todo on usar a alianca na chave estrangeira 
    
    select responsavel, bairro from empresa join aluno on idEmpresa = fkEmpresa;
       select responsavel, bairro from empresa join aluno on idEmpresa = fkEmpresa where bairro = 'PARAISO';
	
    select empresa.nome, aluno.nome from empresa join aluno on idEmpresa = fkEmpresa;
    
    select a.nome as NomeAluno,
    e.nome as NomeEmpresa
    from empresa as e join aluno as a 
    on a.fkEmpresa = e.idEmpresa;
    
    
        select a.nome as 'Nome do Aluno',
    e.nome as 'Nome daa Empresa'
    from empresa as e join aluno as a 
    on a.fkEmpresa = e.idEmpresa;
    