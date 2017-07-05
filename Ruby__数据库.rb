# Ruby__数据库.rb
require 'dbi'
# DBI.connect "dbi:Mysql:dbname:host","username","password"
dbh = DBI.connect("dbi:Mysql:test:127.0.0.1:3306", "root", "666666")
if dbh 
	p "OK"
else
	p "NO"
end