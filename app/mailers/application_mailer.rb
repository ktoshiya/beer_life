# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'beerlife <noreply@beerlife.com>'
  layout 'mailer'
end
