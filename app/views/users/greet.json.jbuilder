json.waited_by_users @waited_by_users do |user|
  if user.id != current_user.id
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
    json.affiliation user.affiliation
    json.link user.link
    json.image user.image
    json.email user.email
  end
end