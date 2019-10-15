require "./enumerable"
include Enumerable

puts "---------"
puts "my_each"
arr = [1, 2, 3, 4, 5, 6]
arr.my_each do |num|
  puts num + 2 #prints out add 2 to the element
end

puts "---------"
puts "my_each_with_index"
arr = ["John", "Christian", "Flover", "Gerald"]
arr.my_each_with_index do |name, inx_val|
  puts "String: #{name}, Index: #{inx_val}"
  #prints out each element with index
end

puts "---------"
puts "my_select"
arr = [2.2, 3.4, 5.5, 2.9, 2.2]
arr.my_select do |num|
  if num.to_f > 3.3 #selects arr[1], arr[2]
    puts num
  end
end

puts "---------"
puts "my_all"
arr = ["Miranda", "Monica", "Mirna", "Michell"]
arr.my_all? do |name|
  name[0] == "M" #returns true for the given set
end

puts "---------"
puts "my_any"
arr = ["Christian", "Victoria", "Scalett", "Daniel", "Willard"]
arr.my_any? do |name|
  name.match(/Vi/) #returns true for the given set
end

puts "---------"
puts "my_none"
arr = ["Christian", "Victoria", "Scalett", "Daniel", "Willard"]
arr.my_none? do |name|
  puts name.match(/zzz/) #returns true for the given set
end
