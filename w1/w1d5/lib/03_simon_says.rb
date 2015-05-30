def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, num=2)
  words = []
  num.times { words << str }
  words.join(" ")
end

def start_of_word(str, num)
  str[0...num]
end

def first_word(str)
  str.split(" ")[0]
  # Using RegEx: str.match(/^\w+/).to_s
end

def titleize(str)
  little_words = %w{and the over}
  words = str.split(" ").map.with_index do |word, i|
    (!little_words.include?(word) || i == 0) ? word.capitalize : word
  end
  words.join(" ")
end
