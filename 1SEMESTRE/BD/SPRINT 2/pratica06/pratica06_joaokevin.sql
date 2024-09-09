use sprint2;


create table projeto (
idProjeto int primary key,
nome varchar(45),
descricao varchar(45));

create table aluno (
ra int primary key auto_increment,
nome varchar(45),
telCell varchar(45),
telFixo varchar(45),
fkRepresentante int,
constraint fkRepresentanteAluno foreign key (fkRepresentante) references aluno(ra),
fkProjeto int,
constraint fkProjetoAluno foreign key (fkProjeto) references projeto(idProjeto)
) auto_increment = 1241001;



create table acompanhante (
idAcompanhante int auto_increment,
fkAluno int,
constraint pkComposta primary key (idAcompanhante, fkAluno),	
nome varchar(45),
relacao varchar(45),
constraint fkAlunoAcompanhante foreign key (fkAluno) references aluno(ra));

insert into projeto values 
(1, 'Caprinos', 'Gerenciamento de caprino dentro dos capris'),
(2, 'Fluxo de Pessoas No Mercado', 'Gerenciamento de fluxo de pessoas no mercado');


insert into aluno (ra, nome, telCell, telFixo, fkProjeto)values 
(default, 'Joao Kevin', '11987654321', null,  1),
(default, 'Robson', '11987654321', '1133456789', 1),
(default, 'Osvaldo', '11987654321', '1133456789', 1),
(default, 'Mario', '11987654321', '1133456789',  1),
(default, 'Roberta', '11987654321', '1133456789', 2),
(default, 'Maria', '11987654321', null , 2),
(default, 'Hamilton', '11987654321', '11445678964' , 2);

update aluno set fkRepresentante = 1241001 where ra = 1241002;
update aluno set fkRepresentante = 1241001 where ra = 1241003;
update aluno set fkRepresentante = 1241004 where ra = 1241005;
update aluno set fkRepresentante = 1241006 where ra = 1241007;

insert into acompanhante values
(default, 1241001, 'Vanessa', 'Mãe'),
(default, 1241001, 'Adilson', 'Pai'),
(default, 1241002, 'Rayssa', 'Mae'),
(default, 1241003, 'Olinda', 'Mae'),
(default, 1241004, 'Lucas', 'Pai'),
(default, 1241005, 'Leandro', 'Irmao'),
(default, 1241006, 'Silvana', 'Vó'),
(default, 1241007, 'Joao Vitor', 'Padastro');


select * from projeto;

select * from aluno;
select * from acompanhante;

select * from projeto join aluno on aluno.fkProjeto = projeto.idProjeto;

select aluno.ra as raAluno,
aluno.nome as NomeAluno,
acompanhante.nome as NomeAcompanhante,
acompanhante.relacao as RelacaoComAluno from aluno join acompanhante on acompanhante.fkAluno = aluno.ra;

select * from aluno join aluno as representante on representante.ra = aluno.fkRepresentante;

select * from projeto 
join aluno on aluno.fkProjeto = projeto.idProjeto
join acompanhante on acompanhante.fkAluno = aluno.ra where projeto.nome like 'caprinos';

select * from projeto 
join aluno on aluno.fkProjeto = projeto.idProjeto
join acompanhante on acompanhante.fkAluno = aluno.ra;


---------------------------------------------------------
-- questao 2

create table campanha (
idCampanha int primary key auto_increment,
categoria varchar(45),
instituicao1 varchar(45),
instituicao2 varchar(45),
dtFinal date,
fkOrganizador int
)auto_increment 500;

create table organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
email varchar(100),
fkExperiente int,
constraint fkExperienteOrganizador foreign key (fkExperiente) references organizador(idOrganizador),
fkEndereco int)auto_increment 30;

alter table campanha add constraint fkOrganizadorCampanha foreign key (fkOrganizador) references organizador(idOrganizador);

create table endereco (
idEndereco int primary key auto_increment,
cep char(9),
rua varchar(45),
numero varchar(45),
bairro varchar(45),
complemento varchar(45));

alter table organizador add constraint fkEnderecoOrganizador foreign key (fkEndereco) references endereco(idEndereco);

insert into campanha(idCampanha, categoria, instituicao1, instituicao2, dtFinal) values
(default, 'agua', 'Sabesp', 'CIS', '2024-07-07'),
(default, 'alimento', 'Pao de Açucar', 'Extra', '2024-10-24'),
(default, 'docao de roupa', 'Ong JK', 'Ong K', '2024-12-12');

insert into organizador(idOrganizador, nome, email, fkExperiente) values
(default, 'Joao Kevin', 'joaokevin100@gmail.com', null),
(default, 'Kauan', 'kauan54@gmail.com', 30),
(default, 'Gabriela', 'gabriela@gmail.com', 30),
(default, 'Gabriel', 'gabriel765@hotmail.com', null),
(default, 'Ramiro', 'ramiro23@hotmail.com', 33);

insert into endereco values 
(default, '05822-010', 'rua antonio ramos rosa', '12A', 'Jardim Sao luiz', 'Casa amarela'),
(default, '05000-012', 'rua josualdo pereira', '1222', 'Jardim Cascavel', 'Olinda'),
(default, '05000-012', 'rua josualdo pereira', '1222', 'Jardim Cascavel', 'Olinda'),
(default, '05000-012', 'rua josualdo pereira', '1222', 'Jardim Cascavel', 'Olinda'),
(default, '05000-012', 'rua josualdo pereira', '1222', 'Jardim Cascavel', 'Olinda');


update organizador set fkEndereco = 1 where idOrganizador = 30;
update organizador set fkEndereco = 2 where idOrganizador = 31;
update organizador set fkEndereco = 3 where idOrganizador = 32;
update organizador set fkEndereco = 4 where idOrganizador = 33;
update organizador set fkEndereco = 5 where idOrganizador = 34;

update campanha set fkOrganizador = 31  where idCampanha = 500;
update campanha set fkOrganizador = 30  where idCampanha = 501;
update campanha set fkOrganizador = 32  where idCampanha = 502;

select * from campanha;
select * from organizador;
select * from endereco;

select * from organizador join campanha on campanha.fkOrganizador = organizador.idOrganizador;

select * from organizador join campanha on campanha.fkOrganizador = organizador.idOrganizador where organizador.nome like 'Joao Kevin';

select * from organizador join organizador as experiente on experiente.fkExperiente = organizador.idOrganizador;

select * from organizador join organizador as experiente on experiente.fkExperiente = organizador.idOrganizador where organizador.nome like 'Joao Kevin';

select * from campanha 
join organizador on idOrganizador
join organizador as experiente on experiente.fkExperiente = organizador.idOrganizador; 

