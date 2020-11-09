use TMI_Music_BSTU_2020;


-- Добавление музыкальной группы
Create Procedure BandAdd 
				@Title nvarchar(50)
As
Begin
	Insert into Band(Title) values (@Title)
End;



--Добавление альбома
Create Procedure AlbumAdd
				@Title nvarchar(50),
				@Band  nvarchar(50)
As
Begin

	Declare @BandId int

	if NOT EXISTS (Select Id From Band Where Title = @Band)
		Begin
			Exec BandAdd @Band;		
		End;
	
	Set @BandId = (Select Id From Band Where Title = @Band);

	Insert into Album(BandId, Title) values (@BandId, @Title);

End;



--Добавление музыканта
Create Procedure MemberAdd
				@FirstName nvarchar(50),
				@LastName nvarchar(50),
				@DateOfBirth Date
As
Begin
	Insert into Member (FirstName, LastName, DateOfBirth)
		values ( @FirstName, @LastName, @DateOfBirth);
End;



--Добавление жанра
Create Procedure GenreAdd
				@Title nvarchar(50)
As
Begin
	Insert into Genre(Title) values (@Title)
End;


--Добавление песни
Create Procedure AudioAdd
				@Title nvarchar(50),
				@Year nvarchar(4),
				@Band nvarchar(50),
				@Album nvarchar(50)
As
Begin
	
	Declare @BandId int,
			@AlbumId int
	
	if NOT EXISTS (Select Id From Band Where Title = @Band)
		Begin
			Exec BandAdd @Band;		
		End;
	
	Set @BandId = (Select Id From Band Where Title = @Band);

	if NOT EXISTS (Select Id From Album Where Title = @Album And BandId = @BandId)
		Begin
			Exec AlbumAdd @Album, @Band;		
		End;

	
	Set @AlbumId = (Select Id From Album Where Title = @Album And BandId = @BandId);


	Insert into Audio(Title, [Year], BandId, AlbumId) values
				(@Title, @Year, @BandId, @AlbumId);
End;




--Создание плейлиста
Create Procedure PlayListAdd
				@Title nvarchar(50)
As
Begin
	Insert into PlayList(Title) values (@Title);
End;


--Добавление существующей песни в плейлист
Create Procedure AudioToPlayList
				@AudioId int,
				@PlayList nvarchar(50)
As
Begin
	Declare @PlayListId int

	If NOT EXISTS (Select Id From PlayList where Title = @PlayList)
		Begin
			Exec PlayListAdd @PlayList;
		End;

	SET @PlayListId = (Select Id From PlayList where Title = @PlayList);

	Insert into Audio_PlayList(AudioId,PlayListId) values(@AudioId, @PlayListId);
	
End;



--Добавление Пользователя
Create Procedure UserAdd
				@Login nvarchar(50),
				@Password nvarchar(50)
As
Begin
	Insert into [User]([Login],[Password]) values(@Login, @Password);
End;


--Добавление плейлиста пользователю
Create Procedure PlayListToUser
				@UserId int,
				@PlayList nvarchar(50)
As
Begin
	Declare @PlayListId int

	If NOT EXISTS (Select Id From PlayList where Title = @PlayList)
		Begin
			Exec PlayListAdd @PlayList;
		End;

	SET @PlayListId = (Select Id From PlayList where Title = @PlayList);

	Insert into User_PlayList(UserId, PlayListId) values(@UserId, @PlayListId);
End;



--Добавление музыканта в группу
Create Procedure MemberToBand
				@MemberId int,
				@Band nvarchar(50)
As
Begin
	Declare @BandId int

	If NOT EXISTS (Select Id From Band where Title = @Band)
		Begin
			Exec BandAdd @Band;
		End;

	SET @BandId = (Select Id From Band where Title = @Band);

	Insert into Band_Member(BandId, MemberId) values(@BandId, @MemberId);
End;


--Добавление жанра к песне
Create Procedure GenreToAudio
				@AudioId int,
				@Genre nvarchar(50)
As
Begin
	Declare @GenreId int

	If NOT EXISTS (Select Id From Genre where Title = @Genre)
		Begin
			Exec GenreAdd @Genre;
		End;

	SET @GenreId = (Select Id From Genre where Title = @Genre);

	Insert into Audio_Genre(AudioId, GenreId) values(@AudioId, @GenreId);
End;


Exec AudioToPlayList 1001, 'TrifList';
Exec PlayListToUser 1000, 'TrifList';
Exec MemberToBand 1001, 'Trifanou';
Exec GenreToAudio 1000, 'RAP';
Exec AudioAdd 'Smeels Like Teen Spirit', '1991', 'Nirvana', 'Nevermind';
Exec MemberAdd 'Петр', 'Первый', '1672-6-9';


Select * From PlayList;
Select * From Audio_PlayList;
Select * from Genre;
Select * from Member;
Select * from Band;
Select * from Audio;
Select * FROM Album;
Select * from [User];
Select * FROM User_PlayList;
Select * From Band_Member;
Select * From Audio_Genre;