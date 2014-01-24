json.array!(@states) do |state|
  json.extract! state, :id, :name, :population, :abbreviation
  json.url state_url(state, format: :json)
end
