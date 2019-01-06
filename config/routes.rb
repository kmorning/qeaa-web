Rails.application.routes.draw do

  namespace :admin do
    DashboardManifest.new.dashboards.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest.new.root_dashboard, action: :index
  end

  resources :corrections_events

  devise_for :accounts,
    :controllers => { :registrations => "registrations" }
  resources :meetings

  resources :members do
    collection do
      post 'reset_all_viewable', action: :reset_all_viewable
    end
  end

  resources :medallions, only: [:index, :show, :edit, :update, :destroy]

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
