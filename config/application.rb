require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module BeerLife
  class Application < Rails::Application
    config.generators.template_engine = :slim

    config.load_defaults 5.2

    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'

    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        request_specs: false
    end
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
