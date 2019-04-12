# 元编程 基础方法整理

### 来自Ruby China https://ruby-china.org/topics/25691

### eval
eval是Object中的private方法。但是你可以通过发送名称到public方法的方式更改它的visibility。
```ruby
class Object
  public :eval
end
print( "Enter the name of a string method (e.g. reverse or upcase): " )
# user enters: upcase
methodName = gets().chomp()
exp2 = "'Hello world'."<< methodName
puts( eval( exp2 ) ) #=> HELLO WORLD
puts( "#{exp2}" ) #=> "Hello world".upcase
puts( "#{eval(exp2)}" ) #=> HELLO WORLD
```
eval可以evaluate多行字符串，使能够执行字符串中的整个程序。
```ruby
eval( 'def aMethod( x )
    return( x * 2 )
  end
  num = 100
  puts( "这是计算后的结果:" )
  puts( aMethod( num ))' )
```

### instance_eval
instance_eval可以被具体的对象调用，提供了对该对象实例变量的访问。
```ruby
class MyClass
  def initialize
    @aVar = "Hello world"
  end
end
ob = MyClass.new
p( ob.instance_eval { @aVar } ) #=> "Hello world"
p( ob.instance_eval( "@aVar" ) ) #=> "Hello world"
p( ob.eval( "@aVar" ) ) # 错误，你需要更改eval方法为public
```

### class_eval(module_eval)
功能跟instance_eval类似，但是它是执行在class或module中，它们俩可以互换着使用
```ruby
module X
end
class Y
  @@x = 10
  include X
end
X::module_eval{ define_method(:xyz){ puts("hello" ) } }  # 在模块中定义xyz方法
Y::class_eval{ define_method(:abc){ puts("hello, hello" ) } } # 在类中定义abc方法
y = Y.new # 现在Y有abc和xyz方法
```

## 操作变量
### 类变量
```ruby
class_variable_set( aSymbol, aValue )
class_variable_get( aSymbol )
class_variables # return class variable array
```

### 实例变量
```ruby
instance_variable_set( aSymbol, aValue )
instance_variable_get( aSymbol )
```

### 常量
```ruby
const_set( aSymbol, aValue )
const_get( aSymbol )
constants
```

### 动态创建实例
```ruby
class X
  def y
    puts( "ymethod" )
  end
end
print( "请输入类名: ") #输入: X
cname = gets().chomp
ob = Object.const_get(cname).new #执行 X.new 方法
p( ob )
print( "请输入要执行的方法: " ) #<= 输入: y
mname = gets().chomp
ob.method(mname).call
```

### BINDINGS
eval方法有一个可选的 binding参数，如果提供的话，将会在指定的上下文执行evaluation。类似于JS中的apply，call方法的第一个参数。
```ruby
def getBinding(str)
  return binding()
end
str = "hello"
puts( eval( "str + ' Fred'" ) ) #没指定Binding，因此str为当前环境下的str变量。=> "hello Fred"
puts( eval( "str + ' Fred'", getBinding("bye") ) ) #指定了Binding，因此在getBinding上下文中寻找str变量。=> "bye Fred"

class MyClass
  @@x = " x"
  def initialize(s)
    @mystr = s
  end
  def getBinding
    return binding()
  end
end
class MyOtherClass
  @@x = " y"
  def initialize(s)
    @mystr = s
  end
  def getBinding
    return binding()
  end
end
@mystr = self.inspect
#@@x = " some other value"  注意加这句后的区别。
ob1 = MyClass.new("ob1 string")
ob2 = MyClass.new("ob2 string")
ob3 = MyOtherClass.new("ob3 string")
puts(eval("@mystr << @@x", ob1.getBinding)) #=> ob1 string x
puts(eval("@mystr << @@x", ob2.getBinding)) #=> ob2 string x
puts(eval("@mystr << @@x", ob3.getBinding)) #=> ob3 string y
```

### send
可以通过使用send方法，调用指定:symbol名称的方法。
```ruby
class MyString < String
  def initialize( aStr )
    super aStr
  end
  def show
    puts self
  end
  def rev
    puts self.reverse
  end
end
print("输入你的名字: ") #<= 输入: Fred
name = MyString.new( gets() )
print("输入方法名: " ) #<= 输入: rev
methodname = gets().chomp.to_sym
puts( name.send(methodname) ) #=> derF
```

### 动态创建/删除方法
```ruby
#创建方法
def addMethod( m, &block )
  self.class.send( :define_method, m , &block )
end
#删除方法
class String
  remove_method( :reverse )
end
```
如果同样的名称的方法在祖先类中已定义，则祖先类中的方法不会被删除。
```ruby
class Y
  def somemethod
    puts("Y的方法")
  end
end
class Z < Y
  def somemethod
    puts("Z的方法")
  end
end
zob = Z.new
zob.somemethod #=> “Z的方法”
class Z
  remove_method( :somemethod )
end
zob.somemethod #=> “Y的方法”
```

### undef_method
防止调用某方法，不管该方法是否已被定义。
```ruby
zob = Z.new
zob.somemethod #=> “Z的方法”
class Z
  undef_method( :somemethod )
end
zob.somemethod #=> "undefined method‟ error
```
### method_missing
捕捉不存在的方法
```ruby
def method_missing( methodname )
 puts( "Sorry, #{methodname} does not exist" )
end
xxx #=> Sorry, xxx does not exist
```
