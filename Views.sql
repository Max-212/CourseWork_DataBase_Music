

drop View AudioView;
-- Инфо о песне
Create View AudioView
As
Select Audio.Id As Id,
	   Audio.Title As Title,
	   Band.Title As Band,
	   Album.Title As Album,
	   Audio.[Year] As [Year],
	   Genre.Title As Genre
From dbo.Audio left join dbo.Band On Audio.BandId = Band.Id
	left join dbo.Album On Audio.AlbumId = Album.Id
	left join dbo.Audio_Genre On Audio_Genre.AudioId = Audio.Id
	left join dbo.Genre On Audio_Genre.GenreId = Genre.Id;
	

drop View BandView
-- Инфо о группе
Create View BandView As
Select Band.Title As Title,
	   Member.FirstName As FirstName,
	   Member.LastName As LastName,
	   Member.DateOfBirth As Birth
From Band left join Band_Member On Band_Member.BandId = Band.Id
	left join Member On Band_Member.MemberId = Member.Id;

--Инфо о плейлисте
Create View PlayListView As
Select DISTINCT 
	   PlayList.Title As Title,
	   AudioView.Title As Audio,
	   AudioView.Band As Band
From PlayList left join Audio_PlayList On Audio_PlayList.PlayListId = PlayList.Id
	left join AudioView On Audio_PlayList.AudioId = AudioView.Id;


--Плейлисты пользователя
Create View UserView As
Select [User].[Login] As [Login],
	   PlayList.Title As PlayList
From [User] left join User_PlayList On [User].Id = User_PlayList.UserId 
	left join PlayList on PlayList.Id = User_PlayList.PlayListId;   

--инфо о песне с полнотекстовым поиском
Create View AudioViewFullText
With SCHEMABINDING
As
Select Audio.Id As Id,
	   Audio.Title As Title,
	   Band.Title As Band,
	   Album.Title As Album,
	   Audio.[Year] As [Year]
From dbo.Audio inner join dbo.Band On Audio.BandId = Band.Id
	inner join dbo.Album On Audio.AlbumId = Album.Id
	

Select * From AudioView;
Select * From BandView;
Select * From PlayListView;
Select * From User_PlayList;
Select * From UserView

Select * FRom AudioViewFullText Where CONTAINS((Title, Band),N'"Газ**"');

