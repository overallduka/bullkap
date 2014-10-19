json.array!(@people) do |person|
  json.extract! person, :id, :name, :email, :phone_number, :cell_number, :twitter, :facebook, :instagram, :bond_id
  json.url person_url(person, format: :json)
end
