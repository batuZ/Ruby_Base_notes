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


# 查看对象所有的方法 methods
"".methods

# 数学模块
include Math
puts Math::PI

