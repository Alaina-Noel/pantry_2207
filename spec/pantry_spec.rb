require './lib/ingredient'
require './lib/pantry'

RSpec.describe do
  it 'exists' do
    pantry = Pantry.new
    expect(pantry).to be_instance_of(Pantry)
  end

  xit 'has attributes' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    expect(ingredient1.name).to eq("Cheese")
    expect(ingredient1.unit).to eq("oz")
    expect(ingredient1.calories).to eq(50)
  end
end
