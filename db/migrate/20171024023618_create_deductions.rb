class CreateDeductions < ActiveRecord::Migration[5.1]
  def change
    create_table :deductions do |t|
      t.string :name

      t.timestamps
    end
  end
end
