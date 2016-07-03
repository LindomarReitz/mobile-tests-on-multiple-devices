class CategoryScreen
  def initialize(driver)
    @driver = driver
  end

  def click_on_add
    add_button = @driver.find_element :id, "com.renanferrari.grana:id/fab"
    add_button.click
  end

  def fill_category(name)
    category = @driver.find_element :class, "android.widget.EditText"
    category.send_keys name
  end

  def get_categories
    categories = []
    elements = @driver.find_elements :id, "com.renanferrari.grana:id/category_name"

    elements.each do |element|
      categories << element.text
    end

    categories
  end
end
