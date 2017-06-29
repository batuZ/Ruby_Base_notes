# => ruby_数组.rb

# => 创建数组
p '-------创建数组--------'
arr = [3.14, 4, 'x', "aaaa"]
p arr.size()

color = Array.new
color[0] = "R"
color[1] = "G"
color[2] = "B"
p color.size()

# => 访问成员
p '-------访问成员--------'
p arr[2]	# => 获取第三个成员 
p color[-1]	# => 获取最后一个成员

# => 改变长度
# => 索引在范围内则修改成员值
# => 超出范围则自动扩充到对应长度，新增且未赋值的成员值为nil
p '-------改变长度--------'
arr = Array.new
arr[3] = "G"
p arr # => [nil,nil,nil,"G"]

# => 带有空格的字符串转换为数组
# => 小写w不转义，大写转义
p '-------字符串转换为数组--------'
str = 'aa  bb   cc    ddd'
p %w{vv #{str}}
p %W{vv #{str}}
p %W{aa  bb   cc    ddd}

# => 添加成员 <<
p '-------添加成员 <<--------'
arr = Array.new
arr.push 'ss','ll' 		# => push,添加到数组尾，可以同时操作多个对象
arr << 55				# => << ,添加到数组尾，一次操作一个对象
arr.unshift 'vv','b'	# => unshift,添加到数组头，成为第一个成员，可以同时操作多个对象
p arr

# => 删除成员
p '-------删除成员--------'
# => shift 从数组中删掉第一个成员，并返回这个成员
p arr.shift , arr
# => pop 从数组中删掉最后一个成员，并返回这个成员
p arr.pop , arr

# => 截取数组
p '-------截取数组--------'
p arr = ('a'..'g').to_a
p newArr1 = arr[0,3]		# => 从索引为0的成员开始，截3个成员
p newArr2 = arr[2..5]		# => 截取索引为 2 到 5 的成员
p newArr3 = arr[0...4]		# => 截取索引为 1 到 3 的成员
p newArr4 = arr[-3,3]		# => 截取最后三个成员

# => 合并数组
p '-------合并数组--------'
arr1 = ('a'..'d').to_a
arr2 = ('e'..'g').to_a
arr3 = ('h'..'k').to_a
p '-------"+ -"不修改原数组--------'
p allArr = arr1 + arr2 + arr3
p allArr - arr2 
p '-------arr.concat 基于原数组操作--------'
newAllArr = arr1.concat(arr2.concat(arr3))
p newAllArr , arr1 , arr2 , newAllArr - arr2