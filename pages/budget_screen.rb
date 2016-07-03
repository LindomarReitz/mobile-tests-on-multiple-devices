class BudgetScreen
  def initialize(driver)
    @driver = driver
  end

  def click_on_get_started
    get_started_button = @driver.find_element :id, "com.renanferrari.grana:id/budget_get_started_button"
    get_started_button.click
  end

  def get_budget
    value = @driver.find_element :id, "com.renanferrari.grana:id/text_budget_limit"
    value.text
  end
end
