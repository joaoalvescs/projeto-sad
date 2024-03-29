USE CINEMA
GO

CREATE PROCEDURE POV_AREA_STAGING (@data DATETIME)
AS 
BEGIN
	EXEC SP_OLTP_TB_AUX_CINEMA @data
	EXEC SP_OLTP_TB_AUX_CLIENTE @data
	EXEC SP_OLTP_TB_AUX_ENDERECO_CLIENTE @data
	EXEC SP_OLTP_TB_AUX_FILME @data
	EXEC SP_OLTP_TB_AUX_INGRESSO @data
	EXEC SP_OLTP_TB_AUX_PAGAMENTO @data
	EXEC SP_OLTP_TB_AUX_PLANO @data
	EXEC SP_OLTP_TB_AUX_PLATAFORMA @data
	EXEC SP_OLTP_TB_AUX_PRODUTO @data
	EXEC SP_OLTP_TB_AUX_SESSAO @data
	EXEC SP_OLTP_TB_AUX_TURNO @data
	EXEC SP_OLTP_TB_AUX_FATO_VENDA_PRODUTO @data
	EXEC SP_OLTPTB_AUX_FATO_VENDA_INGRESSO @data
END


GO

EXEC POV_AREA_STAGING '20180101'

