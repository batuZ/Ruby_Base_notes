# => Hash容器，由键值对成员构成，就是c#的字典
# => 定义 dic : "Key" => "Value" ,成员间用 ‘,’ 逗号隔开
# => key 唯一
# => hash 与 二维数组可以自由转换


dic = {

	"A" => "aaa",
	"B" => 32,
	"C" => 4.54,
	:D => "fdfdf"
}

p dic["A"]
p dic["B"]
p dic["C"]

p  '----- dic的方法 -----'

# => dic中的成员数量
p "dic.size() => #{dic.size()}"
p "dic.length() => #{dic.length()}"

# => dic中是否包含指定的 Key
p dic.include?("A")
p dic.has_key?("C")

# => 增加和修改成员
p dic["F"] = "fffff"
p dic["C"] = 3.14

# => 删掉dic中指定的成员
p dic.delete("F")

#返回dic中所有 key 或 value ，返回类型为数组
p dic.keys().class
p dic.values().size()

# => 遍历dic
p "---------dic.each-------------"
dic.each{|k,v| p "#{k} : #{v}"}
p "---------dic.each_pair-------------"
dic.each_pair{|k,v| p "#{k} : #{v}"}
p "---------dic.each_key-----------"
dic.each_key{|k| p k}
p "---------dic.each_value-------------"
dic.each_value{|v| p v}