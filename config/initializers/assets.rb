Rails.application.config.assets.precompile << 'spree_videos_manifest.js'

Rails.application.config.assets.configure do |env|
    env.export_concurrent = false
  end
  