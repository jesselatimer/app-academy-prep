def translate(str)
  words = str.split(" ").map do |word|
    consonants = word.slice!(/^[^aeiou]+/)
    yoos = word.slice!(/^u/) if consonants.to_s[-1] == "q"
    word + consonants.to_s + yoos.to_s + "ay"
  end

  words.join(" ")
end
