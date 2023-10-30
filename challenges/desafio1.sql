DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    plano_nome VARCHAR(255) NOT NULL,
    valor_plano DECIMAL (10,2) NOT NULL
);

CREATE TABLE pessoa_usuaria (
    pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(100) NOT NULL, 
    idade INT NOT NULL,
    plano_id INT,
    data_assinatura DATE,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
);

CREATE TABLE artista(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(50)
);

CREATE TABLE album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(100) NOT NULL,
    artista_id INT,
    ano_lancamento INT,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

CREATE TABLE seguindo_artistas( 
    
    artista_id INT,
    pessoa_usuaria_id INT,
    PRIMARY KEY ( artista_id, pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (pessoa_usuaria_id)
    );

CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao_nome VARCHAR(100),
    duracao_segundos INT UNSIGNED,
    album_id INT,
    artista_id INT,
    FOREIGN KEY (album_id) REFERENCES album (album_id), 
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

CREATE TABLE historico_reproducao (
    pessoa_usuaria_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id, cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES pessoa_usuaria (pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
);


INSERT INTO plano (plano_nome, valor_plano) 
VALUES ('gratuito', 0),
       ('familiar', 7.99),
       ('universitario', 5.99),
       ('pessoal', 6.99);

INSERT INTO pessoa_usuaria (nome_pessoa_usuaria, idade, plano_id, data_assinatura)
VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');


INSERT INTO artista (artista_nome)
VALUES ('Beyoncé'),
       ('Queen'),
       ('Elis Regina'),
       ('Baco Exu do Blues'),
       ('Blind Guardian'),
       ('Nina Simone');

INSERT INTO seguindo_artistas (artista_id, pessoa_usuaria_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (1, 2),
       (3, 2),
       (2, 3),
       (4, 4),
       (5, 5),
       (6, 5),
       (6, 6),
       (1, 6),
       (6, 7),
       (3, 9),
       (2, 10);

INSERT INTO album (album_nome, artista_id, ano_lancamento)
VALUES ('Renaissance', 1, 2022),
('Jazz', 2, 1978),
('Hot Space', 2, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, 2007),
('I Put A Spell On You', 6, 2012);


INSERT INTO cancoes (cancao_nome, duracao_segundos, artista_id, album_id)
VALUES 
("BREAK MY SOUL", 279, 1, 1),
("VIRGO'S GROOVE", 369, 1 , 1),
("ALIEN SUPERSTAR", 116, 1, 1),
("Don't Stop Me Now", 203, 2, 2),
("Under Pressure", 152, 2, 3),
("Como Nossos Pais", 105, 3, 4),
("O Medo de Amar é o Medo de Ser Livre", 207, 3, 5),
("Samba em Paris", 267, 4, 6),
("The Bard's Song", 244, 5, 7),
("Feeling Good", 100, 6, 8);



INSERT INTO historico_reproducao (cancao_id, pessoa_usuaria_id, data_reproducao)
VALUES (8, 1, '2022-02-28 10:45:55'),
       (2, 1, '2020-05-02 05:30:35'),
       (10, 1, '2020-03-06 11:22:33'),
       (10, 2, '2022-08-05 08:05:17'),
       (7, 2, '2020-01-02 07:40:33'),
       (10, 3, '2020-11-13 16:55:13'),
       (2, 3, '2020-12-05 18:38:30'),
       (8, 4, '2021-08-15 17:10:10'),
       (8, 5, '2022-01-09 01:44:33'),
       (5, 5, '2020-08-06 15:23:43'),
       (7, 6, '2017-01-24 00:31:17'),
       (1, 6, '2017-10-12 12:35:20'),
       (4, 7, '2011-12-15 22:30:49'),
       (4, 8, '2012-03-17 14:56:41'),
       (9, 9, '2022-02-24 21:14:22'),
       (3, 10, '2015-12-13 08:30:22');