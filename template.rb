def source_paths
  [__dir__]
end

gem 'devise'
gem 'ransack'
gem 'platform_agent'
gem 'geared_pagination'
gem 'spreadsheet_architect'

gem_group :production do
  gem 'redis'
  gem 'sidekiq'
  gem 'rack-ratelimit'
  gem 'rack-timeout'
end

after_bundle do
  run 'spring stop'
  run 'yarn add jquery popper.js bootstrap@^4.2.1'\
    ' @fortawesome/fontawesome-free@^5.7.2'\
    ' cleave.js@^1.4.7'\
    ' izitoast@^1.4.0'\
    ' jquery.nicescroll@^3.7.6'\
    ' select2@^4.0.7-rc.0'\
    ' waypoints@^4.0.1'\
    ' @nguyenthanh1995/fontawesomepro'\
    ' js-cookie'\
    ' datatables.net'\
    ' datatables.net-bs4'\
    ' datatables.net-select'\
    ' datatables.net-buttons'

  directory 'app',      './app',      force: true
  directory 'config',   './config',   force: true
  directory 'lib',      './lib',      force: true
  directory 'public',   './public',   force: true
  directory 'test',     './test',     force: true
  directory 'vendor',   './vendor',   force: true

  copy_file 'Procfile', './Procfile'

  uncomment_lines 'config/puma.rb', /WEB_CONCURRENCY/

  environment do <<~RUBY
    config.app                            = config_for(:config)
    config.i18n.available_locales         = %i[ro en]
    config.i18n.default_locale            = :en
    config.time_zone                      = 'UTC'
    config.generators.scaffold_stylesheet = false
    
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  RUBY
  end

  environment nil, env: 'production' do <<~RUBY
    config.force_ssl = true
    config.active_job.queue_adapter = :sidekiq
    config.action_controller.asset_host = ENV['CLOUDFRONT_URL']
    config.cache_store = :redis_cache_store, { url: ENV['REDIS_CACHE_URL'] }

    config.middleware.use(
      Rack::Ratelimit, name: 'API',
      conditions: ->(env) { ActionDispatch::Request.new(env).format.json? },
      rate:   [50, 10.seconds],
      redis:  Redis.new
    ) { |env| ActionDispatch::Request.new(env).ip }
  RUBY
  end
  
  if yes? "\u001b[36;1m🔒 Do you want to use devise?\u001b[0m (yes/no)"
  	rails_command 'g devise:install'
  	environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'
  	devise_model = ask("\u001b[36;1mWhat do you want to call the devise model?\u001b[0m")
  	while devise_model == "" || devise_model == nil
  		devise_model = ask("\u001b[31;1mYou cannot leave this field empty‼ \u001b[36;1mWhat do you want to call the devise model?\u001b[0m")
  	end
  	rails_command "g devise #{ devise_model }"
  	rails_command 'g devise:views'
  	copy_file 'app/views/layouts/authentication.html.erb', './app/views/layouts/devise.html.erb'
  end
  
  puts "\u001b[31;1m💾 Creating and migrating the database..."
  rails_command 'db:create'
  rails_command 'db:migrate'
  
  run 'rm app/assets/stylesheets/application.css'
  
  puts "\u001b[34;1m⎇ Adding to the git repository..."
  run 'git add .'
  run 'git commit -m "Initialise rails app with Argon template"'
  puts "\u001b[34;1m✅ Done!"
  
  puts "\u001b[32;1m✅ Bundle finished! You can now start coding!"
end
puts "\u001b[32;1m✅ Completed. Processing..."
