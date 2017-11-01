class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.decimal :salary
      t.boolean :setup_complete

      t.timestamps
    end
  end
end
