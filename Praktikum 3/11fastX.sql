-- ==========================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Mencari data movie berdasarkan judul film
-- ==========================================================================
CREATE PROCEDURE sp_cariJudulMovie
	@judul_film VARCHAR(100)
AS
BEGIN
	SELECT * FROM movie
	WHERE judul_film = @judul_film;
END;

EXEC sp_cariJudulMovie 'Fast X';
