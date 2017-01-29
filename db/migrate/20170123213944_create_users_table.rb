class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :nausea
      t.integer :height
      t.integer :happiness
      t.integer :tickets
      t.boolean :admin
    end
  end
end
