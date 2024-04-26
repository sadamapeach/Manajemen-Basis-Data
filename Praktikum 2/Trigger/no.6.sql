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
-- Description:	Memvalidasi waktu pada tabel antrian
-- =============================================================
CREATE TRIGGER [dbo].[validasi_waktu_antrian] 
   ON  [dbo].[antrian] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE antrian SET waktu_antrian = GETDATE()
	WHERE waktu_antrian = (SELECT TOP 1 waktu_antrian FROM inserted ORDER BY waktu_antrian DESC)

END
GO
