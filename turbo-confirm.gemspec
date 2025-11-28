require_relative "lib/turbo/confirm/version"

Gem::Specification.new do |spec|
  spec.name        = "turbo-confirm"
  spec.version     = Turbo::Confirm::VERSION
  spec.authors     = [ "Andy Cohen" ]
  spec.email       = [ "outlawandy@gmail.com" ]
  spec.homepage    = "https://github.com/OutlawAndy/turbo-confirm-rails"
  spec.summary     = "The easiest way to add custom confirmation dialogs to a Turbo Rails app."
  spec.description = "Add @hotwired/turbo-confirm to your Turbo Rails app with zero configuration or setup."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7.0"
end
