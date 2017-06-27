# Range 范围类型

# ... 表示不包括最后一个成员
range = 1...4;
p range if(range === 4) # => 1,2,3 不包括4

# .. 表示包括最后一个成员
range = 'a'..'z'
p range if(range === 'z') # => 包括 ‘z’

# Range 的常用方法

# => each 遍历范围内所有成员
range.each{|i| p i}

# => reject 把范围转为数组，并删掉满足条件的成员
range = 1..9
arr = range.reject{|i| i%2 == 0} # => 删掉双数
arr.each{|j| p j}

# => select 把范围内满足条件的成员选出来转为数组
arr = range.select{|k| k > 3}
arr.each{|b| p b}


# => 自定义类型也可以作为范围成员
