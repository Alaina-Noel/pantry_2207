require './lib/ingredient'
require './lib/pantry'

RSpec.describe do
  it 'exists' do
    pantry = Pantry.new
    expect(pantry).to be_instance_of(Pantry)
  end

  xit 'has an empty hash as a stock by default' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock).to eq({})
  end

  xit 'has default 0 on a specific ingredient before its been restocked' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock_check(ingredient1)).to eq(0)
    expect(pantry.stock_check(ingredient2)).to eq(0)
  end

  xit 'can restock a specific ingredient and quantity' do
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    expect(pantry.stock_check(ingredient1)).to eq(0)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    expect(pantry.stock_check(ingredient1)).to eq(15)
    pantry.restock(ingredient2, 10)
    expect(pantry.stock_check(ingredient2)).to eq(7)
  end


end
