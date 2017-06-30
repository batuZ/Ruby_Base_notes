# => ruby_类.rb
# => 1、类名首字母必须大写
# => 2、构造方法名必须是 initialize,没有返回值，只能由new调用
# => 3、没有重载，类中有同名方法时，后面的会覆盖前面的
# => 4、@count 实例变量，可以声明在方法中，类内有效
# => 5、@@count 类变量，全局的，影响所有实例，可以声明在方法中，类内有效
class Point

	# => 构造方法
	def initialize x,y
		# => 定义在方法中的实例变量，只有在方法被调用过才有效
		# => 定义在方法外的实例变量，只有在类被初始化了才有效
		# => 但它们的作用域都在类内全部位置
		@X = x
		@Y = y
	end


	# => 定义方法
	# => 隐式返回值是方法中最后一个表达式的值
	def getCoord
		p @X.to_s
		p @Y.to_s
	end

	# => 定义可变参数方法 *参数集
	# => 显式返回
	def sum *nums
		num = 0
		nums.each{|n| num+=n}
		return '求和：' << num.to_s
	end

	# => 定义默认参数方法
	def add a = 3 ,b
		a + b
	end
	# => 嵌套类
	class Point2D
		def sayhi
			p '我是嵌套类的方法'
		end
	end

	p '------------- 类方法 -------------------'
	def Point.classFunc
		p '调用了类方法！'
	end
	p '------------- 类变量  -----------'
	@@pointName = "PPP"

	p '------------- 成员变量,字段 -----------'
	@X = 9
	@Y = 8

	p '------------- 类属性 -----------'
	# => get\set
	def X
		return @X
	end
	def X= value
		@X = value
	end
	# => ruby内置属性设置方法
	attr_reader :like ,:love 	# => 创建属性，并设为只读
	attr_writer :like ,:love 	# => 设为只写
	attr_accessor :like ,:love 	# => 设为可读写
	attr :like,false			# => 设为只读
	attr :love,true				# => 设为可读写
end

# => 嵌套类的另一种形式
class Point::Point3D
	def sayhi
		p '我是嵌套类的方法'
	end
end


# => 特殊类
# => 基于一个实例扩展成一个独有类，来增加方法，这个方法为此实例独有
pt1 = Point.new 5,5
class << pt1
	def pt1Func
		p "我是特殊类指定的方法"
		p "如果实例需要定义的特殊方法很多，则用特殊类定义"
		p "可以定义新的方法，也可以覆盖类中的方法"
	end
end


# => 特殊方法
# => 为一个实例扩展方法，这个方法为此实例独有
pt2 = Point.new 5,5
def pt2.pt2Func
	p "我是实例的特殊方法"
	p "可以定义新的方法，也可以覆盖类中的方法"
end



# => 应用

# => 创建类对象
ent = Point.new 3,4
# => 实例化嵌套类
subEnt = Point::Point2D.new	


# => 调用方法接收返回值,没有参数时可以只写方法名
p "返回值是 => #{ent.getCoord}"
subEnt.sayhi
p "可变3参数： #{ent.sum 4,5,6}"
p "可变5参数： #{ent.sum 4,5,6,7,8}"
p "两参一个带默认参数的方法，#{ent.add 5}"

# => 调用了类方法！
Point.classFunc

# => 特殊类和特殊方法
pt1.pt1Func
pt2.pt2Func

p '----------读写类属性------------'
pt1.X = 99999
p pt1.X