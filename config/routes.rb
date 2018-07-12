Rails.application.routes.draw do
  default_url_options host: Rails.application.config.domain

  root to: 'experiments#index'

  resources :click_trackers, except: [:index, :delete] do
    member do
      get 'redirect'
    end
  end

  resources :experiments, except: :delete do
    resources :click_trackers, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
