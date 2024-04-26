-- ====================================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan data pasien yang diurutkan berdasarkan nama pasien kemudian kode pasien
-- ====================================================================================================
CREATE PROCEDURE sp_pasienNamaKode
AS
BEGIN
	SELECT * FROM pasien
	ORDER BY nama_pasien, kodepas_ang;
END;

EXEC sp_pasienNamaKode;
