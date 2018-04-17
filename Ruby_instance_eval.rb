
参考资料
# => https://blog.csdn.net/xluren/article/details/43964433
# => https://blog.csdn.net/baodongdong123/article/details/75206846
# => https://blog.csdn.net/sunset108/article/details/48136571


# instance_eval，class_eval开放类或实例，可以在外部进行操作,就你在内部一样

class A
	def initialize
		@var = 8
	end
	private
	def test1
		puts "I am test1"
	end
end
class B
end


# obj.instance_eval 可以定义实例方法、实例变量，或直接调用函数或代码块,并用实例调用
# 只适用于当前实例，可用于调试程序
# 如：
	a = A.new
	a.instance_eval{

		#定义方法
		def test2
			puts @var2
		end

		#定义变量
		@var2 = 88

		# 直接调用private实例方法
		test1 	# => I am test1

		#直接执行代码块,一般用于调试程序
		puts @var
	}
	a.test2

# Class.class_eval 可以定义实例方法、常量，适用于此类所有实例
# 单纯为了增加内容
	a = A.new
	A.class_eval{
		$val2 = 45
		def test2
			puts $val2
		end
		
		puts 'OK'
	}
	b = A.new
	a.test2
	b.test2

# Class.instance_eval
	A.instance_eval{
		def hi
			puts 'hi!'
		end
	}
	A.hi


# 可以传参的函数
	A.instance_exec("hellos"){|x| p "#{x}"}
	A.new.obj.instance_exec(5) { |x| puts x * @v }