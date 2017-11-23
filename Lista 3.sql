# -- Resolução da lista de exercícios Pratica04storedprocedures.pdf
# ---------------------------------------------
# -- 1. Abrir o SGBD de sua preferência e criar um banco de dados chamado vendas.
# ---------------------------------------------
CREATE SCHEMA vendas;

# ---------------------------------------------
# -- 2. Executar o script chamado script_pratica04.sql para criar a estrutura e
# -- povoar o banco de dados.
# ---------------------------------------------
USE vendas;

CREATE TABLE cliente (
    codigocliente integer,
    nomecliente varchar(20),
    endereco varchar(30),
    cidade varchar(15),
    cep character(8),
    uf char(2),
    cgc character(20),
    ie character(20),
	primary key (codigocliente)
);

CREATE TABLE vendedor (
    codigovendedor integer,
    nomevendedor varchar(20),
    salariofixo real,
    faixacomissao character(1),
	primary key(codigovendedor)
);

CREATE TABLE pedido (
    numpedido integer,
    prazoentrega integer NOT NULL,
    codigocliente integer NOT NULL,
    codigovendedor integer NOT NULL,
	primary key (numpedido),
	foreign key (codigocliente) references cliente(codigocliente),
	foreign key (codigovendedor) references vendedor(codigovendedor)
);

CREATE TABLE produto (
    codigoproduto integer,
    unidade character(3),
    descricaoproduto varchar(30),
    precounitario real,
    primary key (codigoproduto)
);

CREATE TABLE itemdopedido (
    numpedido integer not null,
    codigoproduto integer NOT NULL,
    quantidade integer,
    precounitario real,
    desconto real,
	primary key(numpedido, codigoproduto),
	foreign key (numpedido) references pedido(numpedido),
	foreign key (codigoproduto) references produto(codigoproduto)
);


