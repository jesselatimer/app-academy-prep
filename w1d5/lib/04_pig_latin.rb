def translate(str)
  words = str.split.map do |word|
    word == word.capitalize ? capital = true : capital = false
    consonant_cluster = word.slice!(/^([^aeiou]*qu|[^aeiou]+)/)
    punctuation = word.slice!(/(\.|\?|!)/)
    word += consonant_cluster if consonant_cluster
    word += "ay"
    word += punctuation if punctuation
    word.capitalize! if capital
    word
  end

  words.join(" ")
end
