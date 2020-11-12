
Drop Procedure ImportAudios;

Create Procedure ImportAudios
As
Begin

	Declare @Audio varchar(max);
	Select @Audio =
		BulkColumn
		From OPENROWSET(BULK 'C:\Ћабы\5 сем\CourseWork_DataBase_Music\JSON\import\file1.json', Single_Blob) JSON;

	If (ISJSON(@Audio) = 1)
	Begin
		
		Declare @Title nvarchar(50);
		Declare @Band nvarchar(50);
		Declare @Album nvarchar(50);
		Declare @Year nvarchar(4);

		Declare audio_cursor Cursor For
			Select * 
			From OPENJSON(@Audio, '$.Audio')
			With(
				Title nvarchar(50) '$.Title',
				Band nvarchar(50)  '$.Band',
				Album nvarchar(50) '$.Album',
				Year nvarchar(4)   '$.Year'
				);
		Open audio_cursor;

		Fetch Next From audio_cursor Into @Title, @Band, @Album, @Year;
		While @@FETCH_STATUS = 0
		Begin
			Exec AudioAdd @Title, @Year, @Band, @Album;
			Fetch Next From audio_cursor Into @Title, @Band, @Album, @Year;
		End;
		

		Close audio_cursor;
		Deallocate audio_cursor;


	End;

	Else
	Begin
		Print 'JSON IS NOT VALID';
	End;
End;

Exec ImportAudios



