require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

RSpec.describe do
  it 'exists' do
    pantry = Pantry.new
    expect(pantry).to be_instance_of(Pantry)
  end

  it 'has an empty hash as a stock by default' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock).to eq({})
  end

  it 'has default 0 on a specific ingredient before its been restocked' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock_check(ingredient1)).to eq(0)
    expect(pantry.stock_check(ingredient2)).to eq(0)
  end

  it 'can restock a specific ingredient and quantity' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock_check(ingredient1)).to eq(0)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check(ingredient1)).to eq(15)
    pantry.restock(ingredient2, 7)
    expect(pantry.stock_check(ingredient2)).to eq(7)
  end

  it 'can say if there are enough ingredients for a certain recipe' do
    pantry = Pantry.new
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 7)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
    pantry.restock(ingredient2, 1)
    expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
  end
end
