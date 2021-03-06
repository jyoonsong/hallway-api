class User < ApplicationRecord
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :logs

  # Waitings stands for users who I am waiting for
  # waits = Wait.where(wait_id: self.id)
  # waitings = User.where
  has_many :waits, class_name: :Wait, foreign_key: :waiting_id
  has_many :waitings, through: :waits, source: :waiter

  # Waiters stands for users who waits me
  # is_waiteds = Wait.where(is_waited_id: self.id)
  # waiters = User
  has_many :is_waiteds, class_name: :Wait, foreign_key: :waiter_id #wait_id
  has_many :waiters, through: :is_waiteds, source: :waiting


  # Waitings stands for users who I am waiting for
  # waits = Wait.where(wait_id: self.id)
  # waitings = User.where
  has_many :matchships_one, class_name: :Match, foreign_key: :match_one_id
  has_many :match_ones, through: :matchships_one, source: :match_two

  # Waiters stands for users who waits me
  # is_waiteds = Wait.where(is_waited_id: self.id)
  # waiters = User
  has_many :matchships_two, class_name: :Match, foreign_key: :match_two_id #wait_id
  has_many :match_twos, through: :matchships_two, source: :match_one

  def matches 
    match_ones + match_twos
  end
  
  def request_wait(is_waited_id)
      if (is_waited_id != self.id)
        wait = Wait.find_by(waiter_id: self.id, waiting_id: is_waited_id)
        if !wait.present?
            Wait.create(waiter_id: self.id, waiting_id: is_waited_id)
        end
      end
  end

end