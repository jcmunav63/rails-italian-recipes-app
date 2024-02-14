class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @foods = @user.foods.includes(:user).paginate(page: params[:page], per_page: 12)
  end

  def new
    @user = current_user
    @food = @user.foods.build
  end

  def create
    @user = current_user
    @food = @user.foods.build(food_params)

    if @food.save
      redirect_to user_foods_path(@user), notice: 'Food was successfully created!'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to user_foods_path(current_user), notice: 'Food was successfully deleted.'
    else
      redirect_to user_foods_path(current_user), alert: 'Food could not be destroyed.'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
