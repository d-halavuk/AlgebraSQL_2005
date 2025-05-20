USE AdventureWorksOBP

--5
CREATE PROCEDURE DodajKreditnuKarticu
    @Tip NVARCHAR(50),
    @Broj NVARCHAR(25),
    @IstekMjesec TINYINT,
    @IstekGodina SMALLINT
AS
    DECLARE @BrojPrije INT, @BrojPoslije INT;
    SELECT @BrojPrije = COUNT(*) FROM KreditnaKartica;

    INSERT INTO KreditnaKartica (Tip, Broj, IstekMjesec, IstekGodina)
    VALUES (@Tip, @Broj, @IstekMjesec, @IstekGodina);

    SELECT @BrojPoslije = COUNT(*) FROM KreditnaKartica;

	SELECT @BrojPrije AS BrojZapisaPrije, @BrojPoslije AS BrojZapisaPoslije;


EXEC DodajKreditnuKarticu 
    @Tip = 'Maestro', 
    @Broj = '666666666666', 
    @IstekMjesec = 10, 
    @IstekGodina = 2026;


DROP PROC DodajKreditnuKarticu



--6
CREATE PROCEDURE DohvatiProizvodePoBojama
    @Boja1 NVARCHAR(15),
    @Boja2 NVARCHAR(15),
    @Boja3 NVARCHAR(15)
AS
    SELECT * FROM Proizvod
    WHERE Boja IN (@Boja1, @Boja2, @Boja3)


EXEC DohvatiProizvodePoBojama 'Crvena', 'Plava', 'Crna'

DROP PROC DohvatiProizvodePoBojama



