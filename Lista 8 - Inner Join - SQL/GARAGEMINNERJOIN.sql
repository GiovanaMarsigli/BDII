CREATE DATABASE BD_Garagem1;
USE BD_Garagem1;

-- CRIAÇÃO DA TABELA CLIENTE
CREATE TABLE Cliente(
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    data_nasc DATE NOT NULL
);

-- CRIAÇÃO DA TABELA MODELO
CREATE TABLE Modelo(
    cod_mod INT PRIMARY KEY,
    desc_mod VARCHAR(50)
);

-- CRIAÇÃO DA TABELA VEICULO
CREATE TABLE Veiculo(
    placa_carro VARCHAR(7) PRIMARY KEY,
    cod_mod INT,
    cpf VARCHAR(14),
    cor_carro VARCHAR(20),
    ano DATE NOT NULL,
    FOREIGN KEY (cod_mod) REFERENCES Modelo(cod_mod),
    FOREIGN KEY (cpf) REFERENCES Cliente(cpf)
);

-- CRIAÇÃO DA TABELA PATIO
CREATE TABLE Patio(
    patio_num INT PRIMARY KEY,
    endereco VARCHAR(50),
    capacidade INT
);

-- CRIAÇÃO DA TABELA ESTACIONAMENTO
CREATE TABLE Estacionamento(
    cod INT PRIMARY KEY,
    patio_num INT,
    placa_carro VARCHAR(7),
    dtEntrada DATE,
    dtSaida DATE,
    hsEntrada TIME,
    hrSaida TIME,
    FOREIGN KEY (patio_num) REFERENCES Patio(patio_num),
    FOREIGN KEY (placa_carro) REFERENCES Veiculo(placa_carro)
);

-- INSERINDO DADOS NA TABELA CLIENTE
INSERT INTO Cliente (cpf, nome, data_nasc) VALUES 
('123.456.789-00', 'Larissa Marsigli', '1980-04-14'),
('122.345.678-00', 'Juliana Marsigli', '1990-11-10'),
('123.345.678-00', 'Maria Lucia Marsigli', '1975-03-06');

-- INSERINDO DADOS NA TABELA MODELO
INSERT INTO Modelo (cod_mod, desc_mod) VALUES 
(1, 'Fusca'),  
(2, 'Ferrari'),  
(3, 'Honda'); 

-- INSERINDO DADOS NA TABELA VEICULO
INSERT INTO Veiculo (placa_carro, cod_mod, cpf, cor_carro, ano) VALUES 
('JJJ2020', 1, '123.456.789-00', 'preto', '2015-01-01'),  
('JEG1010', 2, '122.345.678-00', 'vermelho', '2018-05-20'), 
('ABC1111', 3, '123.345.678-00', 'cinza', '2001-09-10'), 
('DFG2222', 1, '123.456.789-00', 'verde', '1999-12-30'); 

-- INSERINDO DADOS NA TABELA PATIO
INSERT INTO Patio (patio_num, endereco, capacidade) VALUES 
(1, 'Rua Francesca, 123', 111), 
(2, 'Rua Benedict, 456', 222),  
(3, 'Rua Colin, 789', 333);

-- INSERINDO DADOS NA TABELA ESTACIONAMENTO
INSERT INTO Estacionamento (cod, patio_num, placa_carro, dtEntrada, dtSaida, hsEntrada, hrSaida) VALUES 
(1, 1, 'JJJ2020', '2023-05-01', '2023-05-01', '08:00:00', '12:00:00'),  
(2, 2, 'JEG1010', '2023-05-02', '2023-05-02', '09:00:00', '11:00:00'), 
(3, 3, 'ABC1111', '2023-05-03', '2023-05-03', '10:00:00', '14:00:00'), 
(4, 1, 'DFG2222', '2023-05-04', '2023-05-04', '11:00:00', '13:00:00'); 

