--Выборка песен по жанру
Create Procedure FilterByGenre
				@Genre nvarchar(50)
As
Begin
	Select * From AudioView Where Genre = @Genre;
End;

--Выборка песен по разным критериям(FullText)
Drop Procedure FullTextAudioSearch
Create Procedure FullTextAudioSearch
				@Filter nvarchar(50)
As
Begin
	Declare @FullTextParam nvarchar(50);
	Set @FullTextParam = N'"' + @Filter + '**"';
	Select * From AudioViewFullText Where CONTAINS((Title, Band, Album),@FullTextParam);
End;