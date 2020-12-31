CREATE DATABASE IF NOT EXISTS db_store;
USE db_store;

CREATE TABLE IF NOT EXISTS tbl_product
(
	id_product	VARCHAR(3) PRIMARY KEY,
    description VARCHAR(50) UNIQUE,
    stock INT NOT NULL DEFAULT 0
);

INSERT INTO tbl_product VALUES
('001', 'bean', 10),
('002', 'rice', 5),
('003', 'bread', 15);

SELECT * FROM tbl_product;

CREATE TABLE tbl_item_sold
(
	id_sold INT,
    cod_sold_product VARCHAR(3),
    quantity INT
);

/*Conforme inserir ou remover registro da tabela item_sold, a tabela product precisa ser atualizada utilizando o id_product como referência
  De início é criada uma trigger para atender uma venda
*/


/* -- Crie os Delimiters com as Triggers em um arquivo à parte e execute

DELIMITER $

CREATE TRIGGER tgr_item_sold_insert AFTER INSERT
ON tbl_item_sold
FOR EACH ROW
BEGIN
	UPDATE tbl_product SET stock = stock - NEW.quantity
WHERE id_product = NEW.cod_sold_product;
END$

DELIMITER ;

 -- Caso precise deletar a trigger
DROP TRIGGER tgr_item_sold_insert;
*/



-- Conforme os registros de vendas ocorrerem, o estoque deverá ser atualizado

INSERT INTO tbl_item_sold VALUES
(1,'001',9),
(2,'002',4),
(3,'003',14);

-- A tabela de produtos foi atualizada
SELECT * FROM tbl_product;


-- Caso ocorra a desistência de uma ou mais vendas, o estoque precisa retornar ao que era, então é preciso de uma outra Trigger

/*
-- Crie os Delimiters com as Triggers em um arquivo à parte e execute

DELIMITER $

CREATE TRIGGER tgr_item_sold_delete AFTER DELETE
ON tbl_item_sold
FOR EACH ROW
BEGIN
	UPDATE product SET stock = stock + OLD.quantity
    WHERE id_product = OLD.cod_sold_product;
END$

DELIMITER ;

 -- Caso precise deletar a trigger
DROP TRIGGER tgr_item_sold_delete;
*/


-- Caso a primeira venda tenha desistência

DELETE FROM tbl_item_sold WHERE id_sold = 1;

SELECT * FROM tbl_product;




