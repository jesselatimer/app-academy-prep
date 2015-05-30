def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(nums)
  return 0 if nums.empty?
  nums.inject { |sum, num| sum += num }
end

def multiply(nums)
  return 0 if nums.empty?
  nums.inject { |sum, num| sum *= num }
end

def power(num1, num2)
  num1 ** num2
end

def factorial(num)
  return 1 if num == 0
  num * factorial(num - 1)
end
