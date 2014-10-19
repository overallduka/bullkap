json.array!(@bonds) do |bond|
  json.extract! bond, :id, :name
  json.url bond_url(bond, format: :json)
end
