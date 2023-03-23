# frozen_string_literal: true

class NewslettersController < ApplicationController
  # Line below to uncomment when ready for opening (to remove the temporary homepage / opening soon page)
  # skip_before_action :authenticate_user!, only: %i[show]

  before_action :set_newsletter, only: %i[show update destroy]

  def index
    @newsletters = Newsletter.all
  end

  def show; end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save!
      redirect_to newsletter_path(@newsletter)
      flash[:notice] = 'Your newsletter has been saved !'
    else
      flash[:alert] = 'We encountered an error while saving your newsletter. Please try agian in a few seconds.'
    end
  end

  def update
    @newsletter.update!(flight_params)
    redirect_to newsletters_path, status: :see_other
  end

  def destroy
    @newsletter.destroy
    redirect_to newsletters_path, status: :see_other
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:content)
  end

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end
end
