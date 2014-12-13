json.users @users do |user|
  json.id    user.id
  json.first_name user.first_name
  json.second_name user.second_name
end
