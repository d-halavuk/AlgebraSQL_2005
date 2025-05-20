USE AdventureWorksOBP

--8
CREATE PROC getKupciPoPrezimenu @Kriterij nvarchar(50), @BrojZapis INT OUTPUT
AS
    SELECT * FROM Kupac 
    WHERE Prezime LIKE @Kriterij + '%'

    SELECT @BrojZapis = COUNT(*) FROM Kupac 
    WHERE Prezime LIKE @Kriterij + '%'
GO


DECLARE @Broj INT
EXEC getKupciPoPrezimenu @Kriterij = 'Ha', @BrojZapis = @Broj OUTPUT
PRINT @Broj

DROP PROC getKupciPoPrezimenu



--9
CREATE PROC getInfoZaKomercijalista
    @ID int,
    @Ime nvarchar(50) OUTPUT,
    @Prezime nvarchar(50) OUTPUT,
    @BrojRacuna int OUTPUT
AS
    SELECT @Ime = k.Ime, @Prezime = k.Prezime FROM Komercijalist AS k
    WHERE IDKomercijalist = @ID

    SELECT @BrojRacuna = COUNT(*) FROM Racun
    WHERE KomercijalistID = @ID
GO


DECLARE @Ime nvarchar(50), @Prezime nvarchar(50), @BrojRacuna int
EXEC getInfoZaKomercijalista @ID = 268,  @Ime = @Ime OUTPUT, @Prezime = @Prezime OUTPUT, @BrojRacuna = @BrojRacuna OUTPUT
PRINT @Ime + ' ' + @Prezime 
PRINT @BrojRacuna

SELECT * FROM Racun WHERE KomercijalistID = 268

DROP PROC getInfoZaKomercijalista