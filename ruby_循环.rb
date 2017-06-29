# => ruby_循环.rb
# => 关键词：while,until,forin,loop,each
 
bool = true
i=0
j=10

p '-----------while----------'
while j>i do
	p i += 1
end 

# => until 与 while 条件相反，表达式不成立则执行，成立则退出循环
p'-----------until----------'
i=0
until j<i do
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

# => each 遍历数组、hash、对象的变量
p '------------ 集合.each ------------'
dic = {	'a' => 'aaa','b' => 'bbb','c' => 'ccc'}
dic.each{|k,v| p "#{k},#{v}" }
arr = ['x','y','z']
arr.each{|itm| p itm}

