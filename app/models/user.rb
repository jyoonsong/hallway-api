class User < ApplicationRecord

  # Waitings stands for users who I am waiting for
  # waitings = Follow.where(waited_by_id: self.id)
  has_many :waiting_for, foreign_key: :waiting_for_id
  has_many :waitings, through: :waiting_for, source: :waited_by

  # Followers stands for users who waits me
  # waiters = Wait.where(waiting_for_id: self.id)
  has_many :waited_by, class_name: :Wait, foreign_key: :waited_by_id
  has_many :waiters, through: :waited_by, source: :waiting_for

end
