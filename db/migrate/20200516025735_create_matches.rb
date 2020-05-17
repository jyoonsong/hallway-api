class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.belongs_to :match_one, null: false, foreign_key: { to_table: :users }
      t.belongs_to :match_two, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
