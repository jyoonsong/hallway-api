json.waiting_for_users @waiting_for_users do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.affiliation user.affiliation
  json.link user.link
  json.image user.image
  json.waiting_for true
end

json.rest @rest do |user|
  if user.id != current_user.id
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
    json.affiliation user.affiliation
    json.link user.link
    json.image user.image
    json.waiting_for false
  end
end