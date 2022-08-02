require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/pantry'

RSpec.describe do
  it 'exists' do
    cookbook = CookBook.new
    expect(cookbook).to be_instance_of(CookBook)
  end

  it 'can add recipes & has none by default' do
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    expect(cookbook.recipes).to eq([])
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expect(cookbook.recipes).to eq([recipe1, recipe2])
  end


    it 'can list all ingredients in a cookbook' do
      pantry = Pantry.new
      cookbook = CookBook.new
      recipe1 = Recipe.new("Mac and Cheese")
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      recipe2 = Recipe.new("Cheese Burger")
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)

      expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

end
