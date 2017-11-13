class DependentsController < ApplicationController

  def new
    @dependent = Dependent.new
  end

  def create
    @dependent = Dependent.new(dependent_params)
    if @dependent.save
      @dependents = Dependent.find(current_user.id)
      render 'index'
    else
      render 'new'
    end
  end

  def index
  end

  private
    def dependent_params
      params.require(:dependent).permit(:name, :relation)
    end
end
