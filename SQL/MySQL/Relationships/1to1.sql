CREATE DATABASE IF NOT EXISTS relationships;
USE relationships;

CREATE TABLE IF NOT EXISTS cliente(
    id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    sexo_cliente ENUM('M','F') NOT NULL,
    status ENUM('Aprovado','Reprovado') NOT NULL
);

INSERT INTO cliente(nome, sexo_cliente, status) VALUES('Carlos Souza','M','Aprovado'); 
INSERT INTO cliente(nome, sexo_cliente, status) VALUES('Maria Cristina', 'F', 'Aprovado');
INSERT INTO cliente(nome, sexo_cliente, status) VALUES('Eustáqui Quirino','M','Aprovado');

-- Limpa a tabela e mantem a sua estutura
TRUNCATE cliente;


-- SELECIONE TUDO (*) DE cliente
SELECT * FROM cliente;

-- Mostra a estrutura da tabela
 DESCRIBE cliente;  DESC cliente;


CREATE TABLE IF NOT EXISTS documento(
    id_documento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_clienteFK INT NOT NULL,
    tipo_documento ENUM('RG','CPF') NOT NULL,
    numero_documento VARCHAR(14) NOT NULL,
    FOREIGN KEY(id_clienteFK) REFERENCES cliente(id_cliente)
);

DESC documento;

INSERT INTO documento(id_clienteFK, tipo_documento, numero_documento) VALUES(1,'RG','44.722.563-2');
INSERT INTO documento(id_clienteFK, tipo_documento, numero_documento) VALUES(2,'CPF','356.763.551-01');
INSERT INTO documento(id_clienteFK, tipo_documento, numero_documento) VALUES(3,'RG','23.422.122-X');

-- todas as colunas = *
SELECT tipo_documento FROM documento;
SELECT tipo_documento, numero_documento FROM documento;

SELECT * FROM cliente;
SELECT * FROM documento;

