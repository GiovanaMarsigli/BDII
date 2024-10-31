CREATE DATABASE Funcionarios1;
USE Funcionarios1;

CREATE TABLE Departamentos (
    Codigo_depto INT PRIMARY KEY,
    NomeDepto VARCHAR(100)
);

CREATE TABLE Funcionarios (
    Codigo_func INT PRIMARY KEY,
    NomeFunc VARCHAR(100),
    SobreNome VARCHAR(100),
    DataNasci DATE,
    CPF VARCHAR(14),
    RG VARCHAR(20),
    Endereco VARCHAR(200),
    CEP VARCHAR(9),
    Cidade VARCHAR(100),
    Fone VARCHAR(20),
    CodigoDepartamento INT,
    Funcao VARCHAR(100),
    Salario DECIMAL(10, 2),
    FOREIGN KEY (CodigoDepartamento) REFERENCES Departamentos(Codigo_depto)
);

-- Inserir dados nos Departamentos
INSERT INTO Departamentos (Codigo_depto, NomeDepto) VALUES
(1, 'Recursos Humanos'),
(2, 'Vendas'),
(3, 'Telefonista'),
(4, 'Supervisor');
SELECT * FROM Departamentos;


-- Inserir dados nos Funcionarios
INSERT INTO Funcionarios (Codigo_func, NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, CodigoDepartamento, Funcao, Salario) VALUES
(1, 'Giovana', 'Marsigli', '1990-07-23', '111.111.111-11', '123456', 'Rua Antony, 111', '12345-678', 'São Paulo', '(11) 1234-5678', 1, '	Recursos Humanos', 3000.00),
(2, 'Larissa', 'Marsigli', '1990-04-14', '222.222.222-22', '234567', 'Rua Benedict, 222', '23456-789', 'São Paulo', '(11) 2345-6789', 2, 'Vendas', 3200.00),
(3, 'Laura', 'Reis', '1990-11-08', '333.333.333-33', '345678', 'Rua Colin, 333', '34567-890', 'São Paulo', '(11) 3456-7890', 1, 'Recursos Humanos', 3500.00),
(4, 'Luiza', 'Reis', '1990-03-20', '444.444.444-44', '456789', 'Rua Daphne, 444', '45678-901', 'São Paulo', '(11) 4567-8901', 3, 'TI', 3700.00),
(5, 'Giullia', 'Domingues', '1990-01-09', '555.555.555-55', '567890', 'Rua Eloise,555', '56789-012', 'São Paulo', '(11) 5678-9012', 2, 'Vendas', 3900.00),
(6, 'Juliana', 'Marsigli', '1990-11-10', '666.666.666-66', '678901', 'Rua Francesca, 666', '67890-123', 'São Paulo', '(11) 6789-0123', 1, 'Recursos Humanos', 4100.00),
(7, 'Lucia', 'Marsigli', '1990-03-12', '777.777.777-77', '789012', 'Rua Gregory, 777', '78901-234', 'São Paulo', '(11) 7890-1234', 3, 'TI', 4300.00),
(8, 'Odair', 'Batista', '1990-02-24', '888.888.888-88', '890123', 'Rua Hyacinth, 888', '89012-345', 'São Paulo', '(11) 8901-2345', 1, 'Recursos Humanos', 4500.00),
(9, 'Alexandre', 'Borges', '1990-03-18', '999.999.999-99', '901234', 'Rua Violet, 999', '90123-456', 'São Paulo', '(11) 9012-3456', 4, 'Supervisor', 4700.00),
(10, 'Gustavo', 'Batista', '1990-03-10', '000.000.000-00', '012345', 'Rua Edmund, 000', '01234-567', 'Recife', '(11) 0123-4567', 3, 'Telefonista', 4900.00);
SELECT * FROM Funcionarios;

--1 - Listar nome e sobrenome ordenado por sobrenome:
SELECT NomeFunc, SobreNome FROM Funcionarios ORDER BY SobreNome;

--2 - Listar todos os campos de funcionários ordenados por cidade:
SELECT * FROM Funcionarios ORDER BY Cidade;

--3 - Listar os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo nome completo:
SELECT *FROM Funcionarios
WHERE Salario > 1000.00
ORDER BY CONCAT(NomeFunc, ' ', SobreNome);

--4 - Listar a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho:
SELECT DataNasci, LEFT(NomeFunc, CHARINDEX(' ', NomeFunc + ' ') - 1) AS PrimeiroNome FROM Funcionarios
ORDER BY DataNasci;

--5 - Listar os funcionários nesta sequência de campos: Sobrenome, nome, cidade, endereço, fone:
SELECT SobreNome, NomeFunc, Cidade, Endereco, Fone FROM Funcionarios;

--6 - Listar o total da folha de pagamento:
SELECT SUM(Salario) AS TotalFolhaPagamento FROM Funcionarios;

--7 - Listar o nome completo, o salário e a função de todos os funcionários ordenados por função
SELECT CONCAT(NomeFunc, ' ', SobreNome) AS NomeCompleto, Salario, Funcao FROM Funcionarios
ORDER BY Funcao;

--8 - Listar os funcionários que têm a função de supervisor
SELECT * FROM Funcionarios
WHERE Funcao = 'Supervisor';

--9 - Liste a quantidade de funcionários desta empresa
SELECT COUNT(*) AS QuantidadeFuncionarios FROM Funcionarios;

--10 - Liste o salário médio pago pela empresa
SELECT AVG(Salario) AS SalarioMedio FROM Funcionarios;

--11 - Liste os nomes dos funcionários que moram em Recife e que exerçam a função de Telefonista
SELECT CONCAT(NomeFunc, ' ', SobreNome) AS NomeCompleto FROM Funcionarios
WHERE Cidade = 'Recife' AND Funcao = 'Telefonista';








