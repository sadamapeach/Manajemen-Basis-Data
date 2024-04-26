-- ===================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Mencari data karyawan berdasarkan kode karyawan
-- ===================================================================
CREATE PROCEDURE sp_cariKodeKaryawan
	@kodekar_ang INT
AS
BEGIN
	SELECT * FROM karyawan
	WHERE kodekar_ang = @kodekar_ang;
END;

EXEC sp_cariKodeKaryawan 5;
