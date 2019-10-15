module Enumerable
  def my_each
    if block_given?
      for i in 0..self.length - 1
        yield(self[i])
      end
    else
      raise "You didn't send a block in"
    end
  end

  def my_each_with_index
    if block_given?
      for i in 0..self.length - 1
        yield(self[i], i)
      end
    else
      raise "You didn't send a block in"
    end
  end

  def my_select
    if block_given?
      new_arr = []
      for i in 0..self.length - 1
        if (yield(self[i]))
          new_arr.push(self[i])
        end
      end
    else
      raise "You didn't send a block in"
    end
  end
end
