--Удаление музыкальной группы
Create Procedure BandRemove
				@BandId int
As
Begin
	Delete From Band Where Id = @BandId;
End;


--Удаление альбома 
Create Procedure AlbumRemove
				@AlbumId int
As
Begin
	Delete From Album Where Id = @AlbumId;
End;

Exec AlbumRemove 1001;



-- Удаление музыканта
Create Procedure MemberRemove
				@MemberId int
As
Begin
	Delete From Member Where Id = @MemberId;
End;



-- Удаление Песни
Create Procedure AudioRemove
				@AudioId int
As
Begin
	Delete From Audio Where Id = @AudioId;
End;



-- Удаление жанра
Create Procedure GenreRemove
				@GenreId int
As
Begin
	Delete From Genre Where Id = @GenreId;
End;


-- Удаление Плейлиста
Create Procedure PlayListRemove
				@PlayListId int
As
Begin
	Delete From PlayList Where Id = @PlayListId;
End;


-- Удаление пользователя
Create Procedure UserRemove
				@UserId int
As
Begin
	Delete From [User] Where Id = @UserId;
End;


-- Удаление музыканта из группы
Create Procedure MemberBandRemove
				@MemberId int,
				@BandId int
As
Begin
	Delete From Band_Member Where MemberId = @MemberId AND BandId = @BandId;
End;

-- Удаление песни из плейлиста
Create Procedure AudioPlayListRemove
				@AudioId int,
				@PlayListId int
As
Begin
	Delete From Audio_PlayList Where AudioId = @AudioId AND PlayListId = @PlayListId;
End;


-- Удаление жанра из песни
Create Procedure AudioGenreRemove
				@AudioId int,
				@GenreId int
As
Begin
	Delete From Audio_Genre Where AudioId = @AudioId AND GenreId = @GenreId;
End;


-- Удаление плейлиста у пользователя
Create Procedure UserPlayListRemove
				@UserId int,
				@PlayListId int
As
Begin
	Delete From User_PlayList Where UserId = @UserId AND PlayListId = @PlayListId;
End;



--Тесты



Select * From User_PlayList
Select * From Band;
Select * FROM Album;
Select * From Audio
Select * From PlayList

SELECT name, compatibility_level FROM sys.databases;