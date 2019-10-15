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

  def my_all?
    if block_given?
      result = true
      for i in 0..self.length - 1
        if (yield(self[i]))
          next
        else
          result = false
        end
      end
    else
      "You didn't send a block in"
    end

    puts result
  end

  def my_any?
    if block_given?
      result = false
      for i in 0..self.length - 1
        if (yield(self[i]))
          result = true
        else
          next
        end
      end
    else
      raise "You didn't send a block in"
    end
    puts result
  end

  def my_none?
    if block_given?
      result = true
      for i in 0..self.length - 1
        if (yield(self[i]))
          result = false
        else
          next
        end
      end
    else
      "You didn't send a block in"
    end

    puts result
  end
end
