# Ruby__模块.rb
# 1､ 程序顶层（main）就是个模块
# 2､ 引入main的模块和类，会按顺序引入方法，并执行可执行内容
# 3､ 作为命名空间使用，隔离同命方法和变量
# 4､ 作为静态库或静态类使用，不能被实例化，可以同时引入多个模块
# 5､ 与类的共同点：首字母大写，定义类、模块、成员变量和方法，可以受访问修饰符限制
# 6､ 使用模块中的方法要先把模块引入, include moduleName
# 7､ 类引插入模块的两种形式：（模块中的方法不变，插入关键字不同，用法不同）
	# (1) include 模块中的方法成为类的实例方法，需要new后调用
	# (2) extend  模块中的方法成为类方法，可以直接class.fuc调用
p '------- 嵌套模块的使用 ----------'
module Test
	def fuc
		p 'kkkl'
	end
end

module Asss
	include Test
	def getfuc
		Test.fuc
	end
end

include Asss
Asss.getfuc
Asss.fuc

