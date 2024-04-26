USE [Klinik]
GO
/****** Object:  Trigger [dbo].[auto_incrememt_kodekar_ang]    Script Date: 16/05/2023 19:13:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================
-- Author	  : Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Trigger auto increment pada tabel stock_obat
--				untuk field kodesto_ang
-- =============================================================
CREATE TRIGGER [dbo].[auto_incrememt_kodesto_ang] 
   ON  [dbo].[stock_obat] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	IF (SELECT COUNT(*) FROM stock_obat) <= 1
		SET @number = 1
	ELSE
		BEGIN
			SELECT TOP 2 @number = kodesto_ang FROM stock_obat ORDER BY kodesto_ang DESC
			SET @number = @number + 1
		END

		UPDATE stock_obat SET kodesto_ang = @number
		WHERE kodesto_ang = (SELECT TOP 1 kodesto_ang FROM inserted ORDER BY kodesto_ang DESC)

END
GO
