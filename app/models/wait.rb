class Wait < ApplicationRecord
  belongs_to :waiting, foreign_key: "waiting_for_id", class_name: "User"
  belongs_to :waiter, foreign_key: "user_id", class_name: "User"
end
