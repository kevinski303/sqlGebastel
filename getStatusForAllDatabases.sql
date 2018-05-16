select
	convert(varchar(20),databasepropertyex(a.name, 'Status')) as DB_Status,
	a.name
from
	master.dbo.sysdatabases a
order by 
	a.name
