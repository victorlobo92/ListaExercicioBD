CREATE SCHEMA pratica05;

USE pratica05;

CREATE TABLE dados_multimidia (
	codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30),
    tipo VARCHAR(20),
    dados LONGBLOB,
    PRIMARY KEY (codigo)
);

INSERT INTO dados_multimidia (
	nome,
    tipo,
    dados
)
VALUES(
    'Challenge Accepted',
    'jpg',
    LOAD_FILE("C:\\imagens Lista 4\\Challenge Accepted.jpg")
),
(
    'Derp',
    'jpg',
    LOAD_FILE("C:\\imagens Lista 4\\Derp.jpg")
),
(
    'Forever Alone',
    'jpg',
    LOAD_FILE("C:\\imagens Lista 4\\Forever Alone.jpg")
),
(
    'WTF',
    'jpg',
    LOAD_FILE("C:\\imagens Lista 4\\WTF.jpg")
),
(
    'LOL',
    'jpg',
    LOAD_FILE("C:\\imagens Lista 4\\LOL.jpg")
);

SELECT * FROM dados_multimidia;

SELECT dados
INTO DUMPFILE "C:\\imagens Lista 4\\tmp\\imagem_export.jpg"
FROM dados_multimidia
WHERE codigo = 3;