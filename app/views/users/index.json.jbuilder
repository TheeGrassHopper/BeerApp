json.array!(@users) do |user|
  json.extract! user, :id, :password, :user
  json.url user_url(user, format: :json)
end
