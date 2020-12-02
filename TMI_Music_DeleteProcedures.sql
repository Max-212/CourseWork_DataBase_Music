--�������� ����������� ������
drop Procedure BandRemove
Create Procedure BandRemove
				@BandId int
As
Begin
	If NOT EXISTS (Select Id From Band Where Id = @BandId)
	Begin
		Print 'Band with this id not exists';
		return;
	End;

	If EXISTS (Select Top(1) Id From Audio Where BandId = @BandId)
	Begin
		Print 'The Audio with this band exists';
		return;
	End;

	Delete From Band Where Id = @BandId;
End;


--�������� ������� 
drop Procedure AlbumRemove
Create Procedure AlbumRemove
				@AlbumId int
As
Begin
	If NOT EXISTS (Select Id From Album Where Id = @AlbumId)
	Begin
		Print 'Album with this id not exists';
		return;
	End;

	If EXISTS (Select Top(1) Id From Audio Where AlbumId = @AlbumId)
	Begin
		Print 'The Audio with this album exists';
		return;
	End;
	Delete From Album Where Id = @AlbumId;
End;

-- �������� ���������
Create Procedure MemberRemove
				@MemberId int
As
Begin
	Delete From Member Where Id = @MemberId;
End;



-- �������� �����
Create Procedure AudioRemove
				@AudioId int
As
Begin
	Delete From Audio Where Id = @AudioId;
End;



-- �������� �����
Create Procedure GenreRemove
				@GenreId int
As
Begin
	Delete From Genre Where Id = @GenreId;
End;


-- �������� ���������
Create Procedure PlayListRemove
				@PlayListId int
As
Begin
	Delete From PlayList Where Id = @PlayListId;
End;


-- �������� ������������
Create Procedure UserRemove
				@UserId int
As
Begin
	Delete From [User] Where Id = @UserId;
End;


-- �������� ��������� �� ������
Create Procedure MemberBandRemove
				@MemberId int,
				@BandId int
As
Begin
	Delete From Band_Member Where MemberId = @MemberId AND BandId = @BandId;
End;

-- �������� ����� �� ���������
Create Procedure AudioPlayListRemove
				@AudioId int,
				@PlayListId int
As
Begin
	Delete From Audio_PlayList Where AudioId = @AudioId AND PlayListId = @PlayListId;
End;


-- �������� ����� �� �����
Create Procedure AudioGenreRemove
				@AudioId int,
				@GenreId int
As
Begin
	Delete From Audio_Genre Where AudioId = @AudioId AND GenreId = @GenreId;
End;


-- �������� ��������� � ������������
Create Procedure UserPlayListRemove
				@UserId int,
				@PlayListId int
As
Begin
	Delete From User_PlayList Where UserId = @UserId AND PlayListId = @PlayListId;
End;



--�����

Exec BandRemove 1000

Select * From User_PlayList
Select * From Band;
Select * FROM Album;
Select * From Audio
Select * From PlayList

SELECT name, compatibility_level FROM sys.databases;