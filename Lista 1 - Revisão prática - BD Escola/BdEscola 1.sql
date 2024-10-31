CREATE DATABASE Escola;
USE Escola;

CREATE TABLE tbalunos (
    codaluno INT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(70) NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    nascimento VARCHAR(10) NOT NULL,
    pai VARCHAR(50) NOT NULL,
    mae VARCHAR(50) NOT NULL,
    responsavel VARCHAR(50) NOT NULL
);

CREATE TABLE tblprofessor (
    codprofessor INT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(80) NOT NULL
);

CREATE TABLE tblcursos (
    codcurso INT PRIMARY KEY NOT NULL,
    nomecurso VARCHAR(30) NOT NULL,
    codprofessor INT NOT NULL,
    FOREIGN KEY (codprofessor) REFERENCES tblprofessor(codprofessor)
);

CREATE TABLE tblnotas (
    codaluno INT,
    codcurso INT NOT NULL,
    nota FLOAT,
    ano INT NOT NULL,
    bimestre INT NOT NULL,
    observacao VARCHAR(80) NOT NULL,
    FOREIGN KEY (codaluno) REFERENCES tbalunos(codaluno),
    FOREIGN KEY (codcurso) REFERENCES tblcursos(codcurso)
);

--INSERINDO ALUNOS
SELECT * FROM tbalunos

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (1, 'João Silva', 'Rua da Escola, 123', '11 934567890', '2005-05-10', 'José Silva', 'Maria Silva', 'José Silva');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (2, 'Laura Reis Augusto', 'Rua São Serapião, 174', '11 999999999', '2012-11-08', 'Luciano Augusto', 'Flávia Reis', 'Flávia Reis');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (3, 'Luiza Reis Augusto', 'Rua São Serapião, 174', '11 999999999', '2014-03-20', 'Luciano Augusto', 'Flávia Reis', 'Flávia Reis');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (4, 'Larissa Rodrigues Batista', 'Rua Sebastião da Silva, 204', '11 922222222', '2008-04-14', 'Odair Batista', 'Juliana Rodrigues', 'Maria Lucia Batista');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (5, 'Giullia Domingues Reis Augusto', 'Rua Bola de Neve, 999', '11 988888888', '2006-01-09', 'Vanderlei Reis Augusto', 'Elizangela Domingues', 'Elizangela Domingues');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (6, 'Ana Clara Lima Piza', 'Rua da Felicidade, 154', '11 987775566', '2007-11-06', 'Augusto Lima', 'Rosangela Piza', 'Rosangela Piza');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (7, 'Nickolas França Silva', 'Rua Néa, 777', '11 989898888', '2007-07-18', 'Mariana França', 'Marcio Silva', 'Mariana França');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (8, 'Fernando Amauri Xiupags', 'Rua Negresco, 699', '11 977777555', '2007-05-07', 'Juliana Amauri', 'Osvaldo Xiupags', 'Juliana Amauri');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (9, 'Antonio Ferbusa Galvão', 'Rua Cosmo, 884', '11 989888888', '2007-12-26', 'Afonso Ferbusa', 'Antonia Galvão', 'Antonia Galvão');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (10, 'George Omalley Rodrigues', 'Rua Anatomy, 177', '11 966221111', '2007-07-07', 'Alberta Rodrigues', 'Boston Omalley', 'Boston Omalley');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (11, 'Meridith Grey Marys', 'Rua Yarley, 559', '11 988668888', '2006-02-27', 'Alice Grey', 'Tacher Marys', 'Richard Webber');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (12, 'Alex Karev Ton', 'Tontio, 784', '11 966666666', '2007-12-16', 'Afonso Karev', 'Antonieta Ton', 'Antonieta Ton');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (13, 'Lexie Grey Marys', 'Rua Yarley, 559', '11 988668888', '2009-12-27', 'Alice Grey', 'Tacher Marys', 'Richard Webber');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (14, 'Bonnie Grey Marys', 'Rua Yarley, 559', '11 988668888', '2012-08-05', 'Alice Grey', 'Tacher Marys', 'Richard Webber');

INSERT INTO tbalunos (codaluno, nome, endereco, telefone, nascimento, pai, mae, responsavel)
VALUES (15, 'Pedro Alverenga Boon', 'Tontio, 784', '11 966666666', '2007-11-26', 'Paulo Alvarenga', 'Tina Boon', 'Tina Boon');


-- Inserindo professores 
SELECT * FROM tblprofessor

INSERT INTO tblprofessor (codprofessor, nome, endereco)
VALUES  
    (1, 'Edna', 'Rua 122, 9'),
    (2, 'Marlon', 'Rua Albrito, 555'),
    (3, 'Carlos', 'Rua Brigadeiro, 88'),
    (4, 'Esmeralda', 'Rua Maria Nobrega, 778'),
    (5, 'Maria Emilia', 'Rua Alegre, 222'),
    (6, 'Sergio', 'Rua Brasforma, 654');

--inserindo cursos
SELECT * FROM tblcursos
INSERT INTO tblcursos (codcurso, nomecurso, codprofessor)
VALUES
    (1, 'Matemática Básica', 1),
    (2, 'Língua Portuguesa', 2),
    (3, 'Ciências Naturais', 3),
    (4, 'História do Brasil', 4);


-- Inserindo notas
SELECT * FROM tblnotas
INSERT INTO tblnotas (codaluno, codcurso, nota, ano, bimestre, observacao)
VALUES
    (1, 1, 8.5, 2024, 1, 'Boa participação'),
    (2, 2, 9.0, 2024, 1, 'Excelente desempenho'),
    (3, 3, 7.8, 2024, 1, 'Bom trabalho'),
    (4, 4, 6.5, 2024, 1, 'Precisa melhorar'),
    (5, 1, 9.2, 2024, 1, 'Muito bom'),
    (6, 2, 8.0, 2024, 1, 'Ótimo desempenho'),
    (7, 3, 7.0, 2024, 1, 'Esforçado'),
    (8, 4, 8.8, 2024, 1, 'Muito bem'),
    (9, 1, 7.5, 2024, 1, 'Bom trabalho'),
    (10, 2, 9.5, 2024, 1, 'Destaque na turma'),
    (11, 3, 8.2, 2024, 1, 'Boa participação'),
    (12, 4, 6.0, 2024, 1, 'Precisa estudar mais'),
    (13, 1, 8.0, 2024, 1, 'Concentrado nas aulas'),
    (14, 2, 9.2, 2024, 1, 'Exemplo de aluno'),
    (15, 3, 7.9, 2024, 1, 'Bom desempenho');
