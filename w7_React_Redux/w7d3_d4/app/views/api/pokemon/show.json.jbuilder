json.extract! @pokemon, :id, :name, :attack, :defense,
                        :moves, :poke_type
json.image_url asset_path(@pokemon.image_url)

json.items do
  json.array! @pokemon.items.each do |item|
    json.extract! item, :id, :name, :price, :happiness
    json.pokemon_id @pokemon.id
    json.image_url asset_path(item.image_url)
  end
end
