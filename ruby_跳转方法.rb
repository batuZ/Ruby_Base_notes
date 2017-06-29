# => ruby_break_next_redo_return.rb

# => break 用来终止循环，while,loop,forin,each
# => 在while或loop中，如果 break后面有表达式
	#则此表达式的返回值就是当前循环的返回值
p '---------- break -----------'
arr = ['x','y','z']
arr.each{|itm|
	break if itm == 'y'
	p itm
}

# => next 跳出当次循环，进入下一次循环
p '---------- next -----------'
arr.each{|itm|
	next if itm == 'y'
	p itm
}

# => redo 与 next 一样，用来跳出当次循环
	#不同点是next在进行下次循环时会检查循环条件
	#而redo则不会，直接开始下次循环
i,j=0,10
while i<j
	redo if i == 7
	p i+=1
end

# => return 用来结束方法

