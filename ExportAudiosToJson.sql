Create Procedure ExportAudiosToJson
As
Begin


	--Select TOP(100) Title, Band, Album, Year From AudioView
	--For Json Path
	
	EXEC master.dbo.sp_configure 'show advanced options', 1
		RECONFIGURE WITH OVERRIDE
	EXEC master.dbo.sp_configure 'xp_cmdshell', 1
		RECONFIGURE WITH OVERRIDE;

	
	declare @cmd nvarchar(255);
	select @cmd = '
	bcp "use TMI_Music_BSTU_2020; Select Top(100) Title, Band, Album, Year From AudioView For Json Path" ' +
	'queryout "C:\Лабы\test.json" -S"' + @@SERVERNAME + '" -w -T -r -t';
	
	exec xp_cmdshell @cmd;

End;


create procedure ExportAudiosToJson
as
begin
select ProductId, Title, Description, Price, CategoryId, BrandId from Products
for xml path('product'), root('products');

exec master.dbo.sp_configure 'show advanced options', 1
reconfigure with override
exec master.dbo.sp_configure 'xp_cmdshell', 1
reconfigure with override;


end;