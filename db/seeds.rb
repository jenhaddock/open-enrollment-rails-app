#name | is_percentage | is_flat | amount
Deduction.create(name: "Health Insurance", is_percentage: false, is_flat: true, amount: 47.50)
Deduction.create(name: "Dental Insurance", is_percentage: false, is_flat: true, amount: 12.75)
Deduction.create(name: "Eye Insurance", is_percentage: false, is_flat: true, amount: 15.00)
Deduction.create(name: "Flex Health Plan", is_percentage: true, is_flat: false, amount: nil)
Deduction.create(name: "401k", is_percentage: true, is_flat: false, amount: nil)
Deduction.create(name: "Stock Options", is_percentage: true, is_flat: false, amount:nil)

#email | password_digest | first_name | last_name | admin | salary | setup_complete
User.create(email: "Tom@flatiron.com", password: "passw0rd", first_name: "Tom", last_name: "Smith", admin: false, salary: 50000, setup_complete: true)
User.create(email: "Penelope@flatiron.com", password: "passw0rd", first_name: "Penelope", last_name: "Garcia", admin: true, salary: 70000, setup_complete: true)
User.create(email: "Issac@flatiron.com", password: "passw0rd", first_name: "Issac", last_name: "Martin", admin: false, salary: 45000, setup_complete: true)
User.create(email: "Abigail@flatiron.com", password: "passw0rd", first_name: "Abigail", last_name: "Walker", admin: false, salary: nil, setup_complete: false)

#name | relation | user_id
Dependent.create(name: "Reagan", relation: "Daughter", user_id: 1)
Dependent.create(name: "Riley", relation: "Daughter", user_id: 2)
Dependent.create(name: "Isiah", relation: "Son", user_id: 2)

# user_id | deduction_id | percentage
DeductionDetail.create(user_id: 0, deduction_id: 0, percentage: nil)
DeductionDetail.create(user_id: 0, deduction_id: 1, percentage: nil)
DeductionDetail.create(user_id: 0, deduction_id: 5, percentage: 10)
DeductionDetail.create(user_id: 1, deduction_id: 0, percentage: nil)
DeductionDetail.create(user_id: 1, deduction_id: 2, percentage: nil)
DeductionDetail.create(user_id: 1, deduction_id: 3, percentage: 3)
