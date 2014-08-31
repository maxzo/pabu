json.array!(@incomes) do |income|
  json.extract! income, :id, :date, :description, :amount
  json.url income_url(income, format: :json)
end
