json.array!(@category_items) do |category_item|
  json.extract! category_item, :id, :romaji, :kana, :title, :category_id
  json.url category_item_url(category_item, format: :json)
end
