class CreateWaits < ActiveRecord::Migration[5.2]
  def change
    create_table :waits do |t|
      t.belongs_to :waiting, null: false, foreign_key: { to_table: :users }
      t.belongs_to :waiter, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
