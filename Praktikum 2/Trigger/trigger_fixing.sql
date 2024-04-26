USE [Klinik]
GO
/****** Object:  Trigger [dbo].[auto_incrememt_kodepas_ang]    Script Date: 19/05/2023 00:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================
-- Author	  : Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Trigger auto increment pada tabel pasien
--				untuk field kodepas_ang
-- =======================================================
ALTER TRIGGER [dbo].[auto_incrememt_kodepas_ang_fixing] 
   ON  [dbo].[pasien] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	IF (SELECT COUNT(*) FROM pasien) <= 1
		SET @number = 1
	ELSE
		SELECT TOP 2 @number = kodepas_ang FROM pasien ORDER BY kodepas_ang DESC
		IF (SELECT TOP 1 kodepas_ang FROM inserted ORDER BY kodepas_ang DESC) > @number
			SET @number = @number + 1
		ELSE
			SET @number = @number + 2
		
	UPDATE pasien SET kodepas_ang = @number
	WHERE kodepas_ang = (SELECT TOP 1 kodepas_ang FROM inserted ORDER BY kodepas_ang DESC)
	AND nama_pasien = (SELECT TOP 1 nama_pasien FROM inserted ORDER BY kodepas_ang DESC)

END
GO
