# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def index
    @menus = Menu.all
  end

  def show; end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save!
    redirect_to menu_path(@menu)
  end

  def edit; end

  def update
    @menu.update!(menu_params)
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu.destroy!
    redirect_to menus_path, status: :see_other
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:content, :title, :price, :meal)
  end
end
