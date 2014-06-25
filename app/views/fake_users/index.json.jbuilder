json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :sms_remind?, :email_remind?, :phone
  json.url user_url(user, format: :json)
end
