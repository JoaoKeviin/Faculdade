create database sprint3;
use sprint3;

create table grupo (
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(100))auto_increment = 1;

create table aluno(
ra varchar(45) primary key,
nome varchar(45),
email varchar(100),
fkGrupoAluno int,
foreign key (fkGrupoAluno) references grupo(idGrupo));

create table professor(
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)) auto_increment = 10000;

create table avaliacao(
fkProfessor int,
fkGrupo int,
inicioAvaliacao datetime,
nota decimal(2,1),
constraint pkComposta primary key	(fkProfessor, fkGrupo), 
foreign key (fkProfessor) references professor(idProfessor),
foreign key (fkGrupo) references grupo(idGrupo));

insert into grupo values
(default, 'Grupo 03', 'Gerenciamento de temperatura e umidade do capril'),
(default, 'Grupo 04', 'Gerenciamento de temperatura de refrigerador');

insert into aluno values
('01241154', 'Joao Kevin', 'joao.matos@sptech.school', 1),
('01241210', 'Cleiton', 'cleiton.suares@sptech.school', 1),
('01241220', 'Rafael', 'rafael.conceicao@sptech.school', 1),
('01241400', 'Ananias', 'ananias.ferreira@sptech.school', 1),
('01241110', 'Isadora', 'Isadora.freitas@sptech.school', 1),
('01241100', 'Orlando', 'Orlando.costa@sptech.school', 2),
('01241090', 'Sophia', 'Sophia.costa@sptech.school', 2),
('01241300', 'Rayssa', 'rayssa.oliveira@sptech.school', 2),
('01241001', 'Matusalem', 'matusalem.pinto@sptech.school', 2),
('01241011', 'Juliana', 'juliana.spindola@sptech.school', 2);

insert into professor values
(default, 'Fernanda Caramico', 'Pesquisa Inovação'),
(default, 'Vivian', 'Banco de dados'),
(default, 'Marcos', 'TI'),
(default, 'JP', 'Algorritimo');

insert into avaliacao values
(10000, 1, '2024-05-25 08:00:00', 9.5),
(10001, 1, '2024-05-25 09:30:20', 8.5),
(10002, 1, '2024-05-25 12:30:20', 6.5),
(10003, 1, '2024-05-25 12:30:20', 9.0),
(10000, 2, '2024-06-10 14:30:00', 9.0),
(10001, 2, '2024-06-10 16:30:30', 8.0),
(10002, 2, '2024-06-10 17:00:30', 7.0),
(10003, 2, '2024-06-10 18:45:30', 9.0);

select * from aluno;
select * from grupo;
select * from professor;
select * from avaliacao;

select * from grupo join aluno on aluno.fkGrupoAluno = grupo.idGrupo;
select * from grupo join aluno on aluno.fkGrupoAluno = grupo.idGrupo where grupo.nome like 'Grupo 03';
select avg(nota) as MediaGeral from avaliacao;
select min(nota) as notaMinima, max(nota) as notaMaxima from avaliacao;
select sum(nota) as SomaGeral from avaliacao;

select * from avaliacao join grupo on avaliacao.fkGrupo = grupo.idGrupo
join professor on avaliacao.fkProfessor = professor.idProfessor;

select * from avaliacao join grupo on avaliacao.fkGrupo = grupo.idGrupo
join professor on avaliacao.fkProfessor = professor.idProfessor where grupo.idGrupo = 1;

select grupo.descricao as 'Grupo avaliado por Fernanda Caramico' from avaliacao join grupo on avaliacao.fkGrupo = grupo.idGrupo
join professor on avaliacao.fkProfessor = professor.idProfessor where professor.nome = 'Fernanda Caramico';

select * from avaliacao 
join grupo on avaliacao.fkGrupo = grupo.idGrupo
join aluno on aluno.fkGrupoAluno = grupo.idGrupo
join professor on avaliacao.fkProfessor = professor.idProfessor;

select avaliacao.nota from avaliacao;

select professor.nome, avaliacao.avg(nota) as mediaGeral, avaliacao.max(nota) from professor 
join avaliacao on avaliacao.fkProfessor = professor.idProfessor;

SELECT professor.nome AS nomeProfessor, AVG(avaliacao.nota) AS mediaNotas, SUM(avaliacao.nota) AS somaNotas FROM avaliacao
JOIN professor ON avaliacao.fkProfessor = professor.idProfessor
GROUP BY professor.nome;

SELECT grupo.nome AS nomeGrupo, AVG(avaliacao.nota) AS mediaNotas, SUM(avaliacao.nota) AS somaNotas FROM avaliacao
JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo
GROUP BY grupo.nome;

SELECT professor.nome AS nomeProfessor, min(avaliacao.nota) AS menorNota, max(avaliacao.nota) AS maiorNota FROM avaliacao
JOIN professor ON avaliacao.fkProfessor = professor.idProfessor
GROUP BY professor.nome;

SELECT grupo.nome AS nomeGrupo, min(avaliacao.nota) AS menorNota, max(avaliacao.nota) AS maiorNota FROM avaliacao
JOIN grupo ON avaliacao.fkGrupo = grupo.idGrupo
GROUP BY grupo.nome;






