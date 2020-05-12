class User < ApplicationRecord
  has_secure_password

  # Waitings stands for users who I am waiting for
  # waitings = Follow.where(wait_id: self.id)
  has_many :is_waiteds, class_name: :Wait, foreign_key: :waiting_id #wait_id
  has_many :waitings, through: :waits, source: :waited

  # Waiters stands for users who waits me
  # waiters = Wait.where(is_waited_id: self.id)
  has_many :waits, class_name: :Wait, foreign_key: :waiter_id
  has_many :waiters, through: :waiteds, source: :waiter


  def request_wait(is_waited_id)
      if (is_waited_id != self.id)
          Wait.create(waiter_id: self.id, waiting_id: is_waited_id)
      end
  end

  def cancel_wait(is_waited_id)
      wait = Wait.where(waiter_id: self.id, waiting_id: is_waited_id).first
      wait.destroy
  end

end