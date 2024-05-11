-- criar bd Exemplo_Select
CREATE DATABASE Exemplo_Select4;

-- abrir bd Exemplo_Select
use Exemplo_Select4;

-- criação tabela Categoria
CREATE TABLE Categoria
(
Cod_Categoria int,
Nome_Categoria varchar (15) NOT NULL,
Descricao varchar(25) NULL,
PRIMARY KEY (Cod_Categoria)
 );

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (1,'Beverages','Soft drinks');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (2,'Condiments','Sweet and savory sauces');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (3,'Confections','candies');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (4,'Dairy Products','Cheeses');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (5,'Grains/Cereals','cereal');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (6,'Meat/Poultry','Prepared meats');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (7,'Produce','Dried fruit and bean curd');

INSERT into categoria (Cod_categoria,Nome_categoria,descricao) 
VALUES (8,'Seafood','Seaweed and fish');

select * from categoria;

CREATE TABLE Envio
 (
	Cod_Envio int,
 	DataEnvio datetime,
  	Frete int,
	NomeNavio varchar(40),
 	Cidade varchar(15),
	Regiao varchar(15),
 	Pais varchar(15)
 );


INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10248,'7/4/1996',32.38,'Vins et alcools Chevalier','Abbaye','Reims','France');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10249,'7/5/1996',11.61,'Toms Spezialitaten','Luisenstr',nULL,'Germany');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10250,'7/8/1996',65.83,'Hanari Carnes','Rio de Janeiro','Sudeste','Brazil');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10251,'7/8/1996',41.34,'Victuailles en stock','Lyon',NULL,'France');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10252,'7/9/1996',51.30,'Supremes delices','Boulevard Tirou', 'Charleroi','Belgium');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10253,'7/10/1996',58.17,'Hanari Carnes','Rio de Janeiro','Sudeste','Brazil');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
vALUES (10254,'7/11/1996',22.98,'Chop-suey Chinese','Bern',NULL,'Switzerland');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10255,'7/12/1996',148.33,'Richter Supermarkt','Geneve',	NULL,'Switzerland');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10256,'15/7/1996',13.97,'Wellington Importadora','Resende','Sul','Brazil');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10257,'8/8/1996',81.91,'HILARION-Abastos','San Cristobal','Tachira','Venezuela');

INSERT INTO Envio (Cod_Envio,DataEnvio,Frete,NomeNavio,Cidade,Regiao,Pais)
VALUES (10258,'17/7/1996',140.51,'Ernst Handel','Kirchgasse','Graz','Austria');


select * from Envio;


CREATE TABLE Territorio
(
       Cod_Territorio varchar(20) NOT NULL,
       Territoriodescricao varchar(50) NOT NULL,
       Cod_Regiao int
);


