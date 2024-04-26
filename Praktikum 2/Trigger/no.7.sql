USE [Klinik]
GO
/****** Object:  Trigger [dbo].[auto_incrememt_kodekar_ang]    Script Date: 16/05/2023 19:13:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================
-- Author	  : Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Menghapus entri pada tabel antrian ketika seorang pasien sudah menjalani
--				pemeriksaan (dicatatkan pada tabel 'Catatan Kesehatan'
-- =======================================================================================
CREATE TRIGGER [dbo].[delete_entri_antrian] 
   ON  [dbo].[catatan_kesehatan] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM antrian
	WHERE id_antrian = (SELECT TOP 1 id_kesehatan FROM inserted ORDER BY id_kesehatan DESC)

END
GO
