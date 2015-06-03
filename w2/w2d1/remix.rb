class Remix
  def initialize(ingredients)
    @ingredients = ingredients
    @mixed_ingredients = ingredients
  end

  def remix
    until mixed?
      @mixed_ingredients = mix_ingredients(shuffle_alchohols, shuffle_mixers)
    end
    @mixed_ingredients
  end

  private
  def mixed?
    @mixed_ingredients.none? { |mix| @ingredients.include?(mix) }
  end

  def shuffle_alchohols
    @ingredients.map { |mix| mix[0] }.shuffle
  end

  def shuffle_mixers
    @ingredients.map { |mix| mix[1] }.shuffle
  end

  def mix_ingredients(alchohols, mixers)
    alchohols.zip(mixers)
  end
end

mix_it = Remix.new([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])
p mix_it.remix
