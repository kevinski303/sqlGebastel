
DECLARE @sql VARCHAR(MAX), @dbname VARCHAR(25)

DECLARE DbNameCursor CURSOR for
	SELECT name from sys.databases WHERE name in (
		'database1',
		'database2',
		'database3'
		)

OPEN DbNameCursor
FETCH next from DbNameCursor INTO @dbname 
while @@FETCH_STATUS = 0
	begin
	SET @sql =  'ALTER DATABASE '+ @dbname  + ' SET Offline;' 
	PRINT @sql
	EXEC(@sql)
	fetch next from DbNameCursor into @dbname
	end
Close DbNameCursor
Deallocate DbNameCursor


