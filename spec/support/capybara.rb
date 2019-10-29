require 'etc'

Capybara.server = :puma, { Silent: true }

Capybara.register_driver :chrome_headless do |app|
  Capybara::Selenium::Driver.load_selenium

  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    is_running_as_root = Etc.getpwuid.name == 'root'
    is_running_in_windows = Gem.win_platform?
    is_running_in_container = ENV['IS_CONTAINER'].in? %w[true yes 1]

    opts.args << '--headless'
    opts.args << '--no-sandbox' if is_running_as_root
    opts.args << '--disable-gpu' if is_running_in_windows
    # Workaround https://bugs.chromium.org/p/chromedriver/issues/detail?id=2650&q=load&sort=-id&colspec=ID%20Status%20Pri%20Owner%20Summary
    opts.args << '--disable-site-isolation-trials'
    opts.args << '--disable-dev-shm-usage' if is_running_in_container
  end

  Capybara::Selenium::Driver.new app, browser: :chrome, options: browser_options
end

RSpec.configure do |config|
  config.before(:each, type: :system) { driven_by :chrome_headless }
end
