class CreateDependents < ActiveRecord::Migration[5.1]
  def change
    create_table :dependents do |t|
      t.string :name
      t.string :relation
      t.integer :user_id

      t.timestamps
    end
  end
end
