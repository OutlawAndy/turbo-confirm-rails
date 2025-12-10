module Turbo
  module Confirm
    class Engine < ::Rails::Engine
      isolate_namespace Turbo::Confirm

      config.turbo_confirm = ActiveSupport::OrderedOptions.new

      PRECOMPILE_ASSETS = %w( app/assets/config/manifest.js )

      initializer "turbo_confirm.assets" do |app|
        if Rails.application.config.respond_to?(:assets)
          Rails.application.config.assets.precompile += PRECOMPILE_ASSETS
          app.config.assets.paths << root.join("app/assets/stylesheets")
          app.config.assets.paths << root.join("app/javascript")
        end
      end

      initializer "turbo_form.importmap", before: "importmap" do |app|
        # https://github.com/rails/importmap-rails#composing-import-maps
        app.config.importmap.paths << root.join("config/importmap.rb")

        # https://github.com/rails/importmap-rails#sweeping-the-cache-in-development-and-test
        app.config.importmap.cache_sweepers << root.join("app/javascript")
      end

      # initializer "turbo_confirm.system_test_helper" do
      #   ActiveSupport.on_load(:action_dispatch_system_test_case) do
      #     require "turbo/confirm/system_test_helper"
      #     include Turbo::Confirm::SystemTestHelper
      #   end
      # end
    end
  end
end
