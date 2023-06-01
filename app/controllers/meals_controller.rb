# frozen_string_literal: true

class MealsController < ApplicationController
  # Line below to uncomment when ready for opening (to remove the temporary homepage / opening soon page)
  # skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = Meal.all
  end

  def show; end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save!
      redirect_to meals_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @meal.update!(meal_params)
      redirect_to meals_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy!
    redirect_to meals_path, status: :see_other
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:title, :description, :price, :dish, :timing)
  end
end
