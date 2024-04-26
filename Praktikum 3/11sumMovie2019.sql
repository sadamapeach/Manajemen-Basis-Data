-- ========================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Menampilkan jumlah film yang rilis di tahun 2019
-- ========================================================================
CREATE PROCEDURE sp_jumlahFilm2019
AS
BEGIN
	SELECT COUNT(*) AS jumlah_film_2019
	FROM movie
	WHERE tahun_rilis = 2019;
END;

EXEC sp_jumlahFilm2019;