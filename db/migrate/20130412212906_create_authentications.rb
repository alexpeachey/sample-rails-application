class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user
      t.string :provider
      t.string :uid

      t.timestamps
    end
    add_index :authentications, :user_id
    add_index :authentications, :provider
    add_index :authentications, :uid
    add_index :authentications, [:provider,:uid]
  end
end
