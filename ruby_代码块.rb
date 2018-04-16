# ruby_代码块.rb


p '-------------- yield 常用方法---------------------'
# 1，所有的函数，都（隐式）默认带有一个代码块参数（def foo &yield）
# 2, 如果使用这个参数，在调用函数时，必须指定一个代码块，就是proc

def foo
	puts 'a'
	yield 'b'
	puts 'c'
end

foo {|i|put i}

# 逻辑顺序：
	 -> 定义 foo 函数,指定yield出现位置及所带参数
	 -> 调用foo，同时定义代码块 => 定接收参数的替身 i , 定义操作内容 {|i|put i}
	 -> 执行 foo 函数
	 		-> puts 'a'
	 		-> yield 'b' => {|i|put i} => i 是yield参数的替身
	 		-> puts 'c'

# 3, 可以把函数内的变量传进块,用替身接收，但替身的值不影响函数中的变量
# 4，yield 可以和函数一样带返回值
def foo1(g)
	puts g
	puts yield g if block_given? # => if block_given? 保护措施
	puts g
end

# 5, 调用带yield的函数时，参数要()起来
foo1(5){|g| g+3}


# 用例：
# 为了方法能够根据环境，追加的一段可以有参有返的代码
# 方法中的某部份未确定，用yield占位传参，后续补充到代码块中
# 作为回调方法 callback
# 当方法执行到块变量时会停下来，先去执行代码块的内容
# 当实现目的不同，但代码内容只有很小差别时，可以用代码块解决重复问题
# 在Ruby中，代码块不仅可用于循环，还可用于延迟执行，即代码块中的行为只有等到调用相关的yield时才会执行。
# 代码块充斥于Ruby的各种库，小到文件的每一行，大到在集合上进行各种复杂操作，都是由代码块来完成的。
# yield不是函数调用，效率比调函数快一倍左右


def f1 
	yield('F',55) if block_given? # block_given? 块内是否包含内容
end
# 调用 f1 后面带有代码块
f1{|d,ii| p 'D'+d+ii.to_s}
#=> "DF55"







# block 是有形无实的计算过（yield，Block）
# Proc把block实体化，使其可以当作参数进行传递，运行时，还是要把Proc实例转为计算过程执行计算
# lambda是基于proc演化来的
# 用block，用lambda，不要用proc，让proc做好自己的幕后工作就好了。

p '-------------- Block 常用方法--------------------'
#  &p 是block, p 是proc，不到万不得已的情况下不要显式地创建proc，
# 每当我对block和proc之间的关系犯糊涂时，我就会念上几句
# 在使用block时，我会忽略proc的存在，我将proc定位为一个幕后的工作者。

def f2(&p) 	# &p 就是一个代码块
  p.call(5,6) if block_given? # block_given? 块内是否包含内容
end
# 调用 f2 后面带有代码块
f2{|x,y| p "f2 "<<(x+y).to_s}
# => "f2"


p '-------------- Proc ---------------------'
# block无法单独存在，必须挂在方法后面，
# 并且你没有办法直接把它存到变量里，
# 也没有办法直接将它作为参数传递给方法，
# 所以当你想存储，传递block时，你可以使用proc对象

def f3(p) # p 是一个proc对象
  p.call
end

# 调用 f3 带代码块变为参数(无代码块)
f3(proc{p "f31 "})
f3(Proc.new{p "f32"})


p '-------------- lambda ---------------------'
f3(lambda{p "f3_lambda"})
f3(-> {p "f3 -> "})



# &会触发 :to_i 的 to_proc 方法,  to_proc 执行后会返回一个 proc 实例
# 然后&会把这个 proc 实例转换成一个block , &:to_i 是一个block
p ('1'..'9').map(&:to_i) # == ('1'..'9').map(|g| g.to_i) 
# => [1, 2, 3, 4, 5, 6, 7, 8, 9] array


# 参考资料
# http://www.jb51.net/article/62697.htm