-- ==============================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan data riwayat kesehatan untuk masing-masing pasien
-- ==============================================================================
CREATE PROCEDURE sp_riwayatKesehatan
AS
BEGIN
	SELECT ck.kode_catatan, p.nama_pasien, ck.riwayat
	FROM catatan_kesehatan ck
	JOIN pasien p ON ck.kodepas_ang = p.kodepas_ang;
END;

EXEC sp_riwayatKesehatan;
