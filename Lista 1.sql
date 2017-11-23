#  -- Resolução da lista de exercícios Aula1Resolvido.pdf
# ---------------------------------------------
# -- 1. No MySQL Command Line Client, crie um esquema de banco de dados chamado BANCO.
# ---------------------------------------------
CREATE SCHEMA banco;

# ---------------------------------------------
# -- Define BD atual
# ---------------------------------------------
USE banco;


# ---------------------------------------------
# -- 2. No banco de dados BANCO crie as relações da base abaixo, especificando as
# -- restrições de atributo e as ações disparadas por integridade referencial.
# ---------------------------------------------
# -- tabela banco 
# ---------------------------------------------
CREATE TABLE banco (
	codigo INT NOT NULL,
    nome VARCHAR(60),
	PRIMARY KEY (codigo)
);

# ---------------------------------------------
# -- tabela agencia 
# ---------------------------------------------
CREATE TABLE agencia (
	cod_banco INT NOT NULL,
    numero_agencia VARCHAR(10),
    endereco VARCHAR(100),
	PRIMARY KEY(numero_agencia),
    FOREIGN KEY(cod_banco) REFERENCES banco(codigo)
);

# ---------------------------------------------
# -- tabela cliente 
# ---------------------------------------------
CREATE TABLE cliente (
	cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(60),
    sexo VARCHAR(1),
    endereco VARCHAR(100),
	PRIMARY KEY(cpf)
);

CREATE INDEX idx_nome_cliente
ON cliente(nome);

# ---------------------------------------------
# -- tabela conta 
# ---------------------------------------------
CREATE TABLE conta (
	numero_conta VARCHAR(10) NOT NULL,
    saldo DOUBLE,
    tipo_conta INT,
    num_agencia VARCHAR(10),
	PRIMARY KEY(numero_conta),
    FOREIGN KEY(num_agencia) REFERENCES agencia(numero_agencia) ON UPDATE CASCADE
);

# ---------------------------------------------
# -- tabela historico 
# ---------------------------------------------
CREATE TABLE historico (
	cpf_cliente VARCHAR(14) NOT NULL,
    num_conta VARCHAR(10),
    data_inicio DATE,
	PRIMARY KEY(cpf_cliente, num_conta),
    FOREIGN KEY(cpf_cliente) REFERENCES cliente(cpf),
    FOREIGN KEY(num_conta) REFERENCES conta(numero_conta) ON DELETE CASCADE
);

# ---------------------------------------------
# -- tabela telefone_cliente 
# ---------------------------------------------
CREATE TABLE telefone_cliente (
	cpf_cli VARCHAR(14) NOT NULL,
    telefone VARCHAR(32),
	PRIMARY KEY(telefone),
    FOREIGN KEY(cpf_cli) REFERENCES cliente(cpf)
);


# ---------------------------------------------
# -- 3. Acrescente as tuplas das relações mostrada na figura abaixo de um possível estado de banco de dados.
# ---------------------------------------------
# -- tabela banco
# ---------------------------------------------
INSERT INTO banco
VALUES
	(1, "Banco do Brasil"),
    (4, "CEF");

# ---------------------------------------------
# -- tabela agencia
# ---------------------------------------------
INSERT INTO agencia
VALUES
	(4, "0562", "Rua Joaquim Teixeira Alves, 1555"),
	(1, "3153", "Av. Marcelino Pires, 1960");

# ---------------------------------------------
# -- tabela cliente
# ---------------------------------------------
INSERT INTO cliente
VALUES
	("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"),
	("666.777.888-99", "Caetano K Lima", "M", "Rua Ivinhema, 879"),
	("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos, 735");

# ---------------------------------------------
# -- tabela conta
# ---------------------------------------------
INSERT INTO conta
VALUES
	("86340-2", 763.05, 2, "3153"),
	("23584-7", 3879.12, 1, "0562");

# ---------------------------------------------
# -- tabela historico
# ---------------------------------------------
INSERT INTO historico
VALUES
	("111.222.333-44", "23584-7", "1997-12-17"),
	("666.777.888-99", "23584-7", "1997-12-17"),
	("555.444.777-33", "86340-2", "2010-11-29");

# ---------------------------------------------
# -- tabela telefone_cliente
# ---------------------------------------------
INSERT INTO telefone_cliente
VALUES
	("111.222.333-44", "(67)3422-7788"),
	("666.777.888-99", "(67)3423-9900"),
	("666.777.888-99", "(67)8121-8833");


# ---------------------------------------------
# -- 4. Altere a tabela cliente e crie um novo atributo chamado email para armazenar os emails dos clientes.
# ---------------------------------------------
ALTER TABLE cliente
ADD COLUMN email VARCHAR(50);


# ---------------------------------------------
# -- 5. Recupere o cpf e o endereço do(s) cliente(s) cujo nome seja ‘Paulo A Lima’.
# ---------------------------------------------
SELECT cpf, endereco
FROM cliente
WHERE nome = "Paulo A Lima";


# ---------------------------------------------
# -- 6. Recupere o número da agência e endereço de todas as agências do Banco do Brasil.
# ---------------------------------------------
SELECT A.numero_agencia, A.endereco
FROM agencia A
JOIN banco B
ON A.cod_banco = B.codigo
WHERE B.nome = "Banco do Brasil";

# ---------------------------------------------
# -- 7. Para cada cliente, liste o número da sua conta, o número da agência que a controla e o nome do cliente.
# ---------------------------------------------
SELECT CO.numero_conta AS conta, CO.num_agencia AS agencia, CL.nome AS cliente
FROM cliente CL
JOIN historico H
ON CL.cpf = H.cpf_cliente
JOIN conta CO
ON H.num_conta = CO.numero_conta;

# ---------------------------------------------
# -- 8. Recupere todos os valores de atributo de qualquer cliente que é do sexo masculino.
# ---------------------------------------------
SELECT *
FROM cliente
WHERE sexo = "M";

# ---------------------------------------------
# -- 9. Recupere todos os atributos de uma agência e os atributos do banco em que ela pertence para toda agência de número 0562.
# ---------------------------------------------
SELECT B.*, A.numero_agencia, A.endereco
FROM banco B
JOIN agencia A
ON B.codigo = A.cod_banco
WHERE A.numero_agencia = 0562;

# ---------------------------------------------
# -- 10. Exclua a conta 86340-2.
# ---------------------------------------------
DELETE FROM conta
WHERE numero_conta = "86340-2";

# ---------------------------------------------
# -- 11. Altere o número da agência 0562 para 6342.
# ---------------------------------------------
UPDATE agencia
SET numero_agencia = "6342"
WHERE numero_agencia = "0562";

# ---------------------------------------------
# -- 12. Altere o registro do cliente Caetano K Lima acrescentando o email caetanolima@gmail.com.
# ---------------------------------------------
UPDATE cliente
SET email = "caetanolima@gmail.com"
WHERE nome = "Caetano K Lima";

# ---------------------------------------------
# -- 13. Conceda à conta 23584-7 um aumento de 10 por cento no saldo.
# ---------------------------------------------
UPDATE conta
SET saldo = (saldo * 1.1)
WHERE numero_conta = "23584-7";