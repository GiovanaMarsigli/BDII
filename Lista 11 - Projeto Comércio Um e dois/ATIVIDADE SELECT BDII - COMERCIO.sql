CREATE DATABASE bdcomercio4;
USE bdcomercio4;

-- Tabela Estado Civil
CREATE TABLE TBLEstado_Civil (
    cod_est_civ INT PRIMARY KEY,
    desc_est_civ VARCHAR(50)
);

-- Tabela Cliente
CREATE TABLE TBL_Cliente (
    cod_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    cod_est_civ INT,
    salario DECIMAL(10, 2),
    FOREIGN KEY (cod_est_civ) REFERENCES TBLEstado_Civil(cod_est_civ)
);

-- Tabela Conjuge
CREATE TABLE TBL_Conjuge (
    cod_conjuge INT PRIMARY KEY,
    nome_conjuge VARCHAR(100),
    cod_cliente INT,
    FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente(cod_cliente)
);

-- Tabela Telefone
CREATE TABLE TBL_Telefone (
    cod_fone INT,
    cod_cliente INT,
    numero_fone VARCHAR(20),
    PRIMARY KEY (cod_fone, cod_cliente),
    FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente(cod_cliente)
);

-- Tabela Tipo de Telefone
CREATE TABLE TBL_Tipo_Fone (
    cod_fone INT PRIMARY KEY,
    desc_fone VARCHAR(50)
);

-- Tabela Funcionario
CREATE TABLE TBL_Func (
    cod_func INT PRIMARY KEY,
    nome_func VARCHAR(100)
);

-- Tabela Pedido
CREATE TABLE TBL_Pedido (
    cod_pedido INT PRIMARY KEY,
    cod_cliente INT,
    cod_func INT,
    data_pedido DATE,
    FOREIGN KEY (cod_cliente) REFERENCES TBL_Cliente(cod_cliente),
    FOREIGN KEY (cod_func) REFERENCES TBL_Func(cod_func)
);

-- Tabela Produto
CREATE TABLE TBL_Produto (
    cod_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    tipo_produto VARCHAR(50)
);

-- Tabela Item Pedido
CREATE TABLE TBL_Item_Pedido (
    cod_pedido INT,
    cod_produto INT,
    qtde_produto INT,
    PRIMARY KEY (cod_pedido, cod_produto),
    FOREIGN KEY (cod_pedido) REFERENCES TBL_Pedido(cod_pedido),
    FOREIGN KEY (cod_produto) REFERENCES TBL_Produto(cod_produto)
);

-- Tabela Premio
CREATE TABLE TBL_Premio (
    cod_func INT,
    valor_premio DECIMAL(10, 2),
    PRIMARY KEY (cod_func, valor_premio),
    FOREIGN KEY (cod_func) REFERENCES TBL_Func(cod_func)
);

-- Tabela Dependente
CREATE TABLE TBL_Dependente (
    cod_dep INT PRIMARY KEY,
    nome_dep VARCHAR(100),
    data_nasc DATE,
    cod_func INT,
    FOREIGN KEY (cod_func) REFERENCES TBL_Func(cod_func)
);
-- Inserir dados na tabela Estado Civil
INSERT INTO TBLEstado_Civil (cod_est_civ, desc_est_civ) VALUES
(1, 'Casado'),
(2, 'Solteiro'),
(3, 'Separado'),
(4, 'Divorciado'),
(5, 'Viúvo');
SELECT * FROM TBLEstado_Civil

-- Inserir dados na tabela Cliente
INSERT INTO TBL_Cliente (cod_cliente, nome_cliente, cod_est_civ, salario) VALUES
(1, 'Ana Beatriz Silva', 1, 3000.00),
(2, 'Carlos Oliveira Santos', 2, 2500.00),
(3, 'Daniel Santos Oliveira', 1, 3200.00),
(4, 'Elena Rodrigues Ferreira', 3, 2700.00),
(5, 'Francisco Pereira', 1, 3100.00),
(6, 'Gabriela Souza Lima', 2, 2800.00),
(7, 'Hugo Vasconcelos Almeida', 1, 3400.00),
(8, 'Rener Ribeiro', 2, 2600.00),
(9, 'Julia Martins', 4, 2900.00),
(10, 'Luiz Fernando', 5, 2300.00);
SELECT * FROM TBL_Cliente

