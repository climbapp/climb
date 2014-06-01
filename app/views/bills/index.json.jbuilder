json.array!(@bills) do |bill|
  json.extract! bill, :id, :name, :paid?, :amount_due, :due_date, :late_fee, :interest, :min_due, :payee_id
  json.url bill_url(bill, format: :json)
end
