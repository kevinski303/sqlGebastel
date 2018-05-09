DECLARE @sql VARCHAR(MAX), @dbName VARCHAR(25)

DECLARE dbNameCursor CURSOR for
	SELECT name from sys.databases WHERE name in (
		'testDB1',
		'testDB2',
		'testDB3'
	);

OPEN dbNameCursor
FETCH NEXT from dbNameCursor INTO @dbName 
WHILE @@FETCH_STATUS = 0
	BEGIN
	SET @sql =	'ALTER DATABASE ' + @dbName + ' SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
			ALTER DATABASE '+ @dbName  + ' SET Offline;
			ALTER DATABASE ' + @dbName + ' SET MULTI_USER;'
	EXEC(@sql)
	PRINT @sql + ' done'
	FETCH NEXT from DbNameCursor INTO @dbName
	END
Close dbNameCursor
Deallocate dbNameCursor
