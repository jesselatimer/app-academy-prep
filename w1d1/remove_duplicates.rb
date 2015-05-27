class Array
  def my_uniq
    uniques = []
    self.each do |x|
      uniques << x unless uniques.include?(x)
    end
    uniques
  end
end

puts [1, 2, 1, 3, 3].my_uniq
