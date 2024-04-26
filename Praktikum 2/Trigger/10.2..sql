USE [Bioskop_Database]
GO
/****** Object:  Trigger [dbo].[validasi_waktu_antrian]    Script Date: 19/05/2023 02:00:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================
-- Author	  : Oktaviana Sadama Nur Azizah		
-- Create date: 2023-05-15
-- Description:	Memvalidasi waktu pembayaran tiket bioskop pada tabel Payment
-- ============================================================================
CREATE TRIGGER [dbo].[validasi_waktu_payment_tiket] 
   ON  [dbo].[Payment] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Payment SET payment_date_time = GETDATE()
	WHERE payment_date_time = (SELECT TOP 1 payment_date_time FROM inserted ORDER BY payment_date_time DESC)

END
