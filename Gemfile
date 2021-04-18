source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Devise adds user authentication.
gem 'devise', '~> 4.7'

# Friendly ID is used to display models by a URL slug other than ID.
gem 'friendly_id', '~> 5.4'
# Draper adds an object oriented presentation layer to the Rails MVC pattern.
gem 'draper', '~> 4.0'
# Paper Trail tracks and stores changes to models.
gem 'paper_trail', '~> 12.0'

# Simple Calender is used to render different calendar views.
gem 'simple_calendar', '~> 2.4'
# Holidays returns a list of holidays on a given date.
gem 'holidays', '~> 8.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # RSpec is used as the testing framework.
  gem 'rspec-rails', '~> 5.0.1'
  # Faker is used to generate realastic random data.
  gem 'faker', '~> 2.17'
  # Capybara is used in tests to simulate the way an end user interacts with the website.
  gem 'capybara', '~> 3.35'
  # Selenium Webdriver providers the web browser driver that Capyabra uses.
  gem 'selenium-webdriver', '~> 3.142'
  # Factory Bot is used to create test factories.
  gem 'factory_bot_rails', '~> 6.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Annotate automatically adds a comment of the database schema to the top of relevant files.
  gem 'annotate', '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
