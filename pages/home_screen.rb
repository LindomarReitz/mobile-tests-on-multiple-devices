class HomeScreen
  def initialize(driver)
    @driver = driver
  end

  def click_on_budget_menu
    select_menu(1)
  end

  def click_on_configuration_menu
    select_menu(2)
  end

  def click_on_add
    main = @driver.find_element :id, "com.renanferrari.grana:id/main_fab"
    add_button = main.find_element :class, "android.widget.ImageButton"
    add_button.click
  end

  def click_on_add_expense
    add_expense = @driver.find_element :id, "com.renanferrari.grana:id/add_expense"
    add_expense.click
  end

  def click_on_add_income
    add_income = @driver.find_element :id, "com.renanferrari.grana:id/add_income"
    add_income.click
  end

  def get_total_expense
    total = @driver.find_element :id, "com.renanferrari.grana:id/tvExpense"
    total.text
  end

  def get_total_income
    total = @driver.find_element :id, "com.renanferrari.grana:id/tvIncome"
    total.text
  end

  def click_on_transaction
    list = @driver.find_elements :id, "android:id/list"

    transaction = list[0].click
  end

  private

  def select_menu(position)
    tabs = @driver.find_element :id, "com.renanferrari.grana:id/tabs"
    button = tabs.find_elements :class, "android.widget.ImageButton"
    button[position].click
  end
end
