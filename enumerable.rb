# frozen_string_literal: true

module Enumerable
  def my_each
    index = 0
    while index < self.count
      yield(self[index])
      index += 1
    end
  end

  def my_each_with_index
    index = 0
    while index < self.count
      yield(self[index], index)
      index += 1
    end
  end

  def my_select
    my_list = []
    self.my_each { |element| my_list << element if yield(element) }
    my_list
  end

  def my_all?
    result = true
    self.my_each { |element| result = false unless yield(element) }
    result
  end

  def my_any?
    result = false
    self.my_each { |element| result = true if yield(element) }
    result
  end

  def my_none?
    result = true
    self.my_each { |element| result = false if yield(element) }
    result
  end

  def my_count
    total = 0
    self.my_each { total += 1 }
    total
  end

  def my_map(my_proc = nil)
    result = []
    unless my_proc == nil
      self.my_each { |element| result << (my_proc.call element) }
    else
      self.my_each { |element| result << yield(element) }
    end
    result
  end

  def my_inject(start_value)
    self.my_each { |element| start_value = yield(start_value, element) }
    start_value
  end
end
