json.array!(@payees) do |payee|
  json.extract! payee, :id, :name, :recurring, :user_id, :category_id
  json.url payee_url(payee, format: :json)
end
