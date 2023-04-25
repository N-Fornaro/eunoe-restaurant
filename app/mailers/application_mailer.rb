# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'felix@eunoe-restaurant.com'
  layout 'mailer'
end
