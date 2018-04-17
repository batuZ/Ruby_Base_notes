class A
	Cre  =789
	def initialize
		@var = 4
	end
end
#     instance_eval


# ------------- 实例变量 O-----------------------
	# a = A.new
	# a.instance_eval do
	#     def hello
	#         puts @var
	#     end
	# end
	# a.hello
# ------------- 实例变量 O-----------------------
	# A.class_eval do
	#     def hello
	#          puts @var
	#     end
	# end
	# A.new.hello
# ------------- 类变量 -----------------------
A.instance_eval do
    def hello
	    puts "aaa"
    end
    puts "bbbb"
end
puts A.hello

# ------------- 类变量 -----------------------
# A.singleton_class.class_eval do
#     def hello
#         p "hello"
#     end
# end
# A.hello




 # A.instance_exec("hellos"){|x| p "#{x}"}



# 五，instance_eval()和instance_exec() 
# 在Ruby中，
# 提供了一个非常酷的特性，可以通过使用Objec#instance_eval()， 
# Objec#instance_exec()方法插入一个代码块，做一个的对象上下文探针（Context Proble），
# 深入到对象中的代码片段，对其进行操作。有了这个特性以后，就可以很轻松的测试对象的行为，查看对象的当前状态。

# class MyClass 
# 	def initialize 
# 		@v = 1; 
# 	end
# end

# obj = MyClass.new
# obj.instance_eval do
# 	puts self	# => #<MyClass:0x007fbb2d0299b0> 
# 	puts @v 	# => 1 
# end

# obj.instance_exec(5) { |x| puts x * @v }
# => 5 	

# => https://blog.csdn.net/xluren/article/details/43964433
# => https://blog.csdn.net/baodongdong123/article/details/75206846
# => https://blog.csdn.net/sunset108/article/details/48136571
