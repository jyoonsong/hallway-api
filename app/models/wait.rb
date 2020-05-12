class Wait < ApplicationRecord
  belongs_to :waiting, foreign_key: "waiting_id", class_name: "User"
  belongs_to :waiter, foreign_key: "waiter_id", class_name: "User"
end
