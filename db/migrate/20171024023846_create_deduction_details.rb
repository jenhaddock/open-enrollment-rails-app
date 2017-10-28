class CreateDeductionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :deduction_details do |t|
      t.integer :user_id
      t.integer :deduction_id
      t.integer :percentage

      t.timestamps
    end
  end
end
