class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :kind # request wait, click to see, cancel wait, start talk, end talk, 
      t.string :content

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
