# => ruby_循环.rb
# => 关键词：while,until,forin,loop,each
 
bool = true
i=0
j=10

p '-----------while----------'
while j>i 
	p i += 1
end 

# => until 与 while 条件相反，表达式不成立则执行，成立则退出循环
p'-----------until----------'
i=0
until j<i 
	p i += 1
end

# => for in 类似于 foreach,用于迭代数组和hash对象
p'-----------for in----------'
for itm in 1..9			# => 用于范围
	p itm
end
dic = {	'a' => 'aaa','b' => 'bbb','c' => 'ccc'}
for itm in dic.keys		# => 用于hash
	p itm
end
arr = ['x','y','z']
for itm in arr			# => 用于数组
	p itm
end

# => loop Ruby独有的迭代器
# => loop会对代码块无限循环，直到遇到 break 跳出
p '------------ loop ------------'
loop{
	i+=1
	p i and break if i > 9999
}

# each只是遍历数组的每个元素，并不生成新的数组(即，无返回值)
p '------------ 集合.each ------------'
dic = {	'a' => 'aaa','b' => 'bbb','c' => 'ccc'}
dic.each{|k,v| p "#{k},#{v}" }

arr = ['x','y','z']
arr.each{|itm| p itm}

# map遍历数组的每个元素，返回新生成的数组
# collect作用与map完全相同
p '------------ 集合.map(collect) ------------'
def map_method
  arr1 = ["name2","class2"]

  # 这里的num是成员的copy，表达式不会影响集合
  arr2 = arr1.each {|num| num += "and"}
  p "each............",arr1,arr2

  # 这里的num是成员的copy，表达式不会影响集合,但会返回一个新的被操作过的数组
  arr2 = arr1.map {|num| num + "and"}
  p "map............",arr1,arr2
end
map_method
# => each............["name2", "class2"]
# => map............["name2and", "class2and" ]


p '------------ 集合.map!(collect!) ------------'
def map1_method
  arr1 = ["name2","class2"]
  # 这里的num就是成员本身，表达式直接修改集合,同时返回一个新的被操作过的数组
  arr2 = arr1.map! {|num| num + "and"}
  p "map............",arr1,arr2
end
map1_method

