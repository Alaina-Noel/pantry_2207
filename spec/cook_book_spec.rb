require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'
require './lib/cook_book'

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

end
