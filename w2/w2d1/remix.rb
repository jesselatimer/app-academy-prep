class Remix
  def initialize(ingredients)
    @ingredients = ingredients
    @mixed_ingredients = ingredients
  end

  def remix
    until mixed?
      alchohols = extract_and_shuffle_ingredients(0)
      mixers = extract_and_shuffle_ingredients(1)
      @mixed_ingredients = mix_ingredients(alchohols, mixers)
    end
    @mixed_ingredients
  end

  private
  def mixed?
    @mixed_ingredients.none? { |mix| @ingredients.include?(mix) }
  end

  def extract_and_shuffle_ingredients(index)
    @ingredients.map { |mix| mix[index] }.shuffle
  end

  # Use Enumerable#zip instead.
  def mix_ingredients(alchohols, mixers)
    alchohols.map.with_index { |alchohol, i| [alchohol, mixers[i]] }
  end
end

remix = Remix.new([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])
p remix.remix
