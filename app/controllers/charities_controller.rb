class CharitiesController < ApplicationController

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)

    if @charity.save
      flash[:notice] = "Your charity was created!"
      redirect_to root_path
    else
      flash[:alert] = "There was an error creating your charity."
      render 'new'
    end
  end

  def index
    @charties = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      redirect_to :back
    else
      flash[:alert] = "There was an error editing your charity."
      render 'show'
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    redirect_to root_path
  end

private
  def charity_params
    params.require(:charity).permit(:name, :mission, :description, :founded)
  end
end
