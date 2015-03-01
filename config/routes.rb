Rails.application.routes.draw do
  get 'birthday/index'

  devise_for :accounts,
    :controllers => { :registrations => "registrations" }
  resources :meetings

  resources :members

  resources :groups

  # Set high_voltage home page as root
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
