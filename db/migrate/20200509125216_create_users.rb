class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :affiliation
      t.string :link
      t.string :image

      t.timestamps
    end
    
    change_column :users, :email, :string, :null => true
    change_column :users, :affiliation, :string, :null => true
    change_column :users, :image, :string, :null => true
  end
end
