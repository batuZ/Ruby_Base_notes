ruby_符号symbol.rb

1、符号的本质是唯一的ID，但表现为字符串
2、字面一样的符号就是同一个对象
3、符号从创建到程序结束前会一直存在，array = Symbol.all_symbols 返回所有的符号
4、比字符串效率高
5、用于hash的key，函数的hash参数，枚举，
6、重复定义会返回现有的对象
7、有改动需求使用字符串，名称固定且多次调用使用符号

作为 hash.Keys
	hah = {
		:DX => 1.75,
		:HSL => 1.77,
		:XX => 1.68
	}
	puts hah[:DX]
	和用整数作Key是一样的
	hah = {
		5 => 1.75,
		17 => 1.77,
		2 => 1.68
	}
	puts hah[5]
	因为：
		:DX.object_id == :DX.object_id		# => true
		5.object_id == 5.object_id			# => true
	但是：
		'str'.object_id == 'str'.object_id 	# => false

作为 哈希参数

	def showItems(hah)
		hah.each{|k,v| puts "#{k},#{v}"}
	end
	showItems :a => 3 ,:b => 4
	# => a,3
	# => b,4

	需要使用默认参数时，可以调用hash.merge!()方法，合并传入的参数

	def showItems(hah)
	moren ={:a=>0,:b=>0}
	moren.merge!(hah)
	moren.each{|k,v| puts "#{k},#{v}"}
	end
	showItems :b => 3
	# => a,0
	# => b,3

	也可以定义带固定参数和hash参数的函数

	def showItems(agr1,agr2,hah)
	puts "#{agr1} : #{agr2}"
	hah.each{|k,v| puts "#{k},#{v}"}
	end
	showItems 'newItemName',56,:b => 3
	# => newItemName : 56
	# => b,4