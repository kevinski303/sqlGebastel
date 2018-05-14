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

-----------------------------------------

SET @dbName	= 'MovieDB'
SET @tableName1 = 'Movies'
SET @tableName2 = 'Genre'
SET @tableName3 = 'Year'

-----------------------------------------

USE [master];
IF EXISTS(SELECT * FROM sys.databases where name = @dbName)
	SET @sqlDropDatabase = 'DROP DATABASE ' + @dbName
	EXECUTE(@sqlDropDatabase)
	PRINT @sqlDropDatabase + ' -> Done'

SET @sqlCreateDatabase = 'CREATE DATABASE ' + @dbName
	EXECUTE (@sqlCreateDatabase)
	IF EXISTS (SELECT * FROM SYS.databases where name = @dbName)
	PRINT @dbName + ' created'

SET @sqlCreateTable3 = 'USE ' + @dbName + ' CREATE TABLE ' + @tableName3 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, ' + @tableName3 + ' INT NOT NULL, UNIQUE(' + @tableName3 + '));'
	EXECUTE (@sqlCreateTable3)
	
SET @sqlCreateTable2 = 'USE ' + @dbName + ' CREATE TABLE ' + @tableName2 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, ' + @tableName2 + ' VARCHAR(45) NOT NULL, UNIQUE(' + @tableName2 + '));'
	EXECUTE (@sqlCreateTable2)

SET @sqlCreateTable1 = 'USE ' + @dbName + ' CREATE TABLE ' + @tableName1 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, Name VARCHAR(MAX) NOT NULL, ' + @tableName2 + 'ID INT FOREIGN KEY REFERENCES ' + @tableName2 
	+ '(ID), ' + @tableName3 + 'ID INT FOREIGN KEY REFERENCES ' + @tableName3 + '(ID));'
	EXECUTE (@sqlCreateTable1)

SET @sqlinsertTable3 = 'USE ' + @dbName + ' INSERT INTO ' + @tableName3 + '(' + @tableName3 + ') Values(1999),(2008),(2012);'
	EXECUTE (@sqlinsertTable3)

SET @sqlinsertTable2 = 'USE ' + @dbName + ' INSERT INTO ' + @tableName2 + '(' + @tableName2 + ') Values(''Thriller''),(''Action''),(''Fantasy'');'
	EXECUTE (@sqlinsertTable2)

SET @sqlinsertTable1 = 'USE ' + @dbName + ' INSERT INTO ' + @tableName1 + '(Name,' + @tableName2 + 'ID,' + @tableName3 + 'ID) Values(''Inception'',1,3),(''Batman Begins'',2,2),(''Fight Club'',1,1);'
	EXECUTE (@sqlinsertTable1) 
