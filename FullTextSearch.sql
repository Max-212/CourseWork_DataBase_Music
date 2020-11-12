CREATE FULLTEXT CATALOG TmiMusicFTCatalog;

CREATE UNIQUE INDEX ndxAudioId ON Audio(Id);


CREATE FULLTEXT INDEX ON Audio  
(  
		Title                         --Full-text index column name   
        --TYPE COLUMN FileExtension    --Name of column that contains file type information  
        Language 2057                 --2057 is the LCID for British English  
)  
KEY INDEX ndxAudioId ON TmiMusicFTCatalog --Unique index  
WITH CHANGE_TRACKING AUTO    

CREATE UNIQUE clustered INDEX ndxAudioViewId ON dbo.AudioViewFullText(Id);


Drop FULLTEXT INDEX ON AudioViewFullText ;
--Audio View Fulltext index
CREATE FULLTEXT INDEX ON AudioViewFullText 
(  
		Title Language 2057,
		Band  Language 2057,
		Album Language 2057 
)  
KEY INDEX ndxAudioViewId ON TmiMusicFTCatalog --Unique index  
WITH CHANGE_TRACKING AUTO    




 


Select @@VERSION