# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home cuisine]

  def home; end

  def restaurant; end

  def cuisine; end
end
