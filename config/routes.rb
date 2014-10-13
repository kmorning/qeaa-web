Rails.application.routes.draw do
  # Set high_voltage home page as root
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
