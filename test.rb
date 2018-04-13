

def showItems(agr1,agr2,hah)
	puts "#{agr1} : #{agr2}"
	hah.each{|k,v| puts "#{k},#{v}"}
end
showItems 'newItemName',56,:b => 3
# => newItemName : 56
# => b,4