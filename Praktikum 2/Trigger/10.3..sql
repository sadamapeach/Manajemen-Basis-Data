USE [Bioskop_Database]
GO
/****** Object:  Trigger [dbo].[update_stock_obat]    Script Date: 19/05/2023 02:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================================================
-- Author	  : Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Mengupdate jumlah kapasitas studio pada tabel studio ketika seorang 
--				customer membeli tiket bioskop
-- ====================================================================================
CREATE TRIGGER [dbo].[update_kapasitas_studio] 
   ON  [dbo].[ticket] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @number INT
	SELECT @number = CAST(kapasitas_studio AS INT) FROM studio
	WHERE noStudio = (SELECT TOP 1 noStudio FROM inserted ORDER BY noStudio DESC)
	SET @number = @number - 1

	UPDATE studio SET kapasitas_studio = CAST(@number AS NCHAR(10))
	WHERE noStudio = (SELECT TOP 1 noStudio FROM inserted ORDER BY noStudio DESC)

END
