require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Capybara.register_driver(:headless_chrome) do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome \
      chromeOptions: { args: %w[headless disable-gpu window-size=1280x760] }
    Capybara::Selenium::Driver.new app,
      browser: :chrome, desired_capabilities: capabilities
  end
  driven_by :selenium, using: :headless_chrome

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "What time is it?"
    click_on "Ask"

    assert_text "Silly question, get dressed and go to work!"
  end

  test "I'm going to work!" do
    visit ask_url
    fill_in "question", with: "I'm going to work!"
    click_on "Ask"

    assert_text "Greats!"
  end
end
