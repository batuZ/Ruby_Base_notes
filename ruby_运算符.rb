# =>  === 运算符，左边是一个对象时，与 == 功能相同
# =>  左边是一个范围时 Range 如果左边包括右边，则为ture
pp = 0...9
puts 'has it' if(pp === 6) 

# => ** 乘方运算符，左为底，右为幂
puts 3**3 	# => 27

# =>  =~ 正则表达式 之 匹配
p "Ruby" =~ /by/ # => 2

# => !~ 正则表达式 之 不匹配
p "Ruby" !~ /by/ # => false

# => a<=>b意思是比较两个对象，
# => 如果a小于b，返回值是-1，
# => 如果a等于b，返回值是0，
# => 如果a大于b，返回值是1
a,b = 3,4
p a<=>b

# => 三元运算时，中间都要有空格，不然会报错
puts a>b ? a : b

# => 重载运算符

class Test
	attr_accessor :X,:Y
	def initialize x,y
		@X = x
		@Y = y
	end
	def + (kk)
		Test.new @X+kk.X , @Y+kk.Y
	end
end

c = (Test.new 4,5) + (Test.new 7,8)
puts c.X
puts c.Y