# frozen_string_literal: true

class MenusController < ApplicationController
  before_action :set_menu, only: %i[show]

  def index; end
  def show; end
  def new; end
  def create; end
  def edit; end
  def update; end
  def destroy; end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def booking_params
    params.require(:menu).permit(:content)
  end
end
