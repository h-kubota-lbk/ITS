source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '~> 5.2.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 5.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
# gem 'mini_magick', '~> 4.8'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails'
gem 'html2slim'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'paranoia'
gem 'gretel'
gem 'active_hash'
gem 'rails-i18n', '~> 5.1'
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'annotate'
  gem 'migration_comments'
  gem 'rspec-rails'
  gem 'rubocop-rspec'
  gem 'rufo'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'rack-mini-profiler'
  gem 'bullet'
  gem 'license_finder'
  gem 'rails_best_practices', require: false
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
