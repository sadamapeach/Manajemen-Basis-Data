SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================
-- Author	  :	Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Trigger auto increment pada tabel ruangan
--				untuk field no_ruangan
-- =========================================================
CREATE TRIGGER [dbo].[auto_incrememt_no_ruangan] 
   ON  [dbo].[ruangan] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	IF (SELECT COUNT(*) FROM ruangan) <= 1
		SET @number = 1
	ELSE
		BEGIN
			SELECT TOP 2 @number = no_ruangan FROM ruangan ORDER BY no_ruangan DESC
			SET @number = @number + 1
		END

		UPDATE ruangan SET no_ruangan = @number
		WHERE no_ruangan = (SELECT TOP 1 no_ruangan FROM inserted ORDER BY no_ruangan DESC)

END
GO
