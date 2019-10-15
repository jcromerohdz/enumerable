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
