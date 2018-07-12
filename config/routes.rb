Rails.application.routes.draw do
  resources :click_trackers, except: [:index, :delete]

  resources :experiments, except: :delete do
    resources :click_trackers, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
