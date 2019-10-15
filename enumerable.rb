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

  def my_count(val = "NoNArG")
    count = 0
    if block_given?
      for i in 0..self.length - 1
        if (yield(self[i]))
          count += 1
        else
          next
        end
      end
    elsif (val != "NoNArG")
      for i in 0..self.length - 1
        if (self[i] == val)
          count += 1
        end
      end
    else
      count = self.length
    end
    puts count
    return count
  end

  def my_map
    #code goes here
    if block_given?
      result = []
      for i in 0..self.length - 1
        result.push(yield(self[i]))
      end
    else
      result = self
    end

    return result
  end

  def my_inject(startVal = nil, symbol = nil)
    #if a block is given
    if block_given?
      #startVal is given
      if startVal != nil
        result = startVal
        self.my_each do |element|
          result = yield(result, element)
        end
        return result
        #no startVal is given
      else
        result = self[0]
        self.shift
        self.my_each do |element|
          result = yield(result, element)
        end
        return result
      end
      #if there is no block
    else
      #both params are given
      if startVal != nil && symbol != nil
        result = startVal
        self.my_each do |element|
          result = result.send(symbol, element) #had to look the send method up, pretty neat though
        end
        return result
        #only startVal is given which will be a symbol referring to a proc
      elsif startVal != nil && symbol == nil
        result = self[0]
        self.shift
        self.my_each do |element|
          result = result.send(startVal, element)
        end
        return result
      else
        raise "You didn't provide the correct parameters"
      end
    end
  end
end
