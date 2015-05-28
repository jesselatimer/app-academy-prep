def num_to_s(num, base)
  digits = {
    0 => '0',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => 'A',
    11 => 'B',
    12 => 'C',
    13 => 'D',
    14 => 'E',
    15 => 'F',
  }

  chars = []
  pow = 0
  until num / (base ** pow) == 0
    chars.unshift(digits[num / (base ** pow) % base])
    pow += 1
  end

  chars.join("")
end

puts num_to_s(5, 10)
puts num_to_s(5, 2)
puts num_to_s(5, 16)

puts num_to_s(234, 10)
puts num_to_s(234, 2)
puts num_to_s(234, 16)

def caesar(str, offset)
  chars_as_nums = str.split("").map { |char| char.ord }
  offset_nums = chars_as_nums.map { |char| char.between?(97, 123) ? char + offset : char }
  corrected_nums = offset_nums.map { |char| char.between?(122, 123 + offset) ? char - 26 : char }
  new_chars = corrected_nums.map { |char| char.chr }
  new_chars.join("")
end

puts caesar("hello !z", 3)
puts caesar("zany", 2)
