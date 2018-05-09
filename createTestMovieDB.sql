DECLARE @dbname	varchar(45);
DECLARE @tablename1 varchar(45);
DECLARE @tablename2 varchar(45);
DECLARE @tablename3 varchar(45);

DECLARE @sql_createdb VARCHAR(MAX);
DECLARE @sql_createtable3 VARCHAR(MAX);
DECLARE @sql_createtable2 VARCHAR(MAX);
DECLARE @sql_createtable1 VARCHAR(MAX);

DECLARE @sql_insertTable3 VARCHAR(MAX);
DECLARE @sql_insertTable2 VARCHAR(MAX);
DECLARE @sql_insertTable1 VARCHAR(MAX);

SET @dbname		= 'MovieDB'
SET @tablename1 = 'Movies'
SET @tablename2 = 'Genre'
SET @tablename3 = 'Year'

SET @sql_createdb = 'CREATE DATABASE ' + @dbname
	EXECUTE (@sql_createdb)
PRINT @sql_createdb

SET @sql_createtable3 = 'USE ' + @dbname + ' CREATE TABLE ' + @tablename3 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, ' + @tablename3 + ' VARCHAR(4) NOT NULL, UNIQUE(' + @tablename3 + '));'
	EXECUTE (@sql_createtable3)
PRINT @sql_createtable3 + ' Done'

SET @sql_createtable2 = 'USE ' + @dbname + ' CREATE TABLE ' + @tablename2 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, ' + @tablename2 + ' VARCHAR(45) NOT NULL, UNIQUE(Genre));'
	EXECUTE (@sql_createtable2)
PRINT @sql_createtable2 + ' Done'

SET @sql_createtable1 = 'USE ' + @dbname + ' CREATE TABLE ' + @tablename1 
	+ ' (ID int IDENTITY(1,1) PRIMARY KEY, Name VARCHAR(MAX) NOT NULL, ' + @tablename2 + 'ID INT FOREIGN KEY REFERENCES ' + @tablename2 + '(ID), ' + @tablename3 + 'ID INT FOREIGN KEY REFERENCES ' + @tablename3 + '(ID));'
	EXECUTE (@sql_createtable1)
PRINT @sql_createtable1 + ' Done'

/* ADD INSERTS

SET @sql_insertTable3 = 'USE ' + @dbname + 'INSERT INTO ' + @tablename3
	+

*/ 
