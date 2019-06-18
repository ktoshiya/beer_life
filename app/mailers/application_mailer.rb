# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'beerlife <noreply@beerlife.info>'
  layout 'mailer'
end
