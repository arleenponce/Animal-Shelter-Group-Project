json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :species, :gender, :age, :weight, :breed
  json.url pet_url(pet, format: :json)
end
