-- =======================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan nama obat yang paling banyak diberikan kepada pasien untuk
--				  masing-masing kode_obat
-- =======================================================================================
CREATE PROCEDURE sp_maxObat
AS
BEGIN
	SELECT o.nama, r.jumlah_obat FROM resep r 
	JOIN obat o ON r.id_obat = o.id
	WHERE r.jumlah_obat = (
		SELECT MAX(jumlah_obat) 
		FROM resep
	);
END;

EXEC sp_maxObat;