-- a. Exiba a placa e o nome dos donos de todos os veículos
SELECT Veiculo.placa_carro, Cliente.nome
FROM Veiculo
JOIN Cliente ON Veiculo.cpf = Cliente.cpf;

-- b. Exiba o CPF e o nome do cliente que possui o veículo de placa “JJJ-2020”
SELECT Cliente.cpf, Cliente.nome
FROM Cliente
JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
WHERE Veiculo.placa_carro = 'JJJ2020';

-- c. Exiba a placa e a cor do veículo que possui o código de estacionamento 1
SELECT Veiculo.placa_carro, Veiculo.cor_carro
FROM Veiculo
JOIN Estacionamento ON Veiculo.placa_carro = Estacionamento.placa_carro
WHERE Estacionamento.cod = 1;

-- d. Exiba o ano e a placa do veículo que possui o código de estacionamento 1
SELECT Veiculo.ano, Veiculo.placa_carro
FROM Veiculo
JOIN Estacionamento ON Veiculo.placa_carro = Estacionamento.placa_carro
WHERE Estacionamento.cod = 1;

-- e. Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000
SELECT Veiculo.placa_carro, Veiculo.ano, Modelo.desc_mod
FROM Veiculo
JOIN Modelo ON Veiculo.cod_mod = Modelo.cod_mod
WHERE Veiculo.ano >= '2000-01-01';

-- f. Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “JEG-1010”
SELECT Patio.endereco, Estacionamento.dtEntrada, Estacionamento.dtSaida
FROM Estacionamento
JOIN Patio ON Estacionamento.patio_num = Patio.patio_num
WHERE Estacionamento.placa_carro = 'JEG1010';

-- g. Exiba a quantidade de vezes os veículos de cor verde estacionaram.
SELECT COUNT(*)
FROM Estacionamento
JOIN Veiculo ON Estacionamento.placa_carro = Veiculo.placa_carro
WHERE Veiculo.cor_carro = 'verde';

-- h. Liste todos os clientes que possuem carro de modelo 1
SELECT Cliente.nome
FROM Cliente
JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
WHERE Veiculo.cod_mod = 1;

-- i. Liste as placas, os horários de entrada e saída dos veículos de cor verde
SELECT Veiculo.placa_carro, Estacionamento.hsEntrada, Estacionamento.hrSaida
FROM Veiculo
JOIN Estacionamento ON Veiculo.placa_carro = Estacionamento.placa_carro
WHERE Veiculo.cor_carro = 'verde';

-- j. Liste todos os estacionamentos do veículo de placa “JJJ2020”
SELECT Estacionamento.*, Veiculo.placa_carro
FROM Estacionamento
INNER JOIN Veiculo ON Estacionamento.placa_carro = Veiculo.placa_carro
WHERE Veiculo.placa_carro = 'JJJ2020';

-- k. Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2
SELECT Cliente.nome
FROM Cliente
JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
JOIN Estacionamento ON Veiculo.placa_carro = Estacionamento.placa_carro
WHERE Estacionamento.cod = 2;

-- l. Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3
SELECT Cliente.cpf
FROM Cliente
JOIN Veiculo ON Cliente.cpf = Veiculo.cpf
JOIN Estacionamento ON Veiculo.placa_carro = Estacionamento.placa_carro
WHERE Estacionamento.cod = 3;

-- m. Exiba a descrição do modelo do veículo cujo código do estacionamento é 2
SELECT Modelo.desc_mod
FROM Modelo
JOIN Veiculo ON Modelo.cod_mod = Veiculo.cod_mod
JOIN Estacionamento ON Veiculo.placa_carro = Estacionamento.placa_carro
WHERE Estacionamento.cod = 2;

-- n. Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos
SELECT Veiculo.placa_carro, Cliente.nome, Modelo.desc_mod
FROM Veiculo
JOIN Cliente ON Veiculo.cpf = Cliente.cpf
JOIN Modelo ON Veiculo.cod_mod = Modelo.cod_mod;
