def translate(str)
  words = str.split(" ").map do |word|
    translate_word(word)
  end
  words.join(" ")
end

def translate_word(word)
  capital = (word == word.capitalize)
  consonant_cluster = word.slice!(/^[^aeiou]*qu|^[^aeiou]+/i)
  punctuation = word.slice!(/(\.|\?|!|,|;|:)/)
  word = "#{word}#{consonant_cluster.to_s}ay#{punctuation.to_s}"
  word.capitalize! if capital
  word
end
