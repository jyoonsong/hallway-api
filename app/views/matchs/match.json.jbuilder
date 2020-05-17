if @match.present?
    json.success current_user.link
else
    json.error "The user is currently talking to the other user. Please try again after a while."
end