-- Inserir dados na tabela Tipo de Telefone
INSERT INTO TBL_Tipo_Fone (cod_fone, desc_fone) VALUES
(1, 'Celular'),
(2, 'Residencial'),
(3, 'Comercial'),
(4, 'Fax'),
(5, 'Outro');
SELECT * FROM TBL_Tipo_Fone

-- Inserir dados na tabela Telefone
INSERT INTO TBL_Telefone (cod_fone, cod_cliente, numero_fone) VALUES
(1, 1, '1894-5778'),
(2, 1, '4555-6489'),
(3, 2, '3476-7890'),
(4, 3, '4567-8901'),
(5, 4, '5658-9012'),
(6, 5, '6579-0123'),
(7, 6, '7890-1634'),
(8, 7, '8901-8345'),
(9, 8, '7442-3456'),
(10, 9, '7123-4567');
SELECT * FROM TBL_Telefone

-- Inserir dados na tabela Conjuge
INSERT INTO TBL_Conjuge (cod_conjuge, nome_conjuge, cod_cliente) VALUES
(1, 'Marcos Silva', 1),
(2, 'Beatriz Oliveira', 3),
(3, 'Julia Costa', 5),
(4, 'Paula Almeida', 7),
(5, 'Ricardo Martins', 9);
SELECT * FROM TBL_Conjuge

-- Inserir dados na tabela Funcionario
INSERT INTO TBL_Func (cod_func, nome_func) VALUES
(1, 'Ana Paula'),
(2, 'Laura Martins'),
(3, 'Carlos Santos'),
(4, 'Caio Costa'),
(5, 'Francisco Silva'),
(6, 'Gabriela Lima'),
(7, 'Hugo Almeida'),
(8, 'Roseane Ribeiro'),
(9, 'Lucia Souza'),
(10, 'Marcelo Pinto');
SELECT * FROM TBL_Func

-- Inserir dados na tabela Pedido
INSERT INTO TBL_Pedido (cod_pedido, cod_cliente, cod_func, data_pedido) VALUES
(1, 1, 1, '2024-07-01'),
(2, 2, 2, '2024-07-02'),
(3, 3, 8, '2024-07-03'),
(4, 4, 4, '2024-07-04'),
(5, 5, 1, '2024-07-05'),
(6, 6, 2, '2024-07-06'),
(7, 7, 3, '2024-07-07'),
(8, 8, 4, '2024-07-08'),
(9, 9, 5, '2024-07-09'),
(10, 10, 6, '2024-07-10');
SELECT * FROM TBL_Pedido

-- Inserir dados na tabela Produto
INSERT INTO TBL_Produto (cod_produto, nome_produto, tipo_produto) VALUES
(1, 'Fósforo', 'Utilitário'),
(2, 'Papel Higienico', 'Utilitário'),
(3, 'Lâmpada', 'Iluminação'),
(4, 'Sabão', 'Limpeza'),
(5, 'Detergente', 'Limpeza'),
(6, 'Escova', 'Limpeza'),
(7, 'Papel Toalha', 'Utilitário'),
(8, 'Desinfetante', 'Limpeza'),
(9, 'Amaciante', 'Limpeza'),
(10, 'Sabonete', 'Higiene'),
(11, 'Lixa', 'Utilitário');
SELECT * FROM TBL_Produto

-- Inserir dados na tabela Item Pedido
INSERT INTO TBL_Item_Pedido (cod_pedido, cod_produto, qtde_produto) VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 2),
(4, 4, 7),
(5, 5, 3),
(6, 6, 8),
(7, 7, 4),
(8, 8, 6),
(9, 9, 2),
(10, 10, 5);
SELECT * FROM TBL_Item_Pedido

-- Inserir dados na tabela Premio
INSERT INTO TBL_Premio (cod_func, valor_premio) VALUES
(1, 500.00),
(3, 1000.00),
(4, 200.00),
(5, 800.00),
(6, 300.00),
(7, 1500.00),
(9, 250.00),
(10, 600.00);
SELECT * FROM TBL_Premio

