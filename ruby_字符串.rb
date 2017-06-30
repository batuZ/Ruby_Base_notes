# => ruby_字符串.rb

=begin
p '---------定义字符串---------'
	# => 普通定义字符串
	str = 'ruby'
	STR = "RUBY"
	# => 多行定义
	# => 对象名 = <<任意标识
	# => 字符串
	# => 字符串
	# => 标识 完成定义
		str = <<-k	
		姓名：#{name}
		年龄：#{age}
		性别：#{sex}
		k
	p str
	

# => 转义字符
p '---------转义字符---------'

p '------ \nnn : nnn为一个八进制字符，将其转为对应的字符 ------ '					"八进制 \107 字符 "
p '------ \xnn : xnn为一个十六进制字符，将其转为对应的字符 ------ '					"十六进制 \x53 字符"
p '------ \s : 转义为空格 ------ '						"qqq\s\sqqq"
p '------ #{expr} : 转义为表达式的返回值 ------ '		"17-3 = #{17-3}"
p '-??----- \v : 转义为垂直Tab ------ '					"ggg\vggg"
p '-??----- \t : 转义为Tab ------ '						"fff\tfff"
p '-??----- \r : 转义为回车 ------ '					"sss\rssss"
p '-??----- \n : 转义为空行 ------ '					"sss\nssss"
p '-??----- \b : 转为退格 ------ '						"aa\bcc" 
p '-??----- \e : 替换为Escape对应的字符 ------ '		"aa\ebb" 
p '-??----- \cx \C-x : 替换为Ctrl+x对应的字符,x可以是任意键对应的字符 ------ '		"aa \C-x bb" 
p '-??----- \M-x : 替换为Alt+x对应的字符,x可以是任意键对应的字符 ------ '			"aa \M-x bb" 
p '-??----- \M-\C-x : 替换为Ctrl+Alt+x对应的字符,x可以是任意键对应的字符 ------ '	"aa \M-\C-x bb" 
p '-??----- \a 转为控制台铃声 ------'

 
# => 替换字符串
p '---------替换字符串--------------'
p str = 'ddd'
p str.replace('I like ruby on rails')
# => 不同于str = 'ddd',这样是新建了一个对象，原对象被销毁或不受影响
# => replace是改变了原对象，所有调用此对象的其它对象都会一起更改
=end

p '---------替换指定字符串--------------'
str = 'ruby ruby ruby'

# => 正则表达式条件替换
p str.gsub('正则条件','替换内容')

# => sub 和 gsub 替换指定字符串，用正则表达式实现
p 'sub只操作第一个匹配字符串，并返回新对象' , str+' ==> '+ str.sub('r','R')
p 'gsub会操作所有匹配的字符串，并返回新对象' , str+' ==> '+ str.gsub('r','R')
# => gsub 和 gsub!
p '不带 ‘!’ 【一定会】返回一个新对象' ,str.gsub('g','c')
p '带 ‘!’ 会修改并返回原对象', str , str.gsub!('uby','ails') , str
p '带 ‘!’ 会修改并返回原对象,如果没有修改则返回 nil', str , str.gsub!('g','c')




=begin
# => 合并字符串
p '---------合并字符串--------------'
str1 = 'I like '
str2 = 'ruby '
str3 = 'on '
str4 = 'rails'
p '--1--: '+str1+str2+str3+str4
p '--2--: '<<str1<<str2<<str3<<str4
p str2*3


# => 截取字符串
p '---------截取字符串--------------'
str = 'abcdefg'
p str[2]
p str[2,3]
p str[-3,3]
p str[2...3]
str[2,3] = 'C'	# => 截取并替换
p str


# => 字符串的常用操作
p '---------字符串的常用操作--------------'
str = ' abc dEF g '
p '首字母转为大写:'		<<str.capitalize
p '全部转为大写：'		<<str.upcase
p '全部转为小写：'		<<str.downcase
p '大转小，小转大：'	<<str.swapcase
p '去掉首尾空格：'		<<str.strip
p '去掉左边空格：'		<<str.lstrip
p '去掉右边空格：'		<<str.rstrip
p '删掉最后一个字符：'	<<str.chop.chop
p '删掉最后一个换行符'	<<str.chomp
p '反转字符串：'		<<str.reverse
p '更多方法：http://www.runoob.com/ruby/ruby-string.html'

# => 字符编码
p '---------修改字符编码--------------'
$KCODE = 'u' # => UTF-8
$KCODE = 'n' # => None （与 ASCII 相同）。
$KCODE = 'e' # => EUC
$KCODE = 'a' # => ASCII 默认

=end