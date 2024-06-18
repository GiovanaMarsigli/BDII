CREATE DATABASE BdSelect5;
USE BdSelect5;

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
(6, 'z�', '2012-06-23', 5.00, 'Submarino', 'N�o');
select * from Cds;

-- Inserindo M�sicas
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
(10,'Olhos Vermelhos', 'J�O', '0:05:04', 4),
(11,'Voc� me perdeu', 'J�O', '0:02:33', 4),
(12,'Acontece', 'J�O', '0:02:41', 4),
(13,'The Archer', 'Taylor Swift', '0:03:31', 5),
(14,'Daylight', 'Taylor Swift', '0:04:53', 5),
(15,'ME!', 'Taylor Swift', '0:03:13', 5),
(16,'Evidencias By Z� Pedro', 'Jos� Pedro', '0:01:13', 6);
select * from Musicas;

--A. Utilizar os comandos Selects respectivos para efetuar as consultas abaixo:
--1. (Group by) Mostre o tempo total de m�sicas por cd
SELECT c.Nome_CD, CONVERT(TIME, DATEADD(SECOND, SUM(DATEDIFF(SECOND, '00:00:00', Musicas.Tempo)), '00:00:00')) AS Tempo_Total, COUNT(*) AS Numero_de_Musicas FROM Cds c 
JOIN Musicas ON c.CodigoCD = Musicas.CodigoCD GROUP BY c.Nome_CD;

--2. (Group by) Mostre a quantidade de Cds
select count(*) from Cds;

--3. (Group by) Mostre a quantidade de m�sicas por cds
select Cds.CodigoCD, Cds.Nome_cd, count(Musicas.CodigoCD) from Cds inner join Musicas on Cds.CodigoCD = Musicas.CodigoCD group by Cds.CodigoCD, Cds.Nome_cd;


--B � Utilizar os comandos Selects respectivos para efetuar as consultas abaixo:
--1. (Subquery) Mostre o cd que custou mais caro
select * from Cds where ValorPago = (select max(ValorPago) from Cds);
 