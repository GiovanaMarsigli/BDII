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

--INNERJOIN
-- A) Mostrar o nome do Cd e o nome das músicas de todos Cds
SELECT Cds.Nome_CD, Musicas.Nome_musica
FROM Cds
INNER JOIN Musicas ON Cds.CodigoCD = Musicas.CodigoCD;

-- B) Mostrar o nome do cd e o nome da primeira música de cada cd
SELECT Cds.Nome_CD, Musicas.Nome_musica
FROM Cds
INNER JOIN Musicas ON Cds.CodigoCD = Musicas.CodigoCD
WHERE Musicas.Numero_musica = (
    SELECT MIN(Numero_musica)
    FROM Musicas AS M
    WHERE M.CodigoCD = Cds.CodigoCD
);

 