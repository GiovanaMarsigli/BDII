CREATE DATABASE BDRETORNO5;
USE BDRETORNO5;

CREATE TABLE funcionarios (
id INT PRIMARY KEY IDENTITY,
nome VARCHAR(60), 
email VARCHAR(60),
salario FLOAT, 
data_nascimento DATE, 
cidade VARCHAR(60), 
estado VARCHAR(2));

INSERT INTO funcionarios VALUES ('João', 'joao1970@gmail.com', 8000.00,'1970-05-20','São Paulo','SP');
INSERT INTO funcionarios VALUES ('Camila', 'camila@gmail.com', 3000.00,'1985-07-23','São Paulo','SP');
INSERT INTO funcionarios VALUES ('Marcio', 'marcio@gmail.com', 900.00,'1982-03-15','Campinas','SP');
INSERT INTO funcionarios VALUES ('Fernanda', 'fernanda@gmail.com', 3500.00,'1987-08-18','Rio de Janeiro','RJ');
INSERT INTO funcionarios VALUES ('José', 'jose@gmail.com', 2200.00,'1990-09-18','Guaxupé','MG');
INSERT INTO funcionarios VALUES ('Fabiano', 'fabiano@gmail.com', 6800.00,'1981-01-30','Poços de Caldas','MG');
INSERT INTO funcionarios VALUES ('Marcos', 'marcos@gmail.com', 3200.00,'1994-11-23','Vitória','ES');

SELECT * FROM funcionarios;

-- 1.a) 2 funcionários novos do estado do Paraná
INSERT INTO funcionarios VALUES ('Owen Hunt', 'owen.pr@gmail.com', 2500.00, '1992-05-15', 'Curitiba', 'PR');
INSERT INTO funcionarios VALUES ('Callie Torres', 'callie.pr@gmail.com', 4200.00, '1994-11-23', 'Maringá', 'PR');

-- 1.b) 2 funcionários novos do estado do Amazonas
INSERT INTO funcionarios VALUES ('Arizona Robbins', 'arizona.am@gmail.com', 3500.00, '1988-06-11', 'Manaus', 'AM');
INSERT INTO funcionarios VALUES ('April Kepner', 'april.am@gmail.com', 3700.00, '1990-10-29', 'Parintins', 'AM');

-- 1.c) 5 funcionários de estados do Nordeste
INSERT INTO funcionarios VALUES ('Mark Sloan', 'mark.ce@gmail.com', 2500.00, '1995-03-20', 'Fortaleza', 'CE');
INSERT INTO funcionarios VALUES ('Lexie Grey', 'lexie.pe@gmail.com', 3000.00, '1992-07-14', 'Recife', 'PE');
INSERT INTO funcionarios VALUES ('Teddy Altman', 'teddy.ba@gmail.com', 2800.00, '1993-09-09', 'Salvador', 'BA');
INSERT INTO funcionarios VALUES ('Jo Wilson', 'jo.pb@gmail.com', 3200.00, '1996-12-05', 'João Pessoa', 'PB');
INSERT INTO funcionarios VALUES ('Amelia Shepherd', 'amelia.ma@gmail.com', 3500.00, '1998-08-17', 'São Luís', 'MA');

-- 1.d) 1 funcionário novo do estado do Rio Grande do Sul
INSERT INTO funcionarios VALUES ('Maggie Pierce', 'maggie.rs@gmail.com', 4500.00, '2000-01-01', 'Porto Alegre', 'RS');

SELECT * FROM funcionarios;

--SELECTS
-- 2) Média de salários de funcionários de SC, RS ou PR
SELECT AVG(salario) AS media_salarios_sc_rs_pr
FROM funcionarios
WHERE estado IN ('SC', 'RS', 'PR');

-- 3) Média de salários de funcionários do Nordeste
SELECT AVG(salario) AS media_salarios_nordeste
FROM funcionarios
WHERE estado IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE');

-- 4) Salário mais alto entre todos os funcionários
SELECT MAX(salario) AS salario_mais_alto
FROM funcionarios;

-- 5) Quantidade de funcionários do Sudeste
SELECT COUNT(*) AS quantidade_funcionarios_sudeste
FROM funcionarios
WHERE estado IN ('SP', 'RJ', 'MG', 'ES');

-- 6) Menor salário entre todos os funcionários
SELECT MIN(salario) AS menor_salario
FROM funcionarios;

-- 7) Funcionários nascidos antes de 2000
SELECT *
FROM funcionarios
WHERE data_nascimento < '2000-01-01';

-- 8) Média de salários de todos os funcionários nascidos antes de 2000
SELECT AVG(salario) AS media_salarios_antes_2000
FROM funcionarios
WHERE data_nascimento < '2000-01-01';

-- 9) Funcionários nascidos após 2000
SELECT *
FROM funcionarios
WHERE data_nascimento >= '2000-01-01';

-- 10) Média de salários de todos os funcionários nascidos após 2000
SELECT AVG(salario) AS media_salarios_apos_2000
FROM funcionarios
WHERE data_nascimento >= '2000-01-01';
