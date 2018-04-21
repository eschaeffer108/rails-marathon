class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      flash[:notice] = 'House added successfully'
      redirect_to @house
    else
      flash[:notice] = @house.errors.full_messages.join(",")
      render action: 'new'
    end
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
  end

  private

  def house_params
    params.require(:house).permit(:name, :author, :source, :motto)
  end
end
