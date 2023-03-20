class PrivatisationsController < ApplicationController
  include Filterable
  before_action :set_privatisation, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @privatisation = Privatisation.new
  end

  def create
    @privatisation = Privatisation.new(privatisation_params)
    if @privatisation.save
      redirect_to privatisation_path
    else
      render :new
    end
  end

  def show; end

  def index
    @privatisations = Privatisation.all
  end

  def destroy
    @privatisation.destroy
  end

  def update
    @privatisation.update(privatisation_params)
  end

  def edit; end

  private

  def privatisation_params
    params.require(:privatisation).permit(:first_name, :last_name, :email, :phone, :date, :service, :people, :comment)
  end

  def set_privatisation
    @privatisation = Privatisation.find(params[:id])
  end
end
