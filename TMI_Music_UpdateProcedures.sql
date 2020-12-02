--Изменение Названия Группы
Create Procedure BandUpdate
				@BandId int,
				@Title nvarchar(50)
As
Begin
	If NOT EXISTS (Select Id From Band Where Id = @BandId)
	Begin
		Print 'Band with this id not exists';
		return;
	End;

	Update Band
		Set Title = @Title Where Id = @BandId;
End;


--Изменение сведений о песне
Create Procedure AudioUpdate
				@AudioId int,
				@Title nvarchar(50),
				@Year nvarchar(4)
As
Begin
	If NOT EXISTS (Select Id From Audio Where Id = @AudioId)
	Begin
		Print 'Audio with this id not exists';
		return;
	End;

	Update Audio
		Set Title = @Title, [Year] = @Year Where Id = @AudioId;
End;


--Изменение названия Альбома
Create Procedure AlbumUpdate
				@AlbumId int,
				@Title nvarchar (50)
As
Begin
	If NOT EXISTS (Select Id From Album Where Id = @AlbumId)
	Begin
		Print 'Album with this id not exists';
		return;
	End;

	Update Album
		Set Title = @Title Where Id = @AlbumId;
End;

--Изменение Названия Плейлиста
Create Procedure PlayListUpdate
				@PlayListId int,
				@Title nvarchar(50)
As
Begin
	If NOT EXISTS (Select Id From PlayList Where Id = @PlayListId)
	Begin
		Print 'PlayList with this id not exists';
		return;
	End;

	Update PlayList
		Set Title = @Title Where Id = @PlayListId;
End;
