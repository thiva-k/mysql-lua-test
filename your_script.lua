local mysql = require 'mysql'
os.execute("sleep 5")

-- Create MySQL connection

assert(mysql.connect{
	host = 'mysql',
	port = 3306,
	user = 'root',
	password = 'root',
	db = 'rate_limits',
	charset = 'utf8mb4',
	max_packet_size = 1024 * 1024,
})

assert(cn:query('drop table if exists cats'))

local res = assert(cn:query('create table cats '
			  .. '(id serial primary key, '
			  .. 'name varchar(5))'))

local res = assert(cn:query('insert into cats (name) '
	.. "values ('Bob'),(''),(null)"))

print(res.affected_rows, ' rows inserted into table cats ',
		'(last insert id: ', res.insert_id, ')')