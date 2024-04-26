-- ======================================================================================
-- Author		: Oktaviana Sadama Nur Azizah		
-- Create date	: 2023-05-30
-- Description	: Menampilkan periode waktu, total pendapatan, dan total laba per bulan
-- ======================================================================================
ALTER PROCEDURE [dbo].[sp_showSummary]
AS
BEGIN
	SELECT MONTH(j.TglFaktur) AS 'Bulan', YEAR(j.TglFaktur) AS 'Tahun',
		SUM(j.Jumlah * p.HargaJual) AS 'Total Pendapatan',
		SUM((j.Jumlah * p.HargaJual) - (j.Jumlah * p.HargaPokok)) AS 'Total Laba'
	FROM JUAL j 
	INNER JOIN PRODUK p ON j.NoProduk = p.NoProduk

	GROUP BY MONTH(j.TglFaktur), YEAR(j.TglFaktur)
	ORDER BY YEAR(j.TglFaktur), MONTH(j.TglFaktur)
END;

EXEC sp_showSummary

-- ======================================================================================
-- Author		: Oktaviana Sadama Nur Azizah
-- Create date	: 2023-05-30
-- Description	: Menampilkan data produk terjual per masing-masing produk berdasarkan 
--				  inputan periode waktu tertentu
-- ======================================================================================
ALTER PROCEDURE [dbo].[sp_produkTerjual]
	@StartDate DATE,
	@EndDate DATE
AS
BEGIN
	SELECT p.NoProduk, p.NamaProduk, SUM(j.Jumlah) AS JumlahTerjual
	FROM PRODUK p 
	INNER JOIN JUAL j ON p.NoProduk = j.NoProduk
	WHERE j.TglFaktur BETWEEN @StartDate AND @EndDate

	GROUP BY p.NoProduk, p.NamaProduk
	ORDER BY p.NoProduk

END;

EXEC sp_produkTerjual '2023-05-01', '2023-05-31';