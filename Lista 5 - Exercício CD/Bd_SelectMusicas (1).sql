CREATE DATABASE BdSelect3;
USE BdSelect3;

CREATE TABLE Cds(
CodigoCD INT PRIMARY KEY,
Nome_CD VARCHAR(255),
DataCompra DATE,
ValorPago DECIMAL(10, 2),
LocalCompra VARCHAR(255),
Album varchar(3)
);
 
CREATE TABLE Musicas (
Numero_musica INT,
Nome_musica VARCHAR(255),
Artista VARCHAR(255),
Tempo VARCHAR(10),
CodigoCD INT,
FOREIGN KEY (CodigoCD) REFERENCES Cds(CodigoCD)
);

-- Inserindo CDs
INSERT INTO Cds (CodigoCD, Nome_cd, DataCompra, ValorPago, LocalCompra, Album)
VALUES 
(1, 'SOUR', '2021-05-21', 35.50, 'Amazon', 'Sim'),
(2, 'GUTS', '2023-09-08', 45.75, 'Amazon', 'Sim'),
(3, 'folklore', '2020-07-24', 49.99, 'Amazon', 'Sim'),
(4, 'PIRATA', '2023-08-14', 20.25, 'Amazon', 'Sim'),
(5, 'Lover', '2019-08-23', 49.50, 'Amazon', 'Sim'),
(6, 'zÉ', '2012-06-23', 5.00, 'Submarino', 'Não');
select * from Cds;

-- Inserindo Músicas
INSERT INTO Musicas (Numero_musica, Nome_musica, Artista, Tempo, CodigoCD)
VALUES
(1,'ballad of a homeschooled girl', 'Olivia Rodrigo', '0:03:23', 1),
(2,'so american', 'Olivia Rodrigo', '0:02:49', 1),
(3,'vampire', 'Olivia Rodrigo', '0:03:39', 1),
(4,'traitor', 'Olivia Rodrigo', '0:03:49', 2),
(5,'deja vu', 'Olivia Rodrigo', '0:03:55', 2),
(6,'jealousy, jealousy', 'Olivia Rodrigo', '0:02:53', 2),
(7,'the 1', 'Taylor Swift', '0:03:30', 3),
(8,'the lakes - bonus track', 'Taylor Swift', '0:03:31', 3),
(9,'my tears ricochet', 'Taylor Swift', '0:04:15', 3),
(10,'Olhos Vermelhos', 'JÃO', '0:05:04', 4),
(11,'Você me perdeu', 'JÃO', '0:02:33', 4),
(12,'Acontece', 'JÃO', '0:02:41', 4),
(13,'The Archer', 'Taylor Swift', '0:03:31', 5),
(14,'Daylight', 'Taylor Swift', '0:04:53', 5),
(15,'ME!', 'Taylor Swift', '0:03:13', 5),
(16,'Evidencias By Zé Pedro', 'José Pedro', '0:01:13', 6);

select * from Musicas;

--SELECTS 
--1. Mostrar todos os cds
SELECT * FROM Cds;
--2. Mostrar os campos nome e data da compra dos cds ordenados por nome
SELECT Nome_cd, DataCompra FROM Cds ORDER BY Nome_cd;
--3. Mostrar os campos nome e data da compra dos cds classificados por data de compra em ordem decrescenteSELECT Nome_cd, DataCompra FROM Cds ORDER BY DataCompra DESC;
--4. Mostrar os campos nome, data da compra e preço dos cds classificados por preço em ordem decrescente
SELECT Nome_cd, DataCompra, ValorPago FROM Cds ORDER BY ValorPago DESC;
--5. Mostrar o total gasto com a compra dos Cds
SELECT SUM(ValorPago) FROM Cds;
--6. Mostrar todas as músicas (todos os campos) do cds código 1SELECT * FROM Musicas WHERE CodigoCD = 1;
--7. Mostre o nome da música e o artista de todas músicas cadastradas
SELECT Nome_musica, Artista FROM Musicas;
--8. Mostre o número, nome e tempo das músicas do cd 5 em ordem de número
SELECT Numero_musica, Nome_musica, Tempo FROM Musicas WHERE CodigoCD = 5 ORDER BY Numero_musica;
--9. Mostre a quantidade de músicas cadastradas (total)
SELECT COUNT(Numero_musica) FROM Musicas;
--10. Mostre o nome das músicas do artista José Pedro
SELECT Nome_musica FROM Musicas WHERE Artista = 'José Pedro';
--11. Mostre o nome de todos cds comprados no Submarino
SELECT Nome_cd FROM Cds WHERE LocalCompra = 'Submarino';
--12. Mostre uma listagem de músicas em ordem alfabética
SELECT * FROM Musicas ORDER BY Nome_musica;
--13. Mostrar todos os cds que são álbunsSELECT * FROM Cds WHERE Album = 'Sim';
--14. Mostrar a média de preços dos cds.
SELECT AVG(ValorPago) FROM Cds;
 