say "Create Turbo Confirm Initializer"
empty_directory "app/javascript/initializers"
copy_file "#{__dir__}/app/javascript/initializers/turbo_confirm.js",
  "app/javascript/initializers/turbo_confirm.js"



if (Rails.root.join("app/javascript/application.js")).exist?
  say "Import Turbo Confirm Initializer in app/javascript/application.js"
  append_to_file "app/javascript/application.js", %(import "./initializers/turbo_confirm.js"\n)
else
  say %(Couldn't find "app/javascript/application.js".\nYou must import "./inititializers/turbo_confirm.js" in your JavaScript entrypoint file), :red
end

say "Install Turbo Confirm"
if (Rails.root.join("bun.config.js")).exist?
  run "bun add @rolemodel/turbo-confirm"
else
  run "yarn add @rolemodel/turbo-confirm"
end
