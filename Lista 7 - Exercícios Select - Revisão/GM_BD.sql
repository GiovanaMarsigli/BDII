CREATE DATABASE GM
USE GM

CREATE TABLE Pessoa (
    id INT PRIMARY KEY,
    nome VARCHAR(60),
    email VARCHAR(60),
    salario FLOAT,
    data_nascimento DATE,
    cidade VARCHAR(60),
    estado VARCHAR(2)
);

INSERT INTO Pessoa (id, nome, email, salario, data_nascimento, cidade, estado)
VALUES
    (1, 'Jo�o', 'joao1970@gmail.com', 8000.00, '1970-05-20', 'S�o Paulo', 'SP'),
    (2, 'Camila', 'camila@gmail.com', 3000.00, '1985-07-23', 'S�o Paulo', 'SP'),
    (3, 'Marcio', 'marcio@gmail.com', 900.00, '1982-03-15', 'Campinas', 'SP'),
    (4, 'Fernanda', 'fernanda@gmail.com', 3500.00, '1987-08-18', 'Rio de Janeiro', 'RJ'),
    (5, 'Jos�', 'jose@gmail.com', 2200.00, '1987-09-18', 'Guaxup�', 'MG'),
    (6, 'Fabiano', 'fabiano@gmail.com', 6800.00, '1981-01-30', 'Po�os de Caldas', 'MG'),
    (7, 'Marcos', 'marcos@gmail.com', 3200.00, '1989-02-08', 'Vit�ria', 'ES')

	SELECT * FROM Pessoa;

--1. Insira o c�digo para buscar todos os funcion�rios cujo nome comece com uma vogal (ser� preciso testar para todas as 5 vogais � a, e, i, o, u)
SELECT * FROM Pessoa WHERE nome LIKE 'a%' OR nome LIKE 'e%' OR nome LIKE 'i%' OR nome LIKE 'o%' OR nome LIKE 'u%';

--2. Insira o c�digo para exibir nomes e sal�rios em ordem decrescente de sal�rio 
SELECT nome, salario FROM Pessoa ORDER BY salario DESC;

--3. Insira o c�digo para exibir nomes e e-mails de funcion�rios em ordem alfab�tica de nome
SELECT nome, email FROM Pessoa ORDER BY nome ASC;

--4. Listar o sal�rio mais alto
SELECT MAX(salario) AS salario_maximo FROM Pessoa;SELECT 
FROM   Pessoa

--5. Exiba a m�dia dos sal�rios
SELECT AVG(salario) AS media_salarios FROM Pessoa;

--6. Exiba nomes, sal�rios e e-mails dos funcion�rios com ID entre 3 e 7
SELECT id, nome, salario, email FROM Pessoa WHERE id BETWEEN 3 AND 7;

