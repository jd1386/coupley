require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Coupley
  class Application < Rails::Application
    console do 
        ActiveRecord::Base.connection
    end

    config.time_zone = 'Seoul'
    config.active_record.default_timezone = :local
    config.active_record.record_timestamps = true

    config.serve_static_assets = true
  end
end
