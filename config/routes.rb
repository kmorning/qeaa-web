Rails.application.routes.draw do

  devise_for :accounts,
    :controllers => { :registrations => "registrations" }
  resources :meetings

  resources :members

  resources :groups

  resources :birthdays

  # Set high_voltage home page as root
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
