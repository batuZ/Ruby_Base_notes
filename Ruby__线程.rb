# Ruby__线程.rb

p '-------- 创建并执行一个新的线程任务 --------'
thread01 = Thread.new{p "thread01"}
thread02 = Thread.start{p "thread02"}

p '-------- 带参数的线程任务 --------'
str = 'batu'
thread033 = Thread.new(str){|s| 
	p s + "thread03"
}
thread04 = Thread.start str do |s| 
	p s + "thread04"
end

p "---------- 线程实例 ------------"
p thread04.to_s		# => "#<Thread:0x0000000297e3a0>"	线程实例
p Thread.current	# => #<Thread:0x00000000397510 run>	正在运行的线程实例

p "--------- 把线程加入到主线程执行 join value--------------"
thread04.join 	# => 目标是让thread04开始执行，完成后主线程继续工作
thread04.value	# => 目标是要获取thread04的值，所以必须开始执行，完成后主线程继续工作

p '-------- 将控制权显式地交给其他可运行的线程 pass --------'
Thread.new{	Thread.pass}
Thread.new {p 'ffffff'}

p '-------- 终止当前运行的线程对象 exit --------'
Thread.exit
p '-------- 终止指定线程的运行 kill --------'
Thread.kill thread04
p '-------- 暂停当前线程3秒 sleep --------'
Thread.sleep 3
p '-------- 获取线程状态 status --------'


# Mutex 安全保护
# Mutex是mutual-exclusion lock（互斥锁）的简称。若对Mutex加锁时发现已经处于锁定状态时，线程会挂起直到解锁为止。
# 在并行访问中保护共享数据时，可以使用下列代码（m是Mutex的实例）。
begin
   m.lock
   # 访问受m保护的共享数据
ensure
   m.unlock
end
# Mutex有个synchronize方法可以简化这一过程。
m.synchronize {
   # 访问受m保护的共享数据
}