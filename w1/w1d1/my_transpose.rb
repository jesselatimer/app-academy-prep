def my_transpose(matrix)
  transposed_matrix = []
  side_length = matrix.count
  side_length.times { transposed_matrix << [] }

  matrix.each_with_index do |x, i|
    matrix[i].each_with_index do |y, j|
      transposed_matrix[j][i] = matrix[i][j]
    end
  end

  transposed_matrix
end

matrix = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
]

puts my_transpose(matrix).to_s
