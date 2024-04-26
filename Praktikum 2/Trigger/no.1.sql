SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================
-- Author	  :	Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Trigger auto increment pada tabel karyawan
--				untuk field kodekar_ang
-- =========================================================
CREATE TRIGGER [dbo].[auto_incrememt_kodekar_ang] 
   ON  [dbo].[karyawan] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	IF (SELECT COUNT(*) FROM karyawan) <= 1
		SET @number = 1
	ELSE
		BEGIN
			SELECT TOP 2 @number = kodekar_ang FROM karyawan ORDER BY kodekar_ang DESC
			SET @number = @number + 1
		END

		UPDATE karyawan SET kodekar_ang = @number
		WHERE kodekar_ang = (SELECT TOP 1 kodekar_ang FROM inserted ORDER BY kodekar_ang DESC)

END
GO
