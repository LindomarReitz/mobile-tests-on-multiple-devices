class ConfigurationScreen
  def initialize(driver)
    @driver = driver
  end

  def click_on_categories
    option = @driver.find_element :xpath, "//android.widget.TextView[@text='Categories']"
    option.click
  end
end
