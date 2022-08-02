class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.keys.map do |ingredient|
      ingredient.calories * @ingredients_required[ingredient]
    end.sum
  end
end
