def translate(str)
  words = str.split(" ").map do |word|
    consonants = word.slice!(/^[^aeiouq]+/)
    qus = word.slice!(/^qu/)
    word + consonants.to_s + qus.to_s + "ay"
  end

  words.join(" ")
end
