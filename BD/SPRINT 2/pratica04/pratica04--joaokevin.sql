use sprint2;

create table professor (
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40));

insert into professor values 
(default, 'joao', 'kevin', 'ADS', 'direito'),
(default, 'Laise', 'Martin', 'letras', 'canto'),
(default, 'Kauan', 'Gabriel', 'Letras', 'algebra'),
(default, 'Joao', 'Pedro', 'ingles', 'direito'),
(default, 'Roniele', 'andrade', 'instrutor', 'infermeiro'),
(default, 'Guilherme', 'sousa', 'ADS', 'biologia');

create table disciplina (
idDisc int primary key auto_increment,
nomeDisc varchar(45));

insert into disciplina value
(default, 'Portugues'),
(default, 'ADS'),
(default, 'direito');

select * from disciplina;
alter table disciplina add column fkProfessor int, add constraint fkProfessorDisciplina foreign key (fkProfessor) references professor(idProfessor);

update disciplina set fkProfessor = 2 where idDisc = 1;
update disciplina set fkProfessor = 1 where idDisc = 2;
update disciplina set fkProfessor = 6 where idDisc = 3;

select * from professor join disciplina on fkProfessor = idProfessor;

select professor.nome, disciplina.nomeDisc from professor join disciplina on idProfessor = fkProfessor;	

select * from professor join disciplina on idProfessor = fkProfessor where sobrenome = 'Martin';
select * from professor join disciplina on idProfessor = fkProfessor where especialidade1 = 'ADS' order by especialidade1 asc;


---------------------------------------------------------------------------------------------------------------


create table curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(45));

create table aluno (
idAluno int primary key,
nome varchar(50),
idade int,
presenca varchar(40), constraint chkPresenca check(presenca in('ausente', 'presente')));

insert into curso values
(null, 'Analise desenvolvimento de sistema', 'ADS', 'Gerson'),
(null, 'Sistema da informação', 'SIS', 'Brandao'),
(null, 'Direito', 'DIR', 'Joao');

insert into aluno values 
(1, 'joao Kevin', 18, 'presente'),
(2, 'Laise', 18, 'presente'),
(3, 'Murilo', 17, 'presente');




alter table aluno add column fkCurso int, add constraint fkCursoAluno foreign key (fkCurso) references Curso(idCurso);

update aluno set fkCurso = 1 where idAluno = 1;
update aluno set fkCurso = 3 where idAluno = 2;
update aluno set fkCurso = 2 where idAluno = 3;

select * from curso join aluno on idCurso = fkCurso;
select * from curso join aluno on idCurso = fkCurso where sigla = 'ADS';
