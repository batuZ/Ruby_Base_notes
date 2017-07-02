# Ruby__结构体.rb
# 快速创建结构类，实例化对象性能最优，推荐

# 定义结构类型
Person = Struct.new :Name,:Age,:Sex

#实例化
 xm = Person.new 'xiaoming',19,'man' 
 dl = Person.new 'dali',21,'man'

p xm.Name
p dl.Name



# 可动态扩展的结构体 , 性能差 ， 可扩展性强
require 'ostruct'

testA = OpenStruct.new(doub: 3.12)
testA.str = 'aaaa'
p testA.doub
p testA.str