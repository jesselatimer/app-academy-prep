def stock_picker(stocks)
  highest_profit = 0
  highest_indexes = []

  stocks[(0...-1)].each_with_index do |x, i|
    stocks[(i+1..-1)].each_with_index do |y, j|
      if y - x > highest_profit
        highest_indexes = [i, (i + j + 1)]
        highest_profit = y - x
      end
    end
  end
  highest_indexes
end

puts stock_picker([29, 25, 30, 42, 36, 20, 30]).to_s
