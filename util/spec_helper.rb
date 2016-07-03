require "rspec/expectations"
require "selenium-webdriver"
require "rspec"
require "sauce_whisk"

def setup_sauce_env()
  if ENV['SAUCE_USERNAME'] == nil or ENV['SAUCE_ACCESS_KEY'] == nil
    abort("No Sauce Labs credentials are set!")
  end
  if ENV['SELENIUM_PORT'] == nil or ENV['SELENIUM_HOST'] == nil
    ENV['SELENIUM_HOST'] = 'ondemand.saucelabs.com'
    ENV['SELENIUM_PORT'] = '80'
  end
end

RSpec.configure do | config |
  config.before(:all) do
    setup_sauce_env()

    capabilities_config = {
      :appiumVersion => "#{ENV['appiumVersion']}",
      :deviceOrientation => "#{ENV['deviceOrientation']}",
      :deviceName => "#{ENV['deviceName']}",
      :browserName => "#{ENV['browserName']}",
      :app => "#{ENV['app']}",
      :platformName => "#{ENV['platformName']}",
      :platformVersion => "#{ENV['platformVersion']}"
    }
    if ENV['BUILD_TAG'] != nil
      capabilities_config['build'] = ENV['BUILD_TAG']
    end
    if ENV['TUNNEL_IDENTIFIER'] != nil
      capabilities_config['tunnel-identifier'] = ENV['TUNNEL_IDENTIFIER']
    end
    url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub".strip
    @driver = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities_config)
  end

  config.after(:all) do
    @driver.quit
  end
end
