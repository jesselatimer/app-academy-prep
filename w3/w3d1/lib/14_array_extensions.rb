class Array

  def sum
    self.inject(0) { |accum, num| accum += num }
  end

  def square!
    self.map! { |el| el ** 2 }
  end

  def square
    new_array = self.square!
  end

end
