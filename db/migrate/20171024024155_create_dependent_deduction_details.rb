class CreateDependentDeductionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :dependent_deduction_details do |t|
      t.integer :dependent_id
      t.integer :deduction_id

      t.timestamps
    end
  end
end
