Rails.application.routes.draw do

  resources :corrections_events

  devise_for :accounts,
    :controllers => { :registrations => "registrations" }
  resources :meetings

  resources :members

  resources :medallions, only: [:index, :show, :edit, :update]

  resources :groups do
    resources :medallions
  end

  resources :birthdays, only: [:index]

  match '/contacts',  to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  resources :event_schedules
  resources :corrections_schedules, controller: 'event_schedules', type: 'CorrectionsSchedule'

  # Set high_voltage home page as root
  HighVoltage.configure do |config|
    config.home_page = 'home'
  end
end
