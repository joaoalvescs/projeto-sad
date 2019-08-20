CREATE PROCEDURE SP_AGREGADO_FATO_VENDA_PRODUTO_MENSAL
AS
BEGIN
	DECLARE @id_tempo INT , @id_plataforma INT , @id_prduto INT , @valor_pago NUMERIC(10,2), @quantidade INT

	DECLARE C_AGREG_PRODUTO CURSOR FOR SELECT ID_TEMPO, ID_PRODUTO, ID_PLATAFORMA, VALOR_PAGO, QUANTIDADE 
									   FROM FATO_VENDA_PRODUTO
END
	
	

