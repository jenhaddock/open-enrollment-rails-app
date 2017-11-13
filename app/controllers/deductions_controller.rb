class DeductionsController < ApplicationController

  def new
    @deductions = Deduction.all
  end
end
