CREATE SCHEMA pratica06;

USE pratica06;

CREATE TABLE exemplo1(
	c1 INT NOT NULL,
    c2 INT,
    c3 INT,
    c4 INT
);

-- SCRIPT exemplo1.sql importado aqui

SELECT *
FROM exemplo1;

SELECT *
FROM exemplo1
WHERE c3 = 4801
AND c2 = 4899
AND c4 = 4750;

-- Resposta do código acima foi de 0.032 sec

CREATE INDEX idx_c2
ON exemplo1(c2);

CREATE INDEX idx_c3
ON exemplo1(c3);


CREATE INDEX idx_c4
ON exemplo1(c4);

ANALYZE TABLE exemplo1;

SELECT *
FROM exemplo1
WHERE c3 = 4801
AND c2 = 4899
AND c4 = 4750;

-- Resposta do código acima foi de 0.016 sec

SELECT *
FROM exemplo1
WHERE c1 = 5020;

-- Resposta do código acima foi de 0.031 sec

SELECT *
FROM exemplo1
WHERE c2 = 5020;

-- Resposta do código acima foi de 0.000 sec