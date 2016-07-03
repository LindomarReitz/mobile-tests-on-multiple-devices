require_relative "../util/spec_helper"
require_relative "../pages/home_screen"
require_relative "../pages/transaction_screen"
require_relative "../pages/keyboard_screen"
require_relative "../pages/budget_screen"
require_relative "../pages/configuration_screen"
require_relative "../pages/category_screen"

describe "Main tests" do
  let(:home_screen) { HomeScreen.new(@driver) }
  let(:transaction_screen) { TransactionScreen.new(@driver) }
  let(:keyboard_screen) { KeyboardScreen.new(@driver) }
  let(:budget_screen) { BudgetScreen.new(@driver) }
  let(:configuration_screen) { ConfigurationScreen.new(@driver) }
  let(:category_screen) { CategoryScreen.new(@driver) }

  it "creates an expense" do
    home_screen.click_on_add
    home_screen.click_on_add_expense

    keyboard_screen.set_value(2)
    keyboard_screen.set_value(0)
    keyboard_screen.confirm_value

    transaction_screen.select_category("Clothing")
    transaction_screen.fill_note("clothes")
    transaction_screen.click_on_save

    expect(home_screen.get_total_expense).to eq("$ 20.00")
  end

  it "creates an income" do
    home_screen.click_on_add
    home_screen.click_on_add_income

    keyboard_screen.set_value(3)
    keyboard_screen.set_value(0)
    keyboard_screen.confirm_value

    transaction_screen.select_category("Salary")
    transaction_screen.fill_note("salary")
    transaction_screen.click_on_save

    expect(home_screen.get_total_income).to eq("$ 30.00")
  end

  it "deletes a transaction" do
    home_screen.click_on_transaction

    transaction_screen.click_on_delete

    expect(home_screen.get_total_income).to eq ("$ 0.00")
  end

  it "creates a budget" do
    home_screen.click_on_budget_menu
    budget_screen.click_on_get_started

    keyboard_screen.set_value(1)
    keyboard_screen.set_value(5)
    keyboard_screen.set_value(0)
    keyboard_screen.set_value(0)
    keyboard_screen.confirm_value

    expect(budget_screen.get_budget).to eq("$ 1,500.00")
  end

  it "creates a category" do
    home_screen.click_on_configuration_menu

    configuration_screen.click_on_categories

    category = "Study"
    category_screen.click_on_add
    category_screen.fill_category(category)
    category_screen.click_on_add

    expect(category_screen.get_categories).to include(category)
  end
end
