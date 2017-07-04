# Ruby__异常.rb

# 常见的异常:
	# RunntimeError		由raise抛出的默认异常
	# NoMethodError		没有找到方法，或调用了一个不存在的方法
	# NameError			运行了一个不能解析的变量名或方法名
	# IOError			读取已关闭的流，向只读文件写入操作时
	# Error::error 		与IOError相关的一组异常
	# TypeError			为方法传入了不能处理的类时
	# ArgumentError		传参数量不正确时

p "--------标准用法--------"
begin
	
	p 43/0					# 未出现异常执行的目标代码
	p '目标代码'
rescue Exception => e 		# 异常对象
	p '除数不能为0'			# 出现异常执行的处理代码
	p e						# 异常信息
	p $!					# 全局变量，最近一次的异常信息 同 e
	p e.backtrace 			# 定位异常
	p $@					# 全局变量，定位异常 同 e.backtrace
	# retry					# 跳到begin重新执行,慎用,可能会造成死循环
else						# 当目标代码完成后，没有进入异常则进入else
	p '没有发生异常'		
ensure						# 不论是否异常最后都要执行 (c# finally)
 	p 'end！！'
end

p "--------手动抛自定义异常--------"

begin  
    puts 'I am before the raise.'  
    ff
    raise 'An error has occurred.' if 1>4
    puts 'I am after the raise.'  
rescue  
    puts 'I am rescued.'  
end  
puts 'I am after the begin block.'
# => I am before the raise.
# => I am rescued.
# => I am after the begin block.