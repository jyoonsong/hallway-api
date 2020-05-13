class User < ApplicationRecord
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

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


  def request_wait(is_waited_id)
      if (is_waited_id != self.id)
          Wait.create(waiter_id: self.id, waiting_id: is_waited_id)
      end
  end

  def cancel_wait(is_waited_id)
      wait = Wait.find_by(waiter_id: self.id, waiting_id: is_waited_id)
      if wait.present?
        wait.destroy
      end
  end

end