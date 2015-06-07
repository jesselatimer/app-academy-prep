def factor(num)
  factors = []
  (1..num).to_a.each do |el|
    factors << el if num % el == 0
  end
  factors
end

p factor(5)
p factor(100)

def bubble_sort(array)
  sorted = false
  until sorted
    sorted = true
    (array.count - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array
end

p bubble_sort([5, 4, 3, 2, 1])
p bubble_sort([100, 587, 32, 64, 1, 87])

def substrings(str)
  subs = []
  str.length.times do |left|
    (str.length + 1).times do |right|
      x = str.slice(left, right)
      subs << str.slice(left, right) unless subs.include?(x) || x.empty?
    end
  end
  subs
end

p substrings("cat")
p substrings("cats")

def subwords(str)
  subs = substrings(str)
  words = []
  File.foreach("dictionary.txt") do |line|
    words << line.chomp if subs.include?(line.chomp)
  end
  words
end

p subwords("cats")
p subwords("antipathy")
