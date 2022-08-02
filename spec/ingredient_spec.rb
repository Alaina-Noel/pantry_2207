require './lib/ingredient'

RSpec.describe do
  it 'exists' do
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    expect(ingredient1).to be_instance_of(Ingredient)

  end
end
