# Ruby__Begin块End块.rb
# BEGIN 在当前文件执行前执行，END在当前文件全部结束后执行
# 一般用于注册 和 释放，也称前置通知 和 后置通知
# at_exit是决对最后执行的块，在比END块还靠后
# 程序中可以有多个BENIN/END块，按加载顺序执行BEGIN,从后向前执行END块
# BEGIN\END块不可以定义在方法或表达式中

END{ p 'END003'}
END{ p 'END002'}
END{ p 'END001'}
BEGIN{ p 'BEGIN001'}
BEGIN{ p 'BEGIN002'}
BEGIN{ p 'BEGIN003'}