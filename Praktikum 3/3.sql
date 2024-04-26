-- ================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan jumlah pasien keseluruhan
-- ================================================================
CREATE PROCEDURE sp_jumlahPasien
AS
BEGIN
	SELECT COUNT(*) AS jumlah_pasein
	FROM pasien;
END;

EXEC sp_jumlahPasien;
