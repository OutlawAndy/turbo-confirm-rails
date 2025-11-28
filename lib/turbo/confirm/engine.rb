module Turbo
  module Confirm
    class Engine < ::Rails::Engine
      isolate_namespace Turbo::Confirm
      config.eager_load_namespaces << Turbo::Confirm
      # config.autoload_once_paths = %W(
      #   #{root}/app/helpers
      # )
      # If you don't want to precompile Turbo's assets (eg. because you're using webpack),
      # you can do this in an intiailzer:
      #
      # config.after_initialize do
      #   config.assets.precompile -= Turbo::Confirm::Engine::PRECOMPILE_ASSETS
      # end
      PRECOMPILE_ASSETS = %w( turbo-confirm.js turbo-confirm.min.js turbo-confirm.min.js.map )

      initializer "turbo_confirm.assets" do
        if Rails.application.config.respond_to?(:assets)
          Rails.application.config.assets.precompile += PRECOMPILE_ASSETS
        end
      end

      # initializer "turbo_confirm.helpers", before: :load_config_initializers do
      #   ActiveSupport.on_load(:action_controller_base) do
      #     helper Turbo::Confirm::Engine.helpers
      #   end
      # end

      # initializer "turbo_confirm.system_test_helper" do
      #   ActiveSupport.on_load(:action_dispatch_system_test_case) do
      #     require "turbo/confirm/system_test_helper"
      #     include Turbo::Confirm::SystemTestHelper
      #   end
      # end
    end
  end
end
