--Sql Server 2014 Express Edition

CREATE TABLE caixa (
  data DATETIME,
  saldo_inicial DECIMAL(10,2) NOT NULL,
  saldo_final DECIMAL(10,2) NOT NULL)
  GO


--Inicialmente o Saldo Inicial é igual ao Saldo Final
INSERT INTO caixa(data, saldo_inicial, saldo_final)

-- Obtém a data, converte para DateTime e depois converte para Vachar com o tamanho 120. Pois quando for comparar as datas, é interessante estar como string
VALUES ( CONVERT(VARCHAR, CONVERT(DATETIME,GETDATE()), 120)    , 100, 100) 
GO

CREATE TABLE vendas (
  data DATETIME,
  cod_venda DECIMAL(10,2) NOT NULL,
  valor DECIMAL(10,2) NOT NULL)
GO
  
  
CREATE TRIGGER tgr_vendas 
ON vendas 
FOR INSERT
AS
BEGIN
	DECLARE
    @data  DATETIME,
	-- Criação da tabela temporária 'inserted' que recebe os dados temporariamente da tabela 'vendas' em uma linha
	@valor DECIMAL(10, 2) 
    
	
	-- As variáveis recebem aqueles valores durante a seleção*/
	SELECT @data = data, @valor = valor FROM inserted  

	-- Em seguida os valores das variávies são utilizados para fazer o update*/
	UPDATE caixa SET saldo_final = saldo_final + @valor 
    WHERE data = @data
END
GO
  
INSERT INTO vendas(data, cod_venda, valor) VALUES (CONVERT(VARCHAR, CONVERT(DATETIME,GETDATE()), 120)   , 1, 20) 
GO

SELECT * FROM vendas;
SELECT * FROM caixa;

