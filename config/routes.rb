Rails.application.routes.draw do
  devise_for :users
  # Set high_voltage home page as root
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
