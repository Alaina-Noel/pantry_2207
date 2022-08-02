class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    result = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        # require 'pry' ; binding.pry
      result << ingredient.name if !result.include?(ingredient.name)
      end
    end
    result
  end

  def highest_calorie_meal
    # require 'pry' ; binding.pry
    @recipes.max_by {|recipe| recipe.total_calories}
  end



end
