Rails.application.routes.draw do
  root to: 'site#index'
  namespace :api do
    namespace :v1 do
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