-- Inserir dados na tabela Dependente
INSERT INTO TBL_Dependente (cod_dep, nome_dep, data_nasc, cod_func) VALUES
(1, 'Lucas Silva', '2015-03-15', 1),
(2, 'Maria Silva', '2018-09-22', 1),
(3, 'Pedro Oliveira', '2012-05-10', 3),
(4, 'Ana Costa', '2010-11-30', 4),
(5, 'Rafael Almeida', '2014-07-25', 7),
(6, 'Clara Almeida', '2016-08-19', 7),
(7, 'João Souza', '2013-12-01', 9),
(8, 'Camila Pinto', '2015-05-16', 10);
SELECT * FROM TBL_Dependente


--Lista de Exercícios:
-- Parte 1:
--1 - Selecione o nome dos clientes e o numero de todos os telefones que cada cliente possui:
SELECT C.nome_cliente, T.numero_fone
FROM TBL_Cliente C
JOIN TBL_Telefone T ON C.cod_cliente = T.cod_cliente;

--2 - Selecione o nome dos clientes casados e o nome de seus cônjuges:
SELECT C.nome_cliente AS Cliente, CN.nome_conjuge AS Conjuge
FROM TBL_Cliente C
JOIN TBL_Conjuge CN ON C.cod_cliente = CN.cod_cliente
WHERE C.cod_est_civ = 1;  

--3 - Selecione o nome dos clientes, o numero e o tipo de telefone que cada um possui:
SELECT C.nome_cliente, T.numero_fone, TF.desc_fone
FROM TBL_Cliente C
JOIN TBL_Telefone T ON C.cod_cliente = T.cod_cliente
JOIN TBL_Tipo_Fone TF ON T.cod_fone = TF.cod_fone;

--4 - Selecione todas as colunas da tabela pedido, o nome do cliente que fez o pedido e o nome do funcionário que atendeu cada pedido:
SELECT P.*, C.nome_cliente, F.nome_func
FROM TBL_Pedido P
JOIN TBL_Cliente C ON P.cod_cliente = C.cod_cliente
JOIN TBL_Func F ON P.cod_func = F.cod_func;

--5 - Selecione o código e a data do pedido, o nome do cliente que fez o pedido do funcionário “Francisco”:
SELECT P.cod_pedido, P.data_pedido, C.nome_cliente
FROM TBL_Pedido P
JOIN TBL_Cliente C ON P.cod_cliente = C.cod_cliente
JOIN TBL_Func F ON P.cod_func = F.cod_func
WHERE F.nome_func = 'Francisco Silva';  

--6 - Selecione o código e a data do pedido, o nome do funcionário que atendeu o pedido do cliente “Rener”:
SELECT P.cod_pedido, P.data_pedido, F.nome_func
FROM TBL_Pedido P
JOIN TBL_Func F ON P.cod_func = F.cod_func
JOIN TBL_Cliente C ON P.cod_cliente = C.cod_cliente
WHERE C.nome_cliente = 'Rener Ribeiro';  

-- Parte 2:
--7 - Mostre o nome e a data de nascimento dos dependentes de cada funcionário:
SELECT F.nome_func, D.nome_dep, D.data_nasc
FROM TBL_Func F
JOIN TBL_Dependente D ON F.cod_func = D.cod_func;

--8 - Selecione o código e a data do pedido e o nome de cada produto vendido:
SELECT IP.cod_pedido, P.nome_produto
FROM TBL_Item_Pedido IP
JOIN TBL_Produto P ON IP.cod_produto = P.cod_produto;

--9 - Selecione o código e a data do pedido e o nome de funcionário que vendeu “Fosforo”:
SELECT P.cod_pedido, P.data_pedido, F.nome_func
FROM TBL_Item_Pedido IP
JOIN TBL_Pedido P ON IP.cod_pedido = P.cod_pedido
JOIN TBL_Func F ON P.cod_func = F.cod_func
JOIN TBL_Produto PROD ON IP.cod_produto = PROD.cod_produto
WHERE PROD.nome_produto = 'Fósforo';

