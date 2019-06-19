# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  require 'rack/rewrite'

  if ENV['RACK_ENV'] == 'production'
    config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
      r301 %r{.*}, 'https://beer-life.info$&', :if => Proc.new { |rack_env|
        rack_env['SERVER_NAME'] != 'beer-life.info'
      }
  end
end
end
