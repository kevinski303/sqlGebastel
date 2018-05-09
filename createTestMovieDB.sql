DECLARE @dbName	varchar(45);
DECLARE @tableName1 varchar(45);
DECLARE @tableName2 varchar(45);
DECLARE @tableName3 varchar(45);

DECLARE @sqlDropDatabase VARCHAR(MAX);
DECLARE @sqlCreateDatabase VARCHAR(MAX);
DECLARE @sqlCreateTable3 VARCHAR(MAX);
DECLARE @sqlCreateTable2 VARCHAR(MAX);
DECLARE @sqlCreateTable1 VARCHAR(MAX);

DECLARE @sqlinsertTable3 VARCHAR(MAX);
DECLARE @sqlinsertTable2 VARCHAR(MAX);
DECLARE @sqlinsertTable1 VARCHAR(MAX);

SET @dbName	= 'MovieDB'
SET @tableName1 = 'Movies'
SET @tableName2 = 'Genre'
SET @tableName3 = 'Year'

USE [master];
IF EXISTS(SELECT * FROM sys.databases where name = @dbName)
	SET @sqlDropDatabase = 'DROP DATABASE ' + @dbName
	EXECUTE(@sqlDropDatabase)
	PRINT @sqlDropDatabase + ' -> Done'

SET @sqlCreateDatabase = 'CREATE DATABASE ' + @dbName
	EXECUTE (@sqlCreateDatabase)
PRINT @sqlCreateDatabase + ' -> Done'

SET @sqlCreateTable3 = 'USE ' + @dbName + ' CREATE TABLE ' + @tableName3 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, ' + @tableName3 + ' INT NOT NULL, UNIQUE(' + @tableName3 + '));'
	EXECUTE (@sqlCreateTable3)
PRINT @sqlCreateTable3 + ' -> Done'

SET @sqlCreateTable2 = 'USE ' + @dbName + ' CREATE TABLE ' + @tableName2 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, ' + @tableName2 + ' VARCHAR(45) NOT NULL, UNIQUE(' + @tableName2 + '));'
	EXECUTE (@sqlCreateTable2)
PRINT @sqlCreateTable2 + ' -> Done'

SET @sqlCreateTable1 = 'USE ' + @dbName + ' CREATE TABLE ' + @tableName1 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, Name VARCHAR(MAX) NOT NULL, ' + @tableName2 + 'ID INT FOREIGN KEY REFERENCES ' + @tableName2 
	+ '(ID), ' + @tableName3 + 'ID INT FOREIGN KEY REFERENCES ' + @tableName3 + '(ID));'
	EXECUTE (@sqlCreateTable1)
PRINT @sqlCreateTable1 + ' -> Done'

/*INSERTS*/
SET @sqlinsertTable3 = 'USE ' + @dbName + ' INSERT INTO ' + @tableName3 + '(' + @tableName3 + ') Values(1999),(2008),(2012);'
PRINT @sqlinsertTable3 + ' -> Done'

SET @sqlinsertTable2 = 'USE ' + @dbName + ' INSERT INTO ' + @tableName2 + '(' + @tableName2 + ') Values(''Thriller''),(''Action''),(''Fantasy'');'
PRINT @sqlinsertTable2 + ' -> Done'

SET @sqlinsertTable1 = 'USE ' + @dbName + ' INSERT INTO ' + @tableName1 + '(Name,' + @tableName2 + 'ID,' 
	+ @tableName3 + 'ID) Values(''Inception'',1,3),(''Batman Begins'',2,2),(''Fight Club'',1,1);'
PRINT @sqlinsertTable1 + ' -> Done'
