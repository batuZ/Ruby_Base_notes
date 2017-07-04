# Ruby__加载外部代码文件.rb

p "------- load 'other.rb' -------- ",
"只能加载 .rb 文件，相当于单纯的把 other 里的代码copy进来",
"每次加载都会执行"

p "-------- require 'path/other.rb'--------",
"-------- require 'other.c' --------",
"require 除rb还可以加载.c",
"只会加载一次！"

p " -------- include 'moduleName'--------",
"加载一个模块，如果在类中加载，模块中的方法会成为此类的 实例方法"

p " -------- extend 'moduleName' --------",
"在类中加载一个模块，使模块中的方法成为此类的 类方法"
