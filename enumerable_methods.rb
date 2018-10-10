module Enumerable
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_each_with_index
    for i in 0..self.length - 1
      yield self[i], i
    end
    self
  end

  def my_select
    arr = []
    for i in 0..self.length - 1
      if yield self[i]
        arr.push(self[i])
      end
    end
    arr
  end

  def my_all?
    result = true
    for i in 0..self.length - 1
      unless yield self[i]
        result = false
        break
      end
    end
    result
  end

  def my_none?
    result = true
    for i in 0..self.length - 1
      if yield self[i]
        result = false
        break
      end
    end
    result
  end

  def my_count
    count = 0
    unless block_given?
      return count = self.length
    end
    for i in 0..self.length - 1
      if yield self[i]
        count += 1
      end
    end
    count
  end

  def my_map(proc = nil)
    arr = []
    for i in 0..self.length - 1
      if proc
        arr.push(proc.call self[i])
      else
        arr.push(yield self[i])
      end
    end
    arr
  end

  def my_inject(memo = nil)
    memo = self[0] unless memo
    for i in 1..self.length - 1
      val = self[i]
      memo = yield memo, val
    end
    memo
  end
end

def multiply_els(arr)
  arr.my_inject { |memo, val| memo * val }
end

test_proc = Proc.new { |x| x ** 3 }

p [1,2,3].my_each { |x| x + 1 }
p ["first", "second", "third"].my_each_with_index { |elem, i| "#{i}: #{elem}" }
p [1,2,3,4,5].my_select { |x| x.even? }
p [1,2,3,4,5].my_all? { |x| x.even? }
p [1,2,3,4,5].my_none? { |x| x.even? }
p [1,2,3,4,5].my_count { |x| x.even? }
p [1,2,3,4,5].my_map { |x| x ** 2 }
p [1,2,3,4,5].my_map(&test_proc)
p [1,2,3,4,5].my_inject { |memo, val| memo * val }
p multiply_els([2,4,5])
