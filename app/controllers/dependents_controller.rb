class DependentsController < ApplicationController

  def new
    @dependent = Dependent.new
  end

  def create
    @dependent = Dependent.new(dependent_params)
    if @dependent.save
      @dependents = User.find(params[:user_id]).dependents
      @dependent = User.find(params[:user_id]).dependents.build
      respond_to do |f|
        f.json {render json: @dependents}
        f.html {render :index}
      end
    else
      render 'new'
    end
  end

  def index
    @dependents = User.find(params[:user_id]).dependents
    @dependent = User.find(params[:user_id]).dependents.build
    respond_to do |f|
      f.json {render json: @dependents}
      f.html {render :index}
    end
  end

  def destroy
    Dependent.find(params[:id]).delete
    render 'index'
  end

  private
    def dependent_params
      params.require(:dependent).permit(:name, :relation, :user_id)
    end
end
