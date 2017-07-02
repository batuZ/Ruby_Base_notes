# ruby_访问修饰符.rb
# 默认为public

class A
	def func1
		p '默认为 public'
	end

	def func2
		p '限定在类内可用'
	end

private	# => 作用于这里开始以下所有方法
	def func3
		p 'func3!!!'
	end

	def self.func4 # => 类方法不受限制
		p 'A.func4!!!!'
	end
	# 统一设定
private :func2
end

tests = A.new
tests.func1  # => 默认为 public
#tests.func2 # => private method `func2' called for #<A:0x007faa3a9e63a8> (NoMethodError)
#tests.func3 # =>  private method `func3' called for #<A:0x007fcb43092110> (NoMethodError)
A.func4
