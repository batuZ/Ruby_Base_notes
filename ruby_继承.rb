# ruby_继承.rb

class Person
	attr_accessor :Name ,:Age
	def initialize name,age
		@Name = name
		@Age = age
	end
	def perSan
		p 'i am person'
	end
end
per = Person.new 'batu',33
p per.Name 	# => "batu"
p per.Age 	# => 33
per.perSan

class Women < Person
	attr_accessor :Sex
	def initialize sup1,sup2,sex
		# 先用super参数调用父类构造方法
		super sup1,sup2
		@Sex = sex
	end
	
	def perSan
		p '这里重写了父类的方法'
	end
end

wm = Women.new 'grace',40,'women'
p '-------- 子类调用 -----------'
p wm.Name
p wm.Age
p wm.Sex
wm.perSan
