Specifications for the Rails Assessment
Specs:

 [x]Using Ruby on Rails for the project

 [x]Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) (User has_many detail_deductions and User has_many dependents)

 [x]Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) (Dependent belongs_to User, deduction_detail belongs_to both user and deduction)

 [x]Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) (User has many deductions through deduction_details)

 [x]The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) (Percentage field in deduction_details)

 [x]Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)(presence of, uniqueness)

 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)(deduction_details/grand_total)

 [x]Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) (user -> dependents and deductions)

 [x]Include signup (how e.g. Devise)(manually created using password_digest)

 [x]Include login (how e.g. Devise)(manually created using password_digest)

 [x]Include logout (how e.g. Devise)(manually created)

 [x]Include third party signup/login (how e.g. Devise/OmniAuth)(Facebook)

 [x]Include nested resource show or index (URL e.g. users/2/recipes)(users/1/dependents, user/1/deduction_details)

 [x]Include nested resource "new" form (URL e.g. recipes/1/ingredients)(users/1/dependents)

 Include form display of validation errors (form URL e.g. /recipes/new)(Deductions cannot be greater than salary)

Confirm:

 [x]The application is pretty DRY

 [x]Limited logic in controllers

 [x]Views use helper methods if appropriate

 [x]Views use partials if appropriate
