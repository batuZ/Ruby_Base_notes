# => ruby_IF.rb

bool = true
# => 1、单IF
if bool
	p "1、单IF"
end

# => 2、if..else
if !bool
	p "2、if..else a"
	elsif bool
		p "2、if..else b"
		else
			p "2、if..else c"
end

# => 3、IF 修饰
p '如果后面为true,则执行' if bool

# => unless 与 if 相反，条件为false则执行
# => unless 没有 elsif 分支，不常用，仅做了解
p '如果后面为false,则执行' unless !bool
