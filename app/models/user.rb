class User < ApplicationRecord

  # Waitings stands for users who I am waiting for
  # waitings = Follow.where(waited_by_id: self.id)
  has_many :waiting_fors, class_name: :Wait, foreign_key: :user_id #waited_by_id
  has_many :waitings, through: :waiting_fors, source: :waited_by

  # Waiters stands for users who waits me
  # waiters = Wait.where(waiting_for_id: self.id)
  has_many :waited_bys, class_name: :Wait, foreign_key: :waiting_for_id
  has_many :waiters, through: :waited_bys, source: :waiting_for

end