require 'api_constraints'

ModusOperandi::Application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    scope :module => :v1, :constraints => ApiConstraints.new(:version => 1, :default => true) do
      resources :registrations do
        member do
          get 'full_map'
        end
        resources :sections do
          resources :tasks
        end
      end
    end
  end

end
