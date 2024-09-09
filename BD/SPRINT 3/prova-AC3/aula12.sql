CREATE DATABASE aula12;

USE aula12;

CREATE TABLE paciente (
idPaciente int primary key auto_increment,
nome varchar(45)) auto_increment = 100;

INSERT INTO paciente (nome) VALUES
	('Brian'),
	('Dom'),
	('Mia');
    
CREATE TABLE medico (
idMedico int primary key auto_increment,
nome varchar(45)) auto_increment = 1;

INSERT INTO medico (nome) VALUES
	('Dr. Rock'),
	('Dr. Shawn'),
	('Dra. Letty');
    
-- criar a tabela associativa
CREATE TABLE consulta (
idConsulta int,
fkPaciente int,
fkMedico int,
primary key (idConsulta, fkPaciente, fkMedico),
dtConsulta datetime,
valor decimal(5,2),
foreign key (fkPaciente) references paciente(idPaciente),
foreign key (fkMedico) references medico(idMedico));

INSERT INTO consulta VALUES
	(1, 100, 1, '2024-05-06 14:00:00', 1.99),
	(1, 100, 2, '2024-05-06 15:00:00', 2.99),
	(1, 101, 1, '2024-05-06 15:00:00', 1.17),
	(1, 101, 2, '2024-05-06 16:00:00', 1.97),
	(2, 100, 1, '2024-05-16 14:00:00', 0);
    
SELECT * FROM paciente JOIN consulta
	ON idPaciente = fkPaciente
    JOIN medico
    ON idMedico = fkMedico;

-- funções matemáticas
SELECT * FROM paciente LEFT JOIN consulta
	ON idPaciente = fkPaciente
    LEFT JOIN medico
    ON idMedico = fkMedico
    WHERE idConsulta is null
UNION    
SELECT * FROM paciente RIGHT JOIN consulta
	ON idPaciente = fkPaciente
    RIGHT JOIN medico
    ON idMedico = fkMedico
    WHERE idConsulta is null;
    
-- COUNT() - CONTABILIZA CAMPOS COM VALOR
SELECT COUNT(*) FROM consulta;
SELECT COUNT(dtConsulta) FROM consulta;

SELECT valor FROM consulta;

INSERT INTO consulta 
	(idConsulta, fkPaciente, fkMedico, valor) VALUES
    (1,102,3, 1.99);
    
SELECT * FROM consulta;

-- DISTINCT - SÓ APARECE OS VALORES QUE SÃO DIFERENTES
SELECT DISTINCT valor FROM consulta;

SELECT COUNT(DISTINCT valor) FROM consulta;
SELECT COUNT(valor) FROM consulta;

-- a consulta mais cara
SELECT MAX(valor) FROM consulta;

-- a consulta mais barata
SELECT MIN(valor) FROM consulta;
SELECT valor FROM consulta ORDER BY valor LIMIT 2;

-- a soma
SELECT SUM(valor) FROM consulta;
SELECT SUM(valor) FROM consulta JOIN paciente 
	ON idPaciente = fkPaciente
    WHERE paciente.nome = 'Brian';
    
-- GROUP BY
SELECT nome, SUM(valor) FROM paciente JOIN consulta
	ON idPaciente = fkPaciente
    GROUP BY nome;
    
-- A MÉDIA
SELECT AVG(valor) FROM consulta;
SELECT ROUND(AVG(valor),2) FROM consulta;
SELECT TRUNCATE(AVG(valor),2) FROM consulta;

-- SUBQUERY
SELECT nome, min(valor) FROM consulta JOIN paciente
	ON idPaciente = fkPaciente;
    
SELECT DISTINCT nome FROM consulta JOIN paciente
	ON idPaciente = fkPaciente
    WHERE valor >= (select avg(valor) from consulta);