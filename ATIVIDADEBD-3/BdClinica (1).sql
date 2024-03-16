CREATE DATABASE ClinicaBD;
USE ClinicaBD;

CREATE TABLE Ambulatorios (
    nroa INT PRIMARY KEY NOT NULL,
    andar INT NOT NULL,
    capacidade INT
);

CREATE TABLE Medicos (
    codm INT PRIMARY KEY NOT NULL,
    nome VARCHAR(40) NOT NULL,
    nasc DATE NOT NULL,
	especialidade VARCHAR(20),
	CPF VARCHAR (14) UNIQUE,
	cidade VARCHAR (30),
	nroa INT,
    FOREIGN KEY (nroa) REFERENCES Ambulatorios(nroa)
);

CREATE TABLE Pacientes (
    codp INT PRIMARY KEY NOT NULL,
    nome VARCHAR (40) NOT NULL,
    nasc DATE NOT NULL,
	cidade VARCHAR (30),
	CPF VARCHAR (14) UNIQUE,
	doenca VARCHAR (40) NOT NULL,
);

CREATE TABLE Funcionarios (
    codf INT PRIMARY KEY NOT NULL,
    nome VARCHAR(40) NOT NULL,
    nasc DATE,
    CPF VARCHAR(14) UNIQUE,
    cidade VARCHAR(30),
	salario FLOAT,
    cargo VARCHAR(20),
    nroa INT,
    FOREIGN KEY (nroa) REFERENCES Ambulatorios(nroa)
);

CREATE TABLE Consultas (
    codm INT,
    codp INT,
    data DATE,
    hora TIME,
    PRIMARY KEY (codm, codp, data, hora),
    FOREIGN KEY (codm) REFERENCES Medicos(codm),
    FOREIGN KEY (codp) REFERENCES Pacientes(codp)
);

--INSERINDO AMBULATORIOS
SELECT * FROM Ambulatorios
INSERT INTO Ambulatorios (nroa, andar, capacidade) VALUES 
(1, 1, 30),
(2, 1, 50),
(3, 2, 40),
(4, 2, 25),
(5, 2, 55);


--INSERINDO MEDICOS
SELECT * FROM Medicos
INSERT INTO Medicos (codm, nome, nasc, especialidade, CPF, cidade, nroa)
VALUES
    (1, 'João', '1990-11-01', 'Ortopedia', '10000100000', 'Florianopolis', 1),
    (2, 'Maria', '1981-02-02', 'Traumatologia', '10000110000', 'Blumenau', 2),
	(3, 'Pedro', '1982-03-03', 'Pediatria', '11000100000', 'São José ', 5),
	(4, 'Carlos', '2000-04-04', 'Ortopedia', '11000110000', 'Joinville', 4),
	(5, 'Marcia', '1999-05-03', 'Neurologia', '11000111000 ', 'Biguacu', 3);


--INSERINDO PACIENTES
SELECT * FROM Pacientes
INSERT INTO Pacientes (codp, nome, nasc, cidade, CPF, doenca)
VALUES
    (1, 'Ana', '1980-02-02', 'Florianópolis', '20000200000', 'Gripe'),
    (2, 'Paulo', '2000-01-24', 'Palhoca', '20000220000', 'Fratura'),
    (3, 'Lucia', '2001-12-30', 'Biguacu', '22000200000', 'Tendinite'),
    (4, 'Carlos', '2005-07-28', 'Joinville', '11000110000', 'Sarampo');


--INSERINDO FUNCIONARIOS
SELECT * FROM Funcionarios
INSERT INTO Funcionarios (codf, nome, nasc, CPF, cidade, salario, cargo, nroa)
VALUES
    (1, 'Rita', '2000-12-31', '20000100000', 'Sao Jose', 1200, 'Recepcionista', 5),
    (2, 'Maria', '1999-12-29', '30000110000', 'Palhoca', 1220, 'Diretor', 2),
    (3, 'Caio', '1980-10-10', '41000100000', 'Florianopolis', 1100, 'Enfermeiro', 4),
	(4, 'Carlos', '2005-08-09', '51000110000', 'Florianopolis', 1200, 'Recepcionista', 3),
    (5, 'Paula', '2006-09-08', '61000111000', 'Florianopolis', 2500, 'Enfermeiro', 5);


--INSERINDO CONSULTAS
SELECT * FROM Consultas
INSERT INTO Consultas (codm, codp, data, hora)
VALUES
    (1, 1, '2006-06-12', '14:00:00'),
    (1, 4, '2006-06-13', '10:00:00'),
    (2, 1, '2006-06-13', '09:00:00'),
    (2, 2, '2006-06-13', '11:00:00'),
    (2, 3, '2006-06-14', '14:00:00'),
    (2, 4, '2006-06-14', '17:00:00'),
    (3, 1, '2006-06-19', '18:00:00'),
    (3, 3, '2006-06-12', '10:00:00'),
    (3, 4, '2006-06-19', '13:00:00'),
    (4, 4, '2006-06-20', '13:00:00'),
    (4, 4, '2006-06-22', '19:30:00');


--MODIFICAÇÕES 1) O paciente Paulo mudou-se para IlhotaUPDATE Pacientes
SET cidade = 'Ilhota'
WHERE nome = 'Paulo';
SELECT * FROM Pacientes

--MODIFICAÇÕES 2) A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Julho de 2006
UPDATE Consultas
SET hora = '12:00:00', data = '2006-07-04'
WHERE codm = 1 AND codp = 4;
SELECT * FROM Consultas

--MODIFICAÇÕES 3) A doença da paciente Ana agora é gastrite
UPDATE Pacientes
SET doenca = 'Gastrite'
WHERE nome = 'Ana';
SELECT * FROM Pacientes

--MODIFICAÇÕES 4) A consulta do médico Pedro (codf = 3) com o paciente Carlos (codf = passou para uma hora e meia depois
UPDATE Consultas
SET hora = DATEADD(minute, 90, hora)
WHERE codm = 3 AND codp = 4;
SELECT * FROM Consultas

--MODIFICAÇÕES 5) O funcionário Carlos (codf = 4) deixou a clínica
DELETE FROM Funcionarios
WHERE codf = 4;
SELECT * FROM Funcionarios

--MODIFICAÇÕES 6) As consultas marcadas após as 19 horas foram canceladas
ALTER TABLE Consultas
ADD status VARCHAR(20)
UPDATE Consultas
SET status = 'cancelada'
WHERE CAST(hora AS TIME) >= '19:00:00';
SELECT * FROM Consultas

--MODIFICAÇÕES 7) Os pacientes com gastrite ou nascimento inferior a 10 anos deixaram a clínica
DELETE FROM Consultas
WHERE codp IN (
    SELECT codp
    FROM Pacientes
    WHERE doenca = 'Gastrite'
    OR DATEDIFF(YEAR, nasc, GETDATE()) < 10
);
SELECT * FROM Consultas

DELETE FROM Pacientes
WHERE doenca = 'Gastrite'
OR DATEDIFF(YEAR, nasc, GETDATE()) < 10;
SELECT * FROM Pacientes

--MODIFICAÇÕES 8) Os médicos que residem em Biguacu e Palhoca deixaram a clínica
DELETE FROM Medicos
WHERE cidade IN ('Biguacu', 'Palhoça');
SELECT * FROM Medicos
