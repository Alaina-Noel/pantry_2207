require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe do
  it 'exists' do
    recipe1 = Recipe.new("Mac and Cheese")

    expect(recipe1).to be_instance_of(Recipe)
  end

  it 'has attributes' do
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    expect(recipe1.name).to eq("Mac and Cheese")
    expect(recipe1.ingredients_required).to eq({})
  end


  it 'can add ingredients' do
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expect(recipe1.ingredients_required).to eq({ ingredient1 => 6, ingredient2 => 8 })
  end

  it 'can list ingredients in an array' do
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
  end


end
