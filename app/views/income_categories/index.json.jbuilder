json.array!(@income_categories) do |income_category|
  json.extract! income_category, :id, :name
  json.url income_category_url(income_category, format: :json)
end
