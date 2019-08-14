-----------------------------CARGA PARA A TB_AUX VENDA_INGRESSO-------------------------------------------

CREATE PROCEDURE SP_OLTP_FATO_VENDA_INGRESSO(@data DATETIME)
AS
BEGIN
	
END

-----------------------------CARGA PARA A TB_AUX_FILME-------------------------------------------
CREATE PROCEDURE SP_OLTP_TB_AUX_FILME (@data DATETIME)
AS
BEGIN 
	DELETE FROM TB_AUX_FILME WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_FILME
	SELECT @data, ID_FILME, NOME, GENERO, PRODUTORA, DIRETOR, DURACAO FROM TB_FILME
END

-----------------------------CARGA PARA A TB_AUX_PRECO-------------------------------------------

-----------------------------CARGA PARA A TB_AUX_SESSAO-------------------------------------------
CREATE PROCEDURE SP_OLTP_TB_AUX_SESSAO (@data DATETIME)
AS 
BEGIN
	DELETE FROM TB_AUX_SESSAO WHERE DATA_CARGA = @data
	INSERT INTO TB_AUX_SESSAO
	SELECT @data, ID_SESSAO, HORARIO_SESSAO, DATA_SESSAO, LINGUAGEM FROM TB_SESSAO
END
