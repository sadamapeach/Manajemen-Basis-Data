-- ====================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan pasien yang sudah mendaftar dalam antrian tapi tidak 
--				  melakukan pemeriksaan
-- ====================================================================================
CREATE PROCEDURE sp_antriBelumPeriksa
	@tanggal_pemeriksaan DATE
AS
BEGIN
	SELECT k.kodekar_hrf, k.kodekar_ang, p.nama_pasien, a.no_ruangan, r.nama_ruangan
	FROM antrian a
	JOIN karyawan k ON a.kodekar_ang = k.kodekar_ang
	JOIN pasien p ON a.kodepas_ang = p.kodepas_ang
	JOIN ruangan r ON a.no_ruangan = r.no_ruangan
	WHERE a.tanggal = @tanggal_pemeriksaan;
END;

EXEC sp_antriBelumPeriksa '2023-05-22';