--10 - Selecione o código e a data do pedido e o nome dos produtos comprados pelo cliente “Daniel”:
SELECT P.cod_pedido, P.data_pedido, PROD.nome_produto
FROM TBL_Item_Pedido IP
JOIN TBL_Pedido P ON IP.cod_pedido = P.cod_pedido
JOIN TBL_Produto PROD ON IP.cod_produto = PROD.cod_produto
JOIN TBL_Cliente C ON P.cod_cliente = C.cod_cliente
WHERE C.nome_cliente = 'Daniel Santos Oliveira';  

--11 - Selecione todos os produtos vendidos pela funcionária “Roseane”:
SELECT PROD.nome_produto
FROM TBL_Item_Pedido IP
JOIN TBL_Pedido P ON IP.cod_pedido = P.cod_pedido
JOIN TBL_Func F ON P.cod_func = F.cod_func
JOIN TBL_Produto PROD ON IP.cod_produto = PROD.cod_produto
WHERE F.nome_func = 'Roseane Ribeiro';  

--12 - Selecione o nome dos clientes e o nome dos produtos comprados respectivamente:
SELECT C.nome_cliente, PROD.nome_produto
FROM TBL_Item_Pedido IP
JOIN TBL_Pedido P ON IP.cod_pedido = P.cod_pedido
JOIN TBL_Produto PROD ON IP.cod_produto = PROD.cod_produto
JOIN TBL_Cliente C ON P.cod_cliente = C.cod_cliente;

--13 - Selecione o nome dos funcionários e o nome dos produtos vendidos respectivamente:
SELECT F.nome_func, PROD.nome_produto
FROM TBL_Item_Pedido IP
JOIN TBL_Pedido P ON IP.cod_pedido = P.cod_pedido
JOIN TBL_Func F ON P.cod_func = F.cod_func
JOIN TBL_Produto PROD ON IP.cod_produto = PROD.cod_produto;

-- Parte 3:
--14 - Mostre o nome dos funcionários e o valor total dos prêmios que cada funcionário tem:
SELECT f.nome_func,
       (SELECT COALESCE(SUM(p.valor_premio), 0)
        FROM TBL_Premio p
        WHERE p.cod_func = f.cod_func) AS valor_total_premios
FROM TBL_Func f;

--15 - Mostre o nome dos funcionários e quantidade de dependentes de cada funcionário:
SELECT f.nome_func,
       (SELECT COUNT(d.cod_dep)
        FROM TBL_Dependente d
        WHERE d.cod_func = f.cod_func) AS quantidade_dependentes
FROM TBL_Func f;


--16 - Mostre a quantidade de clientes “Casados”, “Solteiros” e “Separados”:
SELECT ec.desc_est_civ, COUNT(c.cod_cliente) AS quantidade
FROM TBL_Cliente c
JOIN TBLEstado_Civil ec ON c.cod_est_civ = ec.cod_est_civ
WHERE ec.desc_est_civ IN ('Casado', 'Solteiro', 'Separado')
GROUP BY ec.desc_est_civ;

--17 - Selecione os dados dos clientes que não tem telefone:
SELECT *
FROM TBL_Cliente c
WHERE c.cod_cliente NOT IN (SELECT t.cod_cliente
                             FROM TBL_Telefone t);


--18 - Selecione os dados dos clientes “Solteiros”:
SELECT c.*
FROM TBL_Cliente c
JOIN TBLEstado_Civil ec ON c.cod_est_civ = ec.cod_est_civ
WHERE ec.desc_est_civ = 'Solteiro';

--19 - Selecione os dados dos clientes “Casados”:
SELECT c.*
FROM TBL_Cliente c
JOIN TBLEstado_Civil ec ON c.cod_est_civ = ec.cod_est_civ
WHERE ec.desc_est_civ = 'Casado';

--20 - Selecione os dados dos funcionários que não têm prêmios:
SELECT *
FROM TBL_Func f
WHERE f.cod_func NOT IN (SELECT p.cod_func
                          FROM TBL_Premio p);

--21 - Selecione os dados dos funcionários que não têm dependentes:
SELECT *
FROM TBL_Func f
WHERE f.cod_func NOT IN (SELECT d.cod_func
                          FROM TBL_Dependente d);


--22 - Selecione os produtos que nunca foram vendidos:
SELECT *
FROM TBL_Produto p
WHERE p.cod_produto NOT IN (SELECT i.cod_produto
                             FROM TBL_Item_Pedido i);


