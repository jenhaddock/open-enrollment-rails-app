class CreateDeductions < ActiveRecord::Migration[5.1]
  def change
    create_table :deductions do |t|
      t.string :name
      t.boolean :is_percentage
      t.boolean :is_flat
      t.decimal :amount

      t.timestamps
    end
  end
end
