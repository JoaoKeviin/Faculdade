use sprint2;

create table atleta (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int);

insert into atleta values 
(1, 'Joao Kevin', 'futebol', 10),
(2, 'Murilo', 'futebol', 14),
(3, 'Roberta', 'volei', 10),
(4, 'Airton', 'volei', 23),
(5, 'Lebron Joao', 'basquete', 30),
(6, 'Souza', 'basquete', 5);

create table pais (
idPais int primary key,
nome varchar (30),
capital varchar (40));

insert into pais values
(1, 'Brasil', 'Brasilia'),
(2, 'Estados unidos', 'Washington'),
(3, 'Holanda', 'Amsterdâ'),
(4, 'China', 'Pequin');

alter table atleta add column fkPais int, add constraint  fkAtletaPais foreign key (fkPais) references pais (idPais);

select * from atleta;


update atleta set fkPais = 1 where idAtleta in (2, 3);
update atleta set fkPais = 4 where idAtleta in (1, 4);
update atleta set fkPais = 3 where idAtleta = 5;
update atleta set fkPais = 2 where idAtleta = 6;


select a.nome as NomeAtleta,
p.nome as NomePais
from pais as p join atleta as a on a.fkPais = p.idPais;

select a.nome as NomeAtleta,
p.nome as NomePais
from pais as p join atleta as a on a.fkPais = p.idPais where a.idAtleta = 5;

select * from pais join atleta on fkPais = idPais where capital = 'Brasilia';
---------------------------------------------------------------------------------------------------------------------------------------------------------------
create table musica (
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40));

insert into musica values
(1, 'Vai chover', 'Fernandinho', 'Gospel'),
(2, 'Me Atraiu', 'Gabriela Rocha', 'Gospel'),
(3, 'Todas as coisas', 'Fernandinho', 'Gospel'),
(4, 'Tem café', 'Henry freitas', 'forro'),
(5, 'Jacaré 1000%', 'Henry freitas', 'forro'),
(6, 'Beat lt', 'Michael jackson', 'pop');

create table album (
idAlbum int primary key auto_increment,
nome varchar (40),
tipo varchar (40), check (tipo in('digital', 'fisico')),
dtLancamento date);

insert into album values
(default, 'fernandinho acustico', 'fisico', '2014-11-05'),
(default, 'terapia de verao 1000%', 'digital', '2023-11-18');

insert into album values
(default, 'ben', 'fisico', '1972-08-04');

delete from musica where idMusica = 2; -- essa musica não tinha album :)
select * from musica;
select * from album;

alter table musica add column fkAlbum int, add constraint  fkMusicaAlbum foreign key (fkAlbum) references album (idAlbum);

describe musica;
describe album;

update musica set fkAlbum = 1 where idMusica in (1, 3);
update musica set fkAlbum = 2 where idMusica in (4, 5);
update musica set fkAlbum = 3 where idMusica = 6;


select * from album join musica on idAlbum = fkAlbum;
select t.titulo as NomeDaMusica, a.nome as NomeDoAlbum from album as a join musica as t on t.fkAlbum = a.idAlbum;
select * from album join musica on idAlbum = fkAlbum where tipo = 'fisico';