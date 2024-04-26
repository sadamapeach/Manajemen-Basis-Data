-- ================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan jumlah karyawan keseluruhan
-- ================================================================
CREATE PROCEDURE sp_jumlahKaryawan
AS
BEGIN
	SELECT COUNT(*) AS jumlah_karyawan
	FROM karyawan;
END;

EXEC sp_jumlahKaryawan;