Insert Into Territorio Values ('01581','Westboro',1);
Insert Into Territorio Values ('01730','Bedford',1);
Insert Into Territorio Values ('01833','Georgetow',1);
Insert Into Territorio Values ('02116','Boston',1);
Insert Into Territorio Values ('02139','Cambridge',1);
Insert Into Territorio Values ('02184','Braintree',1);
Insert Into Territorio Values ('02903','Providence',1);
Insert Into Territorio Values ('03049','Hollis',3);
Insert Into Territorio Values ('03801','Portsmouth',3);
Insert Into Territorio Values ('06897','Wilton',1);
Insert Into Territorio Values ('07960','Morristown',1);
Insert Into Territorio Values ('08837','Edison',1);
Insert Into Territorio Values ('10019','New York',1);
Insert Into Territorio Values ('10038','New York',1);
Insert Into Territorio Values ('11747','Mellvile',1);
Insert Into Territorio Values ('14450','Fairport',1);
Insert Into Territorio Values ('19428','Philadelphia',3);
Insert Into Territorio Values ('19713','Neward',1);
Insert Into Territorio Values ('20852','Rockville',1);
Insert Into Territorio Values ('27403','Greensboro',1);
Insert Into Territorio Values ('27511','Cary',1);
Insert Into Territorio Values ('29202','Columbia',4);
Insert Into Territorio Values ('30346','Atlanta',4);
Insert Into Territorio Values ('31406','Savannah',4);
Insert Into Territorio Values ('32859','Orlando',4);
Insert Into Territorio Values ('33607','Tampa',4);
Insert Into Territorio Values ('40222','Louisville',1);
Insert Into Territorio Values ('44122','Beachwood',3);
Insert Into Territorio Values ('45839','Findlay',3);
Insert Into Territorio Values ('48075','Southfield',3);
Insert Into Territorio Values ('48084','Troy',3);
Insert Into Territorio Values ('48304','Bloomfield Hills',3);
Insert Into Territorio Values ('53404','Racine',3);
Insert Into Territorio Values ('55113','Roseville',3);
Insert Into Territorio Values ('55439','Minneapolis',3);
Insert Into Territorio Values ('60179','Hoffman Estates',2);
Insert Into Territorio Values ('60601','Chicago',2);
Insert Into Territorio Values ('72716','Bentonville',4);
Insert Into Territorio Values ('75234','Dallas',4);
Insert Into Territorio Values ('78759','Austin',4);
Insert Into Territorio Values ('80202','Denver',2);
Insert Into Territorio Values ('80909','Colorado Springs',2);
Insert Into Territorio Values ('85014','Phoenix',2);
Insert Into Territorio Values ('85251','Scottsdale',2);
Insert Into Territorio Values ('90405','Santa Monica',2);
Insert Into Territorio Values ('94025','Menlo Park',2);
Insert Into Territorio Values ('94105','San Francisco',2);
Insert Into Territorio Values ('95008','Campbell',2);
Insert Into Territorio Values ('95054','Santa Clara',2);
Insert Into Territorio Values ('95060','Santa Cruz',2);
Insert Into Territorio Values ('98004','Bellevue',2);
Insert Into Territorio Values ('98052','Redmond',2);
Insert Into Territorio Values ('98104','Seattle',2);

select * from Territorio;

