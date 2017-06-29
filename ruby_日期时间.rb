# => ruby_日期时间.rb

# => 获取当前时间
p '--------获取当前时间---------'
now = Time.new
p now, now.year,now.month,now.day,now.hour,now.min,now.sec,now.usec # => 微秒

# => 创建一个时间
p '--------创建一个时间---------'
p myTime1 = Time.mktime(1980,1,11,3,25,15)
p myTime2 = Time.local(1988,10,15)

# => 时间差
p '--------时间差---------'
	res = myTime1 - myTime2
p res.to_s<<'秒'

# => 把时间转为数组
p '--------把时间转为数组---------'
p now.to_a ,'秒，分，时，天，月，年，周，一年中的第几天，是否夏令时，所在时区'


