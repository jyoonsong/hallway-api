class CreateWaits < ActiveRecord::Migration[5.2]
  def change
    create_table :waits do |t|

      t.timestamps
    end
  end
end
