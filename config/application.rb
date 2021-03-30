require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module GitUnfollower
  class Application < Rails::Application
    config.load_defaults 6.1
    config.autoload_paths += %W(#{config.root}/lib)

  end
end