INSERT INTO cliente VALUES (720, 'Ana', 'Rua 17 n. 19', 'Rio Paranaíba', '38810000', 'MG', '12113231/0001-34', '2134');
INSERT INTO cliente VALUES (157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', NULL, 'PR', '32848223/324-2', '1923');
INSERT INTO cliente VALUES (870, 'Flávio', 'Av. Pres. Vargas 10', 'São Paulo', '22763931', 'SP', '22534126/9387-9', '4631');
INSERT INTO cliente VALUES (180, 'Lívio', 'Av. Beira Mar n. 1256', 'Florianópolis', '30077500', 'SC', '12736571/2347-4', NULL);
INSERT INTO cliente VALUES (110, 'Jorge', 'Rua Caiapo 13', 'Curitiba', '30078500', 'PR', '14512764/9834-9', NULL);
INSERT INTO cliente VALUES (222, 'Lúcia', 'Rua Itabira 123 loja 9', 'Belo Horizonte', '22124391', 'MG', '28315213/9348-8', '2985');
INSERT INTO cliente VALUES (260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ', '21763571/232-9', '2530');
INSERT INTO cliente VALUES (830, 'Maurício', 'Av. Paulista 1236 sl/2345', 'São Paulo', '3012683', 'SP', '32816985/7465-6', '9343');
INSERT INTO cliente VALUES (290, 'Renato', 'Rua Meireles n.123 bl2 sl. 345', 'São Paulo', '30225900', 'SP', '13276571-1231-4', '1820');
INSERT INTO cliente VALUES (130, 'Edmar', 'Rua da Praia sn', 'Salvador', '30079300', 'BA', '23463284/234-9', '7121');
INSERT INTO cliente VALUES (390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', 'MG', '32176547/213-3', '2931');
INSERT INTO cliente VALUES (410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro ', '30078900', 'RJ', '12835128/2346-9', '7431');
INSERT INTO cliente VALUES (20, 'Beth', 'Av. Climério n. 45', 'São Paulo', '25679300', 'SP', '32485126/7326-8', '9280');
INSERT INTO cliente VALUES (234, 'José', 'Quadra 3 bl. 3 sl. 1003', 'Brasília', '22841650', 'DF', '21763576/1232-3', '2931');

INSERT INTO produto VALUES (25, 'Kg ', 'Queijo', 0.97);
INSERT INTO produto VALUES (31, 'BAR', 'Chocolate', 0.87);
INSERT INTO produto VALUES (78, 'L  ', 'Vinho', 2.0);
INSERT INTO produto VALUES (22, 'M  ', 'Linho', 0.11);
INSERT INTO produto VALUES (30, 'SAC', 'Açucar', 0.30);
INSERT INTO produto VALUES (53, 'M  ', 'Linha', 1.80);
INSERT INTO produto VALUES (13, 'G  ', 'Ouro', 6.18);
INSERT INTO produto VALUES (45, 'M  ', 'Madeira', 0.25);
INSERT INTO produto VALUES (87, 'M  ', 'Cano', 1.97);
INSERT INTO produto VALUES (77, 'M  ', 'Papel', 1.05);

INSERT INTO vendedor VALUES (209, 'José', 1800.00, 'C');
INSERT INTO vendedor VALUES (111, 'Carlos', 2490.00, 'A');
INSERT INTO vendedor VALUES (11, 'João', 2780.00, 'C');
INSERT INTO vendedor VALUES (240, 'Antônio', 9500.00, 'C');
INSERT INTO vendedor VALUES (720, 'Felipe', 4600.00, 'A');
INSERT INTO vendedor VALUES (213, 'Jonas', 2300.00, 'A');
INSERT INTO vendedor VALUES (101, 'João', 2650.00, 'C');
INSERT INTO vendedor VALUES (310, 'Josias', 870.00, 'B');
INSERT INTO vendedor VALUES (250, 'Maurício', 2930.00, 'B');

INSERT INTO pedido VALUES (121, 20, 410, 209);
INSERT INTO pedido VALUES (97, 20, 720, 101);
INSERT INTO pedido VALUES (101, 15, 720, 101);
INSERT INTO pedido VALUES (137, 20, 720, 720);
INSERT INTO pedido VALUES (148, 20, 720, 101);
INSERT INTO pedido VALUES (189, 15, 870, 213);
INSERT INTO pedido VALUES (104, 30, 110, 101);
INSERT INTO pedido VALUES (203, 30, 830, 250);
INSERT INTO pedido VALUES (98, 20, 410, 209);
INSERT INTO pedido VALUES (143, 30, 20, 111);
INSERT INTO pedido VALUES (105, 15, 180, 240);
INSERT INTO pedido VALUES (111, 20, 260, 240);
INSERT INTO pedido VALUES (103, 20, 260, 11);
INSERT INTO pedido VALUES (91, 20, 260, 11);
INSERT INTO pedido VALUES (138, 20, 260, 11);
INSERT INTO pedido VALUES (108, 15, 290, 310);
INSERT INTO pedido VALUES (119, 20, 390, 250);
INSERT INTO pedido VALUES (127, 10, 410, 11);


INSERT INTO itemdopedido VALUES (138, 22, 10, 0.10, NULL);
INSERT INTO itemdopedido VALUES (119, 22, 10, 0.11, NULL);
INSERT INTO itemdopedido VALUES (121, 25, 10, 0.97, 0);
INSERT INTO itemdopedido VALUES (111, 25, 10, 0.97, NULL);
INSERT INTO itemdopedido VALUES (143, 31, 20, 0.80, NULL);
INSERT INTO itemdopedido VALUES (148, 31, 7, 0.82, NULL);
INSERT INTO itemdopedido VALUES (121, 31, 35, 0.87, 0.3);
INSERT INTO itemdopedido VALUES (203, 31, 6, 0.84, NULL);
INSERT INTO itemdopedido VALUES (148, 45, 8, 0.25, NULL);
INSERT INTO itemdopedido VALUES (97, 77, 20, 1.05, 0.1);
INSERT INTO itemdopedido VALUES (103, 53, 37, 1.80, NULL);
INSERT INTO itemdopedido VALUES (119, 53, 43, 1.85, NULL);
INSERT INTO itemdopedido VALUES (101, 31, 9, 0.87, 0);
INSERT INTO itemdopedido VALUES (138, 53, 18, 1.80, NULL);
INSERT INTO itemdopedido VALUES (104, 53, 32, 1.92, NULL);
INSERT INTO itemdopedido VALUES (101, 78, 18, 2.00, 0);
INSERT INTO itemdopedido VALUES (148, 77, 3, 1.05, NULL);
INSERT INTO itemdopedido VALUES (91, 77, 40, 1.10, NULL);
INSERT INTO itemdopedido VALUES (101, 13, 5, 6.18, 0.13);
INSERT INTO itemdopedido VALUES (138, 77, 35, 1.12, NULL);
INSERT INTO itemdopedido VALUES (119, 77, 40, 1.13, NULL);
INSERT INTO itemdopedido VALUES (98, 77, 5, 1.15, 0);
INSERT INTO itemdopedido VALUES (111, 78, 70, 1.98, NULL);
INSERT INTO itemdopedido VALUES (143, 78, 10, 2.00, NULL);
INSERT INTO itemdopedido VALUES (148, 78, 30, 1.93, NULL);
INSERT INTO itemdopedido VALUES (189, 78, 45, 1.98, 0.2);
INSERT INTO itemdopedido VALUES (105, 78, 10, 1.75, NULL);
INSERT INTO itemdopedido VALUES (137, 13, 8, 6.00, 0);
INSERT INTO itemdopedido VALUES (119, 13, 6, 553.00, 0.1);
INSERT INTO itemdopedido VALUES (108, 13, 17, 7.00, 0.25);

# ---------------------------------------------
# -- 3. Crie uma stored procedure que liste todos os clientes cadastrados. Depois
# -- execute.
# ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_listaClientes()
BEGIN
	SELECT *
    FROM cliente;
END;
$$ DELIMITER ;

CALL sp_listaClientes();

# ---------------------------------------------
# -- 4. Crie uma stored procedure que receba um determinado valor como
# -- parâmetro e retorne os produtos que são mais baratos que o valor passado.
# -- Em seguida execute a stored procedure criada passando o valor R$ 3,00 como
# -- parâmetro.
# ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_filtraProdutoPorPrecoMaximo(IN varValor double)
BEGIN
	SELECT *
    FROM produto
    WHERE precounitario < varValor;
END;
$$ DELIMITER ;

CALL sp_filtraProdutoPorPrecoMaximo(3.00);

# ---------------------------------------------
# -- 5. Crie uma stored procedure que receba o código do produto e informe seu
# -- volume total de vendas em R$. Em seguida execute a stored procedure criada
# -- passando como parâmetro o código de um produto qualquer.
# ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_valorTotalVendasProduto(IN varCodigoProduto INT)
BEGIN
    SELECT varCodigoProduto AS 'Código do Produto', P.descricaoproduto AS 'Produto', SUM(I.precounitario * I.quantidade) - SUM(I.desconto * I.quantidade) AS 'Total em R$'
	FROM produto P
	JOIN itemdopedido I
	ON P.codigoproduto = I.codigoproduto
	WHERE I.codigoproduto = varCodigoProduto;
END;
$$ DELIMITER ;

CALL sp_valorTotalVendasProduto(25);

CALL sp_valorTotalVendasProduto(13);

# ---------------------------------------------
# -- 6. Crie uma stored procedure para inserir registros na tabela produto. O
# -- procedimento deve receber o código do produto, a unidade, a descrição do
# -- produto e o preço unitário. Deve retornar uma mensagem de erro se os valores
# -- não forem passados.
# ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_cadastraProduto(
	IN varCodigoProduto INT,
    IN varUnidade VARCHAR(3),
    IN varDescricaoProduto VARCHAR(30),
    IN varPrecoUnitario DOUBLE
)
BEGIN
	IF(varCodigoProduto IS NULL) THEN
		SELECT "Informe o código do produto!" AS ERRO;
    ELSEIF(varUnidade IS NULL) THEN
		SELECT "Informe a unidade de medida do produto!" AS ERRO;
    ELSEIF(varDescricaoProduto IS NULL) THEN
		SELECT "Informe a descrição do produto!" AS ERRO;
    ELSEIF(varPrecoUnitario IS NULL) THEN
		SELECT "Informe o preço do produto!" AS ERRO;
	ELSE
		INSERT INTO produto
		VALUES(varCodigoProduto, varUnidade, varDescricaoProduto, varPrecoUnitario);
	END IF;
END;
$$ DELIMITER ;

# ---------------------------------------------
# -- 7. Insira 3 novos registros na tabela produto utilizando a stored procedure
# -- criada. Em uma das inserções passe os parâmetros vazios.
# ---------------------------------------------

# -- Chamada 1 - passando todos os parâmetros
	# -- Inicializa as variáveis
	SET @varCodigoProduto = NULL, @varUnidade = NULL, @varDescricaoProduto = NULL, @varPrecoUnitario = NULL;

	# -- Define valores para as variáveis
	SET @varCodigoProduto = 10;
	SET @varUnidade = "U";
	SET @varDescricaoProduto = "Maçã";
	SET @varPrecoUnitario = 0.65;

	# -- Chama a procedure sp_cadastraProduto();
	CALL sp_cadastraProduto(@varCodigoProduto, @varUnidade, @varDescricaoProduto, @varPrecoUnitario);


# -- Chamada 2 - faltando definir o parâmetro @varUnidade
	# -- Inicializa as variáveis
	SET @varCodigoProduto = NULL, @varUnidade = NULL, @varDescricaoProduto = NULL, @varPrecoUnitario = NULL;

	# -- Define valores para as variáveis
	SET @varCodigoProduto = 11;
	SET @varDescricaoProduto = "Uva";
	SET @varPrecoUnitario = 2.8;

	# -- Chama a procedure sp_cadastraProduto();
	CALL sp_cadastraProduto(@varCodigoProduto, @varUnidade, @varDescricaoProduto, @varPrecoUnitario);


# -- Chamada 3 - informando o parâmetro @varUnidade pendente
	# -- Define valores para as variáveis
	SET @varUnidade = "CX";

	# -- Chama a procedure sp_cadastraProduto();
	CALL sp_cadastraProduto(@varCodigoProduto, @varUnidade, @varDescricaoProduto, @varPrecoUnitario);

# ---------------------------------------------
# -- 8. Crie uma stored procedure que receba como parâmetro uma string que será
# -- usada como chave de busca parcial pelo nome de um produto. A stored
# -- procedure deve retornar o código do produto encontrado como parâmetro de
# -- saída. Exemplo, uma busca por 'qu' deve encontrar o produto "queijo" e
# -- retornar o código 25. Caso a consulta encontre mais de um produto, a stored
# -- procedure deve retornar um código de erro (p. ex. um número negativo). O
# -- mesmo vale caso nenhum produto seja encontrado, mas nesse caso o código
# -- de erro deve ser diferente.
# ---------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_buscaProduto(
	IN varBusca VARCHAR(30),
    OUT varCodigoProduto INT
)
BEGIN
	DECLARE varQtdResultados INT;
    
    SELECT COUNT(*)
    INTO varQtdResultados
	FROM produto
	WHERE descricaoproduto LIKE CONCAT("%", varBusca, "%");
    
    IF(varQtdResultados = 0) THEN
		SET varCodigoProduto = -1;
		SELECT CONCAT("Código de erro: ", varCodigoProduto, ". Nenhum resultado para esta pesquisa!") AS ERRO;
    ELSEIF(varQtdResultados > 1) THEN
		SET varCodigoProduto = -2;
        SELECT CONCAT("Código de erro: ", varCodigoProduto, ". Muitos resultados para esta pesquisa!") AS ERRO;
	ELSE
		SELECT codigoproduto
		INTO varCodigoProduto
		FROM produto
		WHERE descricaoproduto LIKE CONCAT("%", varBusca, "%");
    END IF;
END;
$$ DELIMITER ;

# ---------------------------------------------
# -- 9. Execute a stored procedure criada no exercício 8 passando como parâmetro
# -- a string ‘pa’.
# ---------------------------------------------

# -- Chamada 1 - busca com 1 único resultado
	# -- Inicializa as variáveis
	SET @varCodigoProduto = NULL;
    
	# -- Chama a procedure sp_buscaProduto();
    CALL sp_buscaProduto("pa", @varCodigoProduto);
	SELECT @varCodigoProduto;

# -- Chamada 2 - busca com 1 único resultado
	# -- Inicializa as variáveis
	SET @varCodigoProduto = NULL;
    
	# -- Chama a procedure sp_buscaProduto();
    CALL sp_buscaProduto("qu", @varCodigoProduto);
	SELECT @varCodigoProduto;

# -- Chamada 3 - busca com vários resultados
	# -- Inicializa as variáveis
	SET @varCodigoProduto = NULL;
    
	# -- Chama a procedure sp_buscaProduto();
    CALL sp_buscaProduto("inh", @varCodigoProduto);
	SELECT @varCodigoProduto;

# -- Chamada 4 - busca com nenhum resultado
	# -- Inicializa as variáveis
	SET @varCodigoProduto = NULL;
    
	# -- Chama a procedure sp_buscaProduto();
    CALL sp_buscaProduto("lha", @varCodigoProduto);
	SELECT @varCodigoProduto;