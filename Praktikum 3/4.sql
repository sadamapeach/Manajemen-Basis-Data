-- ================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Mencari data pasien berdasarkan nama
-- ================================================================
CREATE PROCEDURE sp_cariNamaPasien
	@nama_pasien VARCHAR(50)
AS
BEGIN
	SELECT * FROM pasien
	WHERE nama_pasien = @nama_pasien;
END;

EXEC sp_cariNamaPasien 'Muhammad Ali';
