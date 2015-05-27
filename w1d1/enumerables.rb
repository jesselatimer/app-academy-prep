# Doubling array values
def double_array(array)
  array.map { |x| x * 2 }
end

puts double_array([1, 2, 3, 4]).to_s

# my_each method
class Array
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

puts return_value.to_s

# Median
def median(ints)
  if ints.count % 2 == 0
    return (ints.sort[ints.count / 2] + ints.sort[(ints.count / 2) - 1]) / 2.0
  else
    return ints.sort[ints.count / 2]
  end
end

puts median([8, 7, 6, 5, 4, 3, 2, 1])
puts median([8, 7, 6, 5, 9, 4, 3, 2, 1])

# Concatenate strings
def concatenate(words)
  words.inject("") { |sentence, word| sentence += word }
end

puts concatenate(["Yay ", "for ", "strings!"])
