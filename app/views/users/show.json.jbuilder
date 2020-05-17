json.users @waited_by_users do |user|
    if user.id != current_user.id
        json.id user.id
        json.first_name user.first_name
        json.last_name user.last_name
        json.affiliation user.affiliation
        json.link user.link
        json.image user.image
        if @waiting_for_users.include?(user)
            json.waiting_for true
        else
            json.waiting_for false
        end
    end
end