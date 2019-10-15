# frozen_string_literal: true
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

puts "---------"
puts "my_count"
arr = [1, 2, 3, 4, 5, 6, 7, 87, 33, 3]
run1 = arr.my_count do |val|
  val < 20 #returns 8 for the given set
end

puts "---------"
puts "my_map"
arr = [1, 4, 16, 25, 36, 49]
run1 = arr.my_map do |val|
  val * 2 #doubles each value
end

run2 = arr.my_map

puts run1
puts run2

puts "---------"
puts "my_inject"
puts "calling multiply_els"

def multiply_els(arr)
  arr.my_inject(:*)
end

puts multiply_els([2, 4, 5])
puts "---------"
puts "startVal with symbol"
a = [2, 4, 5].my_inject(5, :*)
puts a
puts "---------"
puts "only block"
a = [5, 6, 7, 8, 9, 10].my_inject { |i, j| i + j }
puts a
puts "---------"
puts "startVal with block"
a = [5, 6, 7, 8, 9, 10].my_inject(5) { |i, j| i + j }
puts a
