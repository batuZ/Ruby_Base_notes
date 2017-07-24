# Ruby__数据库.rb

# ------------------------------------DBI
# gem 无法安装 dbd-mysql,此交互方式不灵
# require 'dbi'	
# DBI.connect "dbi:Mysql:dbname:host","username","password"
# dbh = DBI.connect("dbi:Mysql:my_db01:127.0.0.1:3306", "root", "root")

# ------------------------------------ mysql2

# ruby 直接访问mysql 效率高于DBI
# 要先安装 mysql2模块 gem install mysql2
# 在程序中模拟操作控制台
require 'mysql2'
=begin
#创建数据库连接对象
client = Mysql2::Client.new(
    #:host     => 'localhost', # 主机
    :username => 'root',      # 用户名
    :password => 'root',    # 密码
    #:database => 'my_db01',      # 数据库
    #:encoding => 'utf8'       # 编码
    )

#查表
client.query("use my_db01")
results = client.query("show tables")
results.each{|row|p row # hash 列名 => 值
}

#创建表
results = client.query("create table t_groups(
				grup_name varchar(22),
				photo_count int,
				fouce double)")

#查表的创建信息
results = client.query("show create table t_photos")
results.each{|row| p row }

#创建数据
#client.query("insert into t_photos values('pic01',4000,3000)")

# 查数据
results = client.query("select * from t_photos")
results.each{|row| p row }
=end







