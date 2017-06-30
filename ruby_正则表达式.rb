# => ruby_正则表达式.rb

# => match 和 =~
str = 'I like ruby'
# => match 匹配成功返回对应的字符串，不成功返回nil
p /ke/.match(str).to_s
# => =~ 匹配成功返对应回字符在str中的位置，不成功 nil
p str =~ /ke/
# => 可以通过 $1..$n的全局变量访问匹配结果


# => sub 和 gsub 及它们的替代变量 sub! 和 gsub! 是使用正则表达式时重要的字符串方法。
