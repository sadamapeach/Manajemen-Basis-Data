USE [klinik]
GO
/****** Object:  Trigger [dbo].[auto_incrememt_kodekar_ang]    Script Date: 16/05/2023 19:13:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================
-- Author	  : Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Trigger auto increment pada tabel jadwal_shift
--				untuk field kode_shift
-- =============================================================
CREATE TRIGGER [dbo].[auto_incrememt_kode_shift] 
   ON  [dbo].[jadwal_shift] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	IF (SELECT COUNT(*) FROM jadwal_shift) <= 1
		SET @number = 1
	ELSE
		BEGIN
			SELECT TOP 2 @number = kode_shift FROM jadwal_shift ORDER BY kode_shift DESC
			SET @number = @number + 1
		END

		UPDATE jadwal_shift SET kode_shift = @number
		WHERE kode_shift = (SELECT TOP 1 kode_shift FROM inserted ORDER BY kode_shift DESC)

END
GO
