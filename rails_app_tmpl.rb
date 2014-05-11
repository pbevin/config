gem_group :development, :test do
  gem "rspec-rails", require: false
  gem "cucumber-rails", require: false
  gem "capybara"
  gem "poltergeist"
  gem "launchy"
  gem "faker"
  gem "guard-rspec"
end

gem "haml-rails"
gem "quiet_assets"
gem "twitter-bootstrap-rails"

application <<"."
    config.active_record.timestamped_migrations = false
    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.template_engine :haml
      g.view_specs :false
      g.helper_specs :false
    end
.

run "bundle install"
generate "bootstrap:install", "static"
generate "bootstrap:layout", "application", "fluid"
generate "rspec:install"
generate "cucumber:install"

git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }
