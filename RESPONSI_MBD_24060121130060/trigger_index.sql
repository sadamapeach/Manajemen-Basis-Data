-- ==========================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Mengupdate nilai harga jual menjadi sebesar harga produk + 5% harga pokok
-- ==========================================================================================
CREATE TRIGGER [dbo].[update_harga_jual]
   ON  [dbo].[PRODUK] 
   AFTER UPDATE
AS 
BEGIN
	UPDATE PRODUK
	SET HargaJual = HargaPokok + (0.05 * HargaPokok)
END;

-- ==========================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Mengupdate stok ketika produk berhasil dijual dan menampilkan pesan jika 
--				  kondisi stok dibawah stok minimum
-- ==========================================================================================
CREATE TRIGGER [dbo].[update_stok_produk]
   ON [dbo].[JUAL] 
   AFTER INSERT
AS 
BEGIN
	DECLARE @Stok INT = (SELECT TOP 1 Stok FROM PRODUK p
	INNER JOIN inserted i ON p.NoProduk = i.NoProduk
	ORDER BY i.NoFaktur DESC)

	DECLARE @Jumlah INT = (SELECT Jumlah FROM inserted)

	DECLARE @StokMin INT = (SELECT TOP 1 p.StokMin FROM PRODUK p
	INNER JOIN inserted i ON p.NoProduk = i.NoProduk
	ORDER BY NoFaktur DESC)

	IF @Stok - @Jumlah > @StokMin
		UPDATE PRODUK set Stok = Stok - @Jumlah
		FROM PRODUK p INNER JOIN inserted i ON p.NoProduk = i.NoProduk
		WHERE p.NoProduk = i.NoProduk
	ELSE
		RAISERROR('[!WARNING: STOK DIBAWAH MINIMUM!]', 16, 1)
END;

-- ===================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Clustered Indeks Tabel Produk
-- ===================================================
USE RESPONSI

CREATE CLUSTERED INDEX PK_PRODUK
ON PRODUK (NoProduk)

-- ===================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Clustered Indeks Tabel Jual
-- ===================================================
USE RESPONSI

CREATE CLUSTERED INDEX PK_JUAL
ON JUAL (NoFaktur)

-- ===================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Non Clustered Indeks Tabel Produk
-- ===================================================
USE RESPONSI

CREATE INDEX NonClusteredIndex_Produk
ON PRODUK ([NoProduk]
		,[NamaProduk]
		,[Kategori])

-- ===================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Non Clustered Indeks Tabel Jual
-- ===================================================
USE RESPONSI

CREATE INDEX NonClusteredIndex_Jual
ON JUAL (NoProduk)