# Ruby__处理类模块中不存在的方法.rb

p '------------ module -----------------'
module Mod
	def modFuc1
		p 'modFuc1'
	end
	# 定义一个处理模块中【不存在的函数】的方法
	def method_missing s
		p "not def #{s}"
	end
end
include Mod
modFuc1()
modfuc2()
p '------------ Class -----------------'
class Cls
	def clsFuc1
		p "clsFuc1"
	end
	# 定义一个处理类中【不存在的实例函数】的方法
	def method_missing s
		p "not def #{s}"
	end
	# 定义一个处理类中【不存在的类函数】的方法
	def self.method_missing s
		p "not self.def #{s}"
	end
end

ent = Cls.new
ent.clsFuc1
ent.clsFuc2
Cls.clsFuc2