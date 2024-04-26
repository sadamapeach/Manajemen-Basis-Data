-- ===============================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan data jadwal shift karyawan per minggu untuk masing-masing karyawan
-- ===============================================================================================
CREATE PROCEDURE sp_shiftKaryawan
AS
BEGIN
	SELECT js.kode_shift, js.nama_shift, js.hari, k.nama_kar
	FROM jadwal_shift js 
	JOIN karyawan k ON js.kodekar_ang = k.kodekar_ang;
END;

EXEC sp_shiftKaryawan;
