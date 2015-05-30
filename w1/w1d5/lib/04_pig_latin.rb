def translate(str)
  words = str.split(" ").map do |word|
    translate_word(word)
  end
  words.join(" ")
end

def translate_word(word)
  word == word.capitalize ? capital = true : capital = false
  consonant_cluster = word.slice!(/^[^aeiouAEIOU]*qu|^[^aeiouAEIOU]+/)
  punctuation = word.slice!(/(\.|\?|!)/)
  word = "#{word}#{consonant_cluster.to_s}ay#{punctuation.to_s}"
  word.capitalize! if capital
  word
end
