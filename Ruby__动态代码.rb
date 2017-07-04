# Ruby__动态代码.rb
# eval string 
# 预先不知道将要执行什么代码，代码是在执行过程中动态输入的
# 将输入的字符串转为代码并执行
# 效率低，不建议频繁使用

str = [
	"p 'this is a inPutCode'",
	"p 'aaa'",
	"p 'bbb'"
]
str.each{|v| eval v}  