http://www.runoob.com/ruby/ruby-intro.html  (菜鸟教程ruby)

ruby_杂记.rb

设置安装镜像
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/

坑1
gem安装的,无法在嵌入时使用..为啥.?
因为你没 require 'ruby gem'

坑2
出现 找不到 Encoding::UTF_8 怎么办?
因为你没 require 'enc/encdb'


关于GEM
ruby -v #查看ruby 版本
gem -v #gem版本
gem update #更新所有包
gem update --system #更新RubyGems软件
gem install rake #安装rake,从本地或远程服务器
gem install rake --remote #安装rake,从远程服务器
gem install watir -v(或者--version) 1.6.2#指定安装版本的
gem uninstall rake #卸载rake包
gem list  #列出本地包
gem list d #列出本地以d打头的包
gem query -n ''[0-9]'' --local #查找本地含有数字的包
gem search log --both #从本地和远程服务器上查找含有log字符串的包
gem search log --remoter #只从远程服务器上查找含有log字符串的包
gem search -r log #只从远程服务器上查找含有log字符串的包
gem help #提醒式的帮助
gem help install #列出install命令 帮助
gem help examples #列出gem命令使用一些例子
gem build rake.gemspec #把rake.gemspec编译成rake.gem
gem check -v pkg/rake-0.4.0.gem #检测rake是否有效
gem cleanup #清除所有包旧版本，保留最新版本
gem contents rake #显示rake包中所包含的文件
gem dependency rails -v 0.10.1 #列出与rails相互依赖的包
gem environment #查看gem的环境
gem sources #查看镜像


# => ruby test.rb 会语音朗读
system "say 你是谁啊，你在哪啊"
# => 可以用来debug代码
for i in 1..10
	system "say #{i}"
end


# 数学模块
include Math
puts Math::PI




# 查看类（A）的继承或引用关系，关键词 Class.ancestors
# 结果显示顺序 A -> A中的Modul -> A的父级类(B) -> B中的Modul -> B的父级 ... Kernel -> BasicObject
# 参考资料 https://www.cnblogs.com/smallbottle/p/3876036.html
module D_M;end ;module C_M;end 
class C;include C_M;end
class D < C;include D_M;end
p C.ancestors
p D.ancestors

class C
	ConstVar = 56
	@var = 9
	@@var1
end

c = C.new
c.methods 							# 查看对象所有的方法 methods
c.methods.grep /^str/				# 查看str开头的方法
c.public_method						# 查看公开函数
c.singleton_methods					# 查看单例函数
c.protected_methods					# 查看保护函数
c.private_methods					# 查看私有函数

c.instance_variables				# 查看所有实例变量名
c.instance_variable_get :@var 		# 获取实例变量值
c.instance_variable_set :@var 3 	# 设置实例变量值

C.class_variables 					# 查看所有类变量名
C.class_variable_get :@@var1 		# 获取类变量值
C.class_variable_set :@@var1 4		# 设置类变量值

C.constants							# 查看所有常量名
C.const_get :ConstVar				# 获取常量值
C.const_set :ConstVar,85			# 设置常量值，会提示常量被修改，但不会终止程序，还可以这样？