http://www.runoob.com/ruby/ruby-intro.html  (菜鸟教程ruby)

ruby_杂记.rb

设置安装镜像
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/

坑1
gem安装的,无法在嵌入时使用..为啥.?
因为你没 require 'ruby gem'

坑2
出现 找不到 Encoding::UTF_8 怎么办?
因为你没 require 'enc/encdb'


# => ruby test.rb 会语音朗读
system "say 你是谁啊，你在哪啊"
# => 可以用来debug代码
for i in 1..10
	system "say #{i}"
end


# 数学模块
include Math
puts Math::PI


# 查看类（A）的继承或引用关系，关键词 Class.ancestors
# 结果显示顺序 A -> A中的Modul -> A的父级类(B) -> B中的Modul -> B的父级 ... Kernel -> BasicObject
# 参考资料 https://www.cnblogs.com/smallbottle/p/3876036.html
module D_M;end ;module C_M;end 
class C;include C_M;end
class D < C;include D_M;end
p C.ancestors
p D.ancestors

class C
	ConstVar = 56
	@var = 9
	@@var1
end

c = C.new
c.methods 							# 查看对象所有的方法 methods
c.methods.grep /^str/				# 查看str开头的方法
c.public_method						# 查看公开函数
c.singleton_methods					# 查看单例函数
c.protected_methods					# 查看保护函数
c.private_methods					# 查看私有函数

c.instance_variables				# 查看所有实例变量名
c.instance_variable_get :@var 		# 获取实例变量值
c.instance_variable_set :@var 3 	# 设置实例变量值

C.class_variables 					# 查看所有类变量名
C.class_variable_get :@@var1 		# 获取类变量值
C.class_variable_set :@@var1 4		# 设置类变量值

C.constants							# 查看所有常量名
C.const_get :ConstVar				# 获取常量值
C.const_set :ConstVar,85			# 设置常量值，会提示常量被修改，但不会终止程序，还可以这样？