--SELECTS
--1) Listar todos os campos da tabela TERRITORIO por ordem descendente do campo COD_REGIAO
SELECT * FROM Territorio ORDER BY Cod_Regiao DESC;--2) Listar todos os campos da tabela ENVIO por ordem ascendente do campo FRETESELECT * FROM Envio ORDER BY Frete ASC;--3) Listar os campos NOMENAVIO e CIDADE e REGIAOSELECT NomeNavio, Cidade, Regiao FROM Envio;--4) Listar os campos NOME_CATEGORIA e DESCRICAOSELECT Nome_Categoria, Descricao FROM Categoria;--5) Apresente a soma de todos os CÓD_CATEGORIASELECT SUM(Cod_Categoria) FROM Categoria;--6) Apresente a soma de todos os COD_ENVIOSELECT SUM(Cod_Envio) FROM Envio;--7) Apresente a soma de todos os FRETESSELECT SUM(Frete) FROM Envio;--8) Apresente a soma de todos os COD_REGIAOSELECT SUM(Cod_Regiao) FROM Territorio;--9) Apresente o maior FRETESELECT MAX(Frete) FROM Envio;--10) Apresente o menor FRETESELECT MIN(Frete) FROM Envio;--11) Apresente o maior CÓD_CATEGORIASELECT MAX(Cod_Categoria) FROM Categoria;--12) Apresente o menor CÓD_CATEGORIASELECT MIN(Cod_Categoria) FROM Categoria;--13) Apresente o maior COD_ENVIOSELECT MAX(Cod_Envio) FROM Envio;--14) Apresente o menor COD_ENVIOSELECT MIN(Cod_Envio) FROM Envio;--15) Apresente o maior COD_REGIAOSELECT MAX(Cod_Regiao) FROM Territorio;--16) Apresente o menor COD_REGIAOSELECT MIN(Cod_Regiao) FROM Territorio;--17) Apresente a média de todos os FRETESSELECT AVG(Frete) FROM Envio;--18) Apresente a média do CÓD_CATEGORIASELECT AVG(Cod_Categoria) FROM Categoria;--19) Apresente a média do COD_ENVIOSELECT AVG(Cod_Envio) FROM Envio;--20) Apresente a média do COD_REGIAOSELECT AVG(Cod_Regiao) FROM Territorio;--21) Apresente todos os territórios da região 2SELECT * FROM Territorio WHERE Cod_Regiao = 2;--22) Apresente todos os territórios das regiões 2 e 3SELECT * FROM Territorio WHERE Cod_Regiao IN (2, 3);--23) Apresente todos os territórios cuja descrição comece com a letra “S”SELECT * FROM Territorio WHERE Territoriodescricao LIKE 'S%';--24) Apresente todos os territórios cujo código comece com o número “7”SELECT * FROM Territorio WHERE Cod_Territorio LIKE '7%';--25) Apresente todos os envios para o “Brazil”SELECT * FROM Envio WHERE Pais = 'Brazil';--26) Apresente todos os envios dos fretes maiores que “50”SELECT * FROM Envio WHERE Frete > 50;--27) Apresente todas os envios das regiões “NULAS”SELECT * FROM Envio WHERE Regiao IS NULL;--28) Apresente todos os envios do mês de “agosto”SELECT * FROM Envio WHERE MONTH(DataEnvio) = 8;--29) Apresente todos os envios cujo código estiver entre “10250” a “10256”SELECT * FROM Envio WHERE Cod_Envio BETWEEN 10250 AND 10256;--30) Apresente todos os envios cuja cidade comece com a letra “R”SELECT * FROM Envio WHERE Cidade LIKE 'R%';--31) Apresente todas as categorias, exceto o “cereal”SELECT * FROM Categoria WHERE Descricao <> 'cereal';--32) Apresente todas as categorias com código menor que “5”SELECT * FROM Categoria WHERE Cod_Categoria < 5;--33) Apresente a quantidade de envios para a “Germany”SELECT COUNT(*) FROM Envio WHERE Pais = 'Germany';--34) Apresente a quantidade de envios para o “Rio de Janeiro”SELECT COUNT(*) FROM Envio WHERE Cidade = 'Rio de Janeiro';--35) Apresente a ocorrência dos fretesSELECT FRETE, COUNT(*) AS Ocorrencias FROM Envio GROUP BY Frete;--36) Apresente a quantidade de envios para a região “Sudeste”SELECT COUNT(*) FROM Envio WHERE Regiao = 'Sudeste';--37) Apresente as ocorrências dos COD_ENVIOSELECT COD_ENVIO, COUNT(*) AS Ocorrencias FROM Envio GROUP BY Cod_Envio;--38) Apresente todos os envios, exceto para a região “Null”SELECT * FROM ENVIO WHERE Regiao <> 'Null';--39) Apresente a quantidade de territórios da região “2”SELECT COUNT(*) FROM Territorio WHERE Cod_Regiao = 2;--40) Apresente a quantidade de territórios da região “4”SELECT COUNT(*) FROM Territorio WHERE Cod_Regiao = 4;--41) Apresente todos os territórios da região = “2” cuja descrição comece com a letra “S”SELECT * FROM Territorio WHERE Cod_Regiao = 2 AND Territoriodescricao LIKE 'S%';--42) Apresente todos os envios das cidades: “Bern,Lyon,Resende” ====== B E R NSELECT * FROM Envio WHERE Cidade IN ('Bern', 'Lyon', 'Resende');--43) Apresente todos os envios exceto das cidades: “Bern,Lyon,Resende” ====== B E R NSELECT * FROM Envio WHERE Cidade NOT IN ('Bern', 'Lyon', 'Resende');--44) Eliminar regiões duplicados da tabela “território” (distinct)SELECT DISTINCT * FROM Territorio;--45) Selecionar todos os envios do mês de julhoSELECT * FROM Envio WHERE MONTH(DataEnvio) = 7;--46) Selecionar todos os envios do dia 08/08/1996SELECT * FROM Envio WHERE DataEnvio = '1996-08-08';--47)Selecionar todos os envios do último bimestre do ano de 1996SELECT * FROM Envio WHERE DataEnvio BETWEEN '1996-11-01' AND '1996-12-31';
