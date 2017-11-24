Cocktail.destroy_all
Ingredient.destroy_all

require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredients = JSON.parse(user_serialized)


ingredients['drinks'].each do |element|
   Ingredient.create!(name: element['strIngredient1'])
end
