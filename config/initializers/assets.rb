# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Location of manifest file.
Rails.application.config.assets.manifest = Rails.root.join("tmp", "manifest.json")

# Add additional assets to the asset load path.
Rails.application.config.assets.paths << Rails.root.join("config")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[index.js browse.js welcome.js fixthemap.js]
Rails.application.config.assets.precompile += %w[user.js login.js diary_entry.js messages.js edit/*.js i18n/*.js]
Rails.application.config.assets.precompile += %w[screen-ltr.css print-ltr.css]
Rails.application.config.assets.precompile += %w[screen-rtl.css print-rtl.css]
Rails.application.config.assets.precompile += %w[leaflet-all.css leaflet.ie.css]
Rails.application.config.assets.precompile += %w[id.js id.css]
Rails.application.config.assets.precompile += %w[embed.js embed.css]
Rails.application.config.assets.precompile += %w[errors.css]
Rails.application.config.assets.precompile += %w[html5shiv.js es5.js es6.js]
Rails.application.config.assets.precompile += %w[images/marker-*.png img/*-handle.png]
Rails.application.config.assets.precompile += %w[help/introduction.*]
Rails.application.config.assets.precompile += %w[iD/img/*.svg iD/img/*.png iD/img/*.gif]
Rails.application.config.assets.precompile += %w[iD/img/pattern/*.png]
Rails.application.config.assets.precompile += %w[iD/locales/en.json]
Rails.application.config.assets.precompile += %w[iD/mapillary-js/*]
Rails.application.config.assets.precompile += %w[iD/pannellum-streetside/*]
