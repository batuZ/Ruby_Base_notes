#ruby_类型转换.rb

=begin
to_s	转为字符串
to_i	转为正数
to_f	转为小数
to_a	转为数组
to_time	转为时间
to_date	转为日期
=end

p 3.14.to_s.class
p '16'.to_i.class
p '3.14'.to_f.class
p (3..5).to_a.class

# => 变量转为符号对象
# => 符号对象是一个字符串，一个方法，一个类或者一个标识符的内部表现形式，
# => 创建符号对象就在对象名前面加上一个冒号":"就可以了;
# => 字符串和符号对象可以通过to_s和to_sym来相互转化
p '-----------变量转为符号对象-----------'
str = "ruby"
str1 = :"ruby"
p str.to_sym
p str1.to_s