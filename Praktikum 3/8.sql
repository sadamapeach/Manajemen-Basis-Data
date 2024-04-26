-- ===============================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan data obat yang sudah kadaluwarsa 
--				  berdasarkan tanggal hari ini
-- ===============================================================
CREATE PROCEDURE sp_obatKadaluwarsa
AS
BEGIN
	SELECT * FROM obat
	WHERE expired <= GETDATE();
END;

EXEC sp_obatKadaluwarsa;
