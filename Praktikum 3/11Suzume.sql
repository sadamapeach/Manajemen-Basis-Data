-- ========================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-23
-- Description	: Mencari methode pembayaran dan harga film yang ditonton
-- ========================================================================
CREATE PROCEDURE sp_filmMethodHarga
	@judul_film VARCHAR(100)
AS
BEGIN
	SELECT p.payment_method, p.harga_tiket
	FROM payment P JOIN ticket t
	ON p.payment_id = t.payment_id
	WHERE t.judul_film = @judul_film;
END;

EXEC sp_filmMethodHarga 'Suzume no Tojimari';
