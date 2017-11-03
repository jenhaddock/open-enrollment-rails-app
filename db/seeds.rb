#name | is_percentage | is_flat | amount
Deduction.create(name: "Health Insurance", is_percentage: false, is_flat: true, amount: 47.50)
Deduction.create(name: "Dental Insurance", is_percentage: false, is_flat: true, amount: 12.75)
Deduction.create(name: "Eye Insurance", is_percentage: false, is_flat: true, amount: 15.00)
Deduction.create(name: "Flex Health Plan", is_percentage: true, is_flat: false, amount: nil)
Deduction.create(name: "401k", is_percentage: true, is_flat: false, amount: nil)
Deduction.create(name: "Stock Options", is_percentage: true, is_flat: false, amount:nil)
