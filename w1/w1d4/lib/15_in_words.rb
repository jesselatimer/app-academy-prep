# Jesse Latimer, App Academy Prep, w1d4
# Because of work commitments, I did this project solo rather than in a pair.

class Fixnum
  ONES = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
  }

  TEENS = {
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

  TENS = {
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }


  BIG_NUMS = {
    100 => 'hundred',
    1_000 => 'thousand',
    1_000_000 => 'million',
    1_000_000_000 => 'billion',
    1_000_000_000_000 => 'trillion'
  }

  def in_words
    if self < 10
      return ONES[self]
    elsif self < 20
      return TEENS[self]
    elsif self < 100
      tens = TENS[(self / 10) * 10]
      if self % 10 != 0
        tens + " " + (self % 10).in_words
      else
        tens
      end
    else
      big_num = 0
      BIG_NUMS.keys.each { |num| big_num = num if num <= self }
      big_num_words = (self / big_num).in_words + " " + BIG_NUMS[big_num]
      if self % big_num != 0
        big_num_words + " " + (self % big_num).in_words
      else
        big_num_words
      end
    end
  end
end
