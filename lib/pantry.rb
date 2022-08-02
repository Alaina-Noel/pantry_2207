class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.map do |ingredient_required|
      @stock[ingredient_required[0]] >=  ingredient_required[1]
    end.all?(true)
  end
end
