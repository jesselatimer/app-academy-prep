class Array
  def two_sum
    sums = []
    self[(0...-1)].each_with_index do |left, idx_left|
      self[(idx_left+1..-1)].each_with_index do |right, idx_right|
        sums << [idx_left, idx_left + idx_right + 1] if left + right == 0
      end
    end
    sums
  end
end

puts [-1, 0, 2, -2, 1].two_sum.to_s
