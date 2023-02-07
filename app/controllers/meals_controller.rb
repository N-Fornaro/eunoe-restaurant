# frozen_string_literal: true

class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @meals = Meal.all
  end

  def show; end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.save!
    redirect_to meal_path(@meal)
  end

  def edit; end

  def update
    @meal.update!(meal_params)
    redirect_to meal_path(@meal)
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
    params.require(:meal).permit(:title, :description, :price, :dish)
  end
end
