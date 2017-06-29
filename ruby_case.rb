# => ruby_case.rb

# => num 在传入case前只计算一次
# => if 中每次判断都会计算一次

num = 0

case num

when 0				# => 可预测部份
	p '这个数是0'
when 1,2,3			# => 多个when所要执行的代码相同时，可以组合条件
	p '这个数是1,2,3其中一个'
when 5..10
	p '这个数在5到10之间'

else				# => 不可预测部份
	p "不在选项中"
end
