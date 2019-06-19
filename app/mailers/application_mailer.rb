# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'beerlife <noreply@beer-life.info>'
  layout 'mailer'
end
