class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null:false
      t.references :user
      t.timestamps
    end
    add_foreign_key :groups, :users, column: :user_id
  end
end
