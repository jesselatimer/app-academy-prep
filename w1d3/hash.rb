class MyHashSet

  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    if @store.has_key?(el)
      @store.delete(el)
      return true
    else
      return false
    end
  end

  def to_a
    @store.keys
  end

  def union(set2)
    new_set = MyHashSet.new()
    self.to_a.each { |elem| new_set.insert(elem) unless new_set.include?(elem)  }
    set2.to_a.each { |elem| new_set.insert(elem) unless new_set.include?(elem)  }
    new_set.to_a
  end

  def intersect(set2)
    new_set = MyHashSet.new()
    set2.to_a.each { |elem| new_set.insert(elem) if self.include?(elem) }
    new_set.to_a
  end

  def minus(set2)
    new_set = MyHashSet.new()
    self.to_a.each { |elem| new_set.insert(elem) unless set2.include?(elem) }
    new_set.to_a
  end
end

my_hash = MyHashSet.new()
puts my_hash.insert("Hello!")
puts my_hash.include?("Hello!").to_s + " <- Should be true."
puts my_hash.include?("Bob").to_s + " <- Should be false."
puts my_hash.delete("Hello!").to_s + " <- Should be true."
puts my_hash.delete("Bob").to_s + " <- Should be false."
my_hash.insert(1)
my_hash.insert(3)
my_hash.insert(5)

my_second_hash = MyHashSet.new()
my_second_hash.insert(1)
my_second_hash.insert(2)
my_second_hash.insert(4)
my_second_hash.insert(5)
my_second_hash.insert(6)

puts my_hash.to_a.to_s
puts my_second_hash.to_a.to_s

puts my_hash.union(my_second_hash).to_s
puts my_hash.intersect(my_second_hash).to_s
puts my_hash.minus(my_second_hash).to_s
