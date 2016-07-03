class KeyboardScreen
  def initialize(driver)
    @driver = driver
  end

  def set_value(value)
    number = @driver.find_element :xpath, "//android.widget.Button[@text='#{value}']"
    number.click
  end

  def confirm_value
    ok_button = @driver.find_element :id, "com.renanferrari.grana:id/set_button"
    ok_button.click
  end
end
