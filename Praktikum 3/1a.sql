-- ====================================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan data pasien yang diurutkan berdasarkan kode pasien kemudian nama pasien
-- ====================================================================================================
CREATE PROCEDURE sp_pasienKodeNama
AS
BEGIN
	SELECT * FROM pasien
	ORDER BY kodepas_ang, nama_pasien;
END;

EXEC sp_pasienKodeNama
