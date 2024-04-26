USE [Bioskop_Database]
GO
/****** Object:  Trigger [dbo].[auto_incrememt_no_ruangan]    Script Date: 19/05/2023 01:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================
-- Author	  :	Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Trigger auto increment pada tabel studio
--				untuk field noStudio
-- =========================================================
CREATE TRIGGER [dbo].[auto_incrememt_noStudio] 
   ON  [dbo].[studio] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	IF (SELECT COUNT(*) FROM studio) <= 1
		SET @number = 1
	ELSE
		BEGIN
			SELECT TOP 2 @number = noStudio FROM studio ORDER BY noStudio DESC
			SET @number = @number + 1
		END

		UPDATE studio SET noStudio = @number
		WHERE noStudio = (SELECT TOP 1 noStudio FROM inserted ORDER BY noStudio DESC)

END
