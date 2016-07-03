class TransactionScreen
  def initialize(driver)
    @driver = driver
  end

  def select_category(category)
    category_option = @driver.find_element :id, "com.renanferrari.grana:id/btCategory"
    category_option.click

    option = @driver.find_element :xpath, "//android.widget.TextView[@text='#{category}']"
    option.click
  end

  def fill_note(text)
    note = @driver.find_element :id, "com.renanferrari.grana:id/etNote"
    note.send_keys text
  end

  def click_on_save
    save_button = @driver.find_element :id, "com.renanferrari.grana:id/action_save"
    save_button.click
  end

  def click_on_delete
    delete_button = @driver.find_element :id, "com.renanferrari.grana:id/btDelete"
    delete_button.click

    confirm = @driver.find_element :id, "android:id/button1"
    confirm.click
  end
end
