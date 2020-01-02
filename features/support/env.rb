
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'capybara/poltergeist'

@browser = ENV['BROWSER']

if @browser.eql?('headless')
    Capybara.register_driver :selenium do |app|
      Capybara::Poltergeist::Driver.new(app, js_erros: false)
    end
  end

Capybara.configure do |config|
    config.default_driver= :selenium if @browser.eql?('firefox')
    config.default_driver= :selenium_chrome if @browser.eql?('chrome')
    config.default_driver = :selenium if @browser.eql?('headless')
    
    config.app_host= 'https://mark7.herokuapp.com'
end

Capybara.default_max_wait_time=30