Exec AudioAdd RAND(), '1991', 'Nirvana', 'Nevermind';

Drop Procedure CreateString;


-- Случайная строка
Create Procedure CreateString
	@size integer,
	@Name char(50) OUTPUT
AS
Begin
	SET @Name = (
	SELECT
		c1 AS [text()]
	FROM
		(
		SELECT TOP (50) c1
		FROM
		  (
		VALUES
		  ('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('G'), ('H'), ('I'), ('J'),
		  ('K'), ('L'), ('M'), ('N'), ('O'), ('P'), ('Q'), ('R'), ('S'), ('T'),
		  ('U'), ('V'), ('W'), ('X'), ('Y'), ('Z')
		  ) AS T1(c1)
		ORDER BY ABS(CHECKSUM(NEWID()))
		) AS T2
	FOR XML PATH('')
	);
End;

-- Добавление записей в таблицу Аудио
Create Procedure InsertAudios
				@Size int
As
Begin

	WHILE @Size > 0
    BEGIN
        
		Declare @Title nvarchar(50);
		Exec CreateString 50, @Title output;
		Exec AudioAdd @Title, '3847', 'FutureBand', 'Random';

        SET @Size = @Size - 1
    END;

End;


Exec InsertAudios 100000;
