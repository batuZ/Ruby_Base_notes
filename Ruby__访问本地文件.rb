# Ruby__访问本地文件.rb
# encoding: uft-8

p '------------------- 打开关闭文件 -------------------------------'
path = 'C:\VRayLog.txt'

# 实例化文件对象
file = File.new(path,'r')
p file.size
file.close	# 手动关闭文件

# File类方法打开，end时释放 ， 与new不同，open提供了一个对文件操作的代码块
File.open(path) do |f|
	p f.size
end

# 直接用open方法打开，}时释放
open(path){|f|
	p f.size
}

p '------------------- 操作文件指针 -------------------------------'
if File.exist?path
	f = File.open(path,'r') 
	p f.pos			, 'f.pos 		获取文件指针的位置'
	p f.pos = 9		, 'f.pos = 9 	设置文件指针的位置'
	p f.lineno		, 'f.lineno 	获取文件指针所在行'
	p f.lineno = 8	, 'f.lineno = 8 设置文件指针的在行'
	p f.rewind		, 'f.rewind 	使文件指针放置到开始位置'
end

p '------------------- 读取文件内容 -------------------------------'
path = 'C:\OSGBProcessTool_2016-10-17_info.log_v0'
# read
if File.exist?path
	f = File.open(path,'r') 

	# 读取5个字符,并把指针指向第6个字符
	 p text1 = f.read(5)		

	# 把全部内容读进内存
	# p f.read	

	# 读取1个字符,并把指针指向下一个字符
	# 5.times{puts f.readchar }

	# readline 读取1行,并把指针指向下一行，最后一行会报错
	# gets 读取1行,并把指针指向下一行，最后一行会返回nil
	# p f.readline
	# p f.gets

	# readlines 把所有行读进数组
	# p f.readlines

	# 文件对象迭代器
	# f.rewind
	# f.each_line{|line| p line}

	# 按字节读入文件
	# f.rewind
	# f.each_byte{|byte| p byte}

	f.close
end

# 用IO类方法遍历文件，成员为行
# 没有文件实例，不是打开文件，也不用关闭
# IO.foreach(path){|line|	p line}

p '------------------- 向文件写入内容 -------------------------------'

# 需要用 w w+ a a+ 模式打开文件
# print 方法：将一行或多行字符串写入文件，并且不换行，可以用$\来换行
# puts 方法：将一行或多行字符串写入文件，每次写完自动换行
# putc 方法：将一个字符写入文件，整数将转为字符写入
# write 方法： 将一行字符串写入文件

path = 'C:\test.txt'
# 'w' 为重写文件，'a' 为追加内容
File.open(path,'w'){|f|
	$\ = "\n" 			# 设置换行符,每次print完成后插入一次
	f.print 'AAAAA'
	f.print 'bbbbb'
	f.puts 'CCCCC'		# puts自动换行
	f.puts 'ddddd'
	f.putc 'e'			# 每次putc塞入一个字符
	f.putc 'g'
	f.putc "\n"
	('a'..'g').each{|c| f.putc c}
}

path = 'C:\Windows\notepad.exe'

p '------------------- 文件大小 -------------------------------'
# 类方法
p File.size path 	# 返回文件大小，文件不存在会报错
p File.size? path	# 返回文件大小，文件不存在返回nil
p File.zero? path 	# 文件大小是否为0，为0返回true，不为0或不存在返回false
# 实例方法
tt = File.new path
p tt.size

p '------------------- 文件时间 -------------------------------'
p File.ctime path 	#create Time 创建时间
p File.mtime path 	#最后修改时间
p File.atime path	#最后访问时间

p '------------------- 文件重命名 -------------------------------'
# File.rename('原文件名','新文件名')

p '------------------- 文件重命名 -------------------------------'
# File.delete(path)
# File.unlink(path)
# 完全相同的方法，删除成功回已删除的文件个数，删除失败报错

p '------------------- 定位当前文件所在目录 -------------------------------'
p '当前文件在 ' << Dir.pwd
p '当前文件在 ' << Dir.getwd # 又是完全相同的功能