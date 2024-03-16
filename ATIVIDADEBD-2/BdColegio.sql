CREATE DATABASE Colegio;
USE Colegio;

CREATE TABLE disciplinas (
    coddisciplina CHAR(2) PRIMARY KEY NOT NULL,
    nomedisciplina VARCHAR(30) NOT NULL
);
CREATE TABLE cursos (
    codcurso CHAR(2) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    coddisc1 CHAR(2) NOT NULL,
    coddisc2 CHAR(2) NOT NULL,
    coddisc3 CHAR(2) NOT NULL,
    FOREIGN KEY (coddisc1) REFERENCES disciplinas(coddisciplina),
    FOREIGN KEY (coddisc2) REFERENCES disciplinas(coddisciplina),
    FOREIGN KEY (coddisc3) REFERENCES disciplinas(coddisciplina)
);
CREATE TABLE alunos (
    matricula VARCHAR(5) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    codcurso CHAR(2) NOT NULL,
    FOREIGN KEY (codcurso) REFERENCES cursos(codcurso)
);

SELECT * FROM disciplinas

INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('11', 'Banco de Dados');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('12', 'Lógica de Programação');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('13', 'Desenvolvimento de Software 1');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('21', 'Banco de Dados 2');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('22', 'Desenvolvimento de Software 1');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('23', 'Programação de Computadores 1');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('31', 'Banco de Dados 3');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('32', 'Programação de Computadores 2');
INSERT INTO disciplinas (coddisciplina, nomedisciplina) 
VALUES ('33', 'Desenvolvimento de Software 3');

SELECT * FROM cursos
INSERT INTO cursos (codcurso, nome, coddisc1, coddisc2, coddisc3) 
VALUES ('01', 'Auxiliar de Informática', '11', '12', '13');
INSERT INTO cursos (codcurso, nome, coddisc1, coddisc2, coddisc3) 
VALUES ('02', 'Programador de Computadores', '21', '22', '23');
INSERT INTO cursos (codcurso, nome, coddisc1, coddisc2, coddisc3) 
VALUES ('03', 'Técnico em Informática', '31', '32', '33');

SELECT * FROM alunos
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10001', 'Marcos Moraes', 'Rua Pe Roque, 2057', 'Mogi Mirim', '01');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10002', 'Maria Conceição Lopes', 'Rua Araras, 23', 'Mogi Guaçu', '01');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10003', 'Ana Carina Lopes', 'Rua Peraltas, 222', 'Santos', '01');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10004', 'Carlos Aguiar', 'Rua Botafogo, 33', 'Santos', '01');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10005', 'André Luiz dos Santos', 'Rua Lopes Conte, 3343', 'Sapucaí', '01');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10006', 'Pedro Antonio Pimenta', 'Rua Altair Lopes, 33', 'Itapira', '02');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10007', 'Rita de Cássia da Silva', 'Rua Eletromais, 33', 'Itapira', '02');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10008', 'Caique dos Santos', 'Rua das Amoreiras, 55', 'Campinas', '02');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10009', 'Carlos Tavares', 'Rua Peixe, 99', 'Santos', '03');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10010', 'Antonio Carlos Caetano', 'Rua Josefina Alface, 987', 'Campinas', '02');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10011', 'Ricardo Moreira', 'Rua do Pinhal, 332', 'Aparecida', '03');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10012', 'Richardson S. P. Campeao', 'Rua do Tricolor, 433', 'São Paulo', '03');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10013', 'Junior Camisa Seis', 'Rua do Morumbi, 433', 'São Paulo', '03');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10014', 'Carina Melo', 'Rua Osvaldo Ramos, 88', 'Mogi Guaçu', '03');
INSERT INTO alunos (matricula, nome, endereco, cidade, codcurso) 
VALUES ('10015', 'Pedro Mello', 'Rua Itororó, 3399', 'Mogi Mirim', '03');
