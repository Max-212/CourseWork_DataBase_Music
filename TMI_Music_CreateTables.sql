create database TMI_Music_BSTU_2020;

use TMI_Music_BSTU_2020;


-- Таблица песен
DROP table Audio
create table Audio
(
	Id int identity(1000,1) not null,
	Title nvarchar(50) not null,
	[Year] nvarchar(4),
	 
	BandId int not null,
	AlbumId int not null,

	CONSTRAINT PK_AudioID PRIMARY KEY (Id),

	CONSTRAINT FK_BAND FOREIGN KEY(BandId)
		REFERENCES Band (Id) ,

	CONSTRAINT FK_Album FOREIGN KEY(AlbumId)
		REFERENCES Album (Id)
)

Drop table Album;
-- Таблица Альбомов для песен
create table Album
(
	Id int identity(1000,1) not null,
	BandId int not null,
	Title nvarchar(50) not null,


	CONSTRAINT PK_AlbumID PRIMARY KEY (Id),

	CONSTRAINT FK_Album_BandId FOREIGN KEY(BandId)
		REFERENCES Band (Id) ON DELETE CASCADE
)

drop table Band
-- Таблица Музыкальных Групп
create table Band
(
	Id int identity(1000,1) not null,
	Title nvarchar(50) not null unique,

	CONSTRAINT PK_BandID PRIMARY KEY (Id)
)

Drop table Band_Member
--Таблица Связи Между Музыкальной Группой и участником n:n
create table Band_Member
(
	BandId int not null,
	MemberId int not null,

	CONSTRAINT PK_BandMember PRIMARY KEY (BandId,MemberId),

	CONSTRAINT FK_BandMember_BandId FOREIGN KEY(BandId)
		REFERENCES Band (Id) ON DELETE CASCADE,

	CONSTRAINT FK_BandMember_MemberId FOREIGN KEY(MemberId)
		REFERENCES Member (Id) ON DELETE CASCADE,
)


-- Таблица Участников Музыкальных групп
create table Member
(
	Id int identity(1000,1) not null,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	DateOfBirth Date not null,

	CONSTRAINT PK_ID PRIMARY KEY (Id)
)


--Таблица Жанров
create table Genre
(
	Id int identity(1000,1) not null,
	Title nvarchar(50) not null,

	CONSTRAINT PK_GenreID PRIMARY KEY (Id)
)
drop table Audio_Genre
--Таблица связи между Аудио и Жанром
create table Audio_Genre
(
	AudioId int not null,
	GenreId int not null,

	CONSTRAINT PK_AudioGenre PRIMARY KEY (AudioId,GenreId),

	CONSTRAINT FK_AudioGenre_AudioId FOREIGN KEY(AudioId)
		REFERENCES Audio (Id) ON DELETE CASCADE,

	CONSTRAINT FK_AudioGenre_GenreId FOREIGN KEY(GenreId)
		REFERENCES Genre (Id) ON DELETE CASCADE,
)

-- Таблица Плейлистов
create table PlayList
(
	Id int identity(1000,1) not null,
	Title nvarchar(50) not null unique,

	CONSTRAINT PK_PlayListID PRIMARY KEY (Id)
)

drop table Audio_PlayList;
-- Таблица связи между плейлистом и аудио
create table Audio_PlayList
(
	AudioId int not null,
	PlayListId int not null,

	CONSTRAINT PK_AudioPlayList PRIMARY KEY (AudioId,PlayListId),

	CONSTRAINT FK_AudioPlayList_AudioId FOREIGN KEY(AudioId)
		REFERENCES Audio (Id) ON DELETE CASCADE,

	CONSTRAINT FK_AudioPlayList_PlayListId FOREIGN KEY(PlayListId)
		REFERENCES PlayList (Id) ON DELETE CASCADE,
)


-- Таблица пользователей
create table [User]
(
	Id int identity(1000,1) not null,
	[Login] nvarchar(50) not null unique,
	[Password] nvarchar(50) not null,

	CONSTRAINT PK_UserId PRIMARY KEY (Id)
)

drop table User_PlayList;
-- Таблица связи между пользователем и Плейлистом
create table User_PlayList
(
	UserId int not null,
	PlayListId int not null,

	CONSTRAINT PK_UserPlayList PRIMARY KEY (UserId,PlayListId),

	CONSTRAINT FK_UserPlayList_UserId FOREIGN KEY(UserId)
		REFERENCES [User] (Id) ON DELETE CASCADE,

	CONSTRAINT FK_UserPlayList_PlayListId FOREIGN KEY(PlayListId)
		REFERENCES PlayList (Id) ON DELETE CASCADE,
)