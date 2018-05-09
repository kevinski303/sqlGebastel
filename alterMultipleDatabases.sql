declare @sql varchar(200),@name varchar(20)
	declare cur cursor for 
		select name from sys.databases where name in ('database1','database2')
	open cur
	fetch next from cur into @name 
	while @@FETCH_STATUS = 0
		begin
		set @sql =  'alter database '+ @name  + ' set online;' 
		print @sql
		exec(@sql)
		fetch next from cur into @name
		end
	close cur
	deallocate cur
