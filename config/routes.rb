require 'api_constraints'

ModusOperandi::Application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    scope :module => :v1, :constraints => ApiConstraints.new(:version => 1, :default => true) do
      resources :registrations do
        member do
          get 'full_map'
        end
        resources :sections do
          member do
            get 'full_map'
          end
          resources :tasks
        end
      end

      resources :operations do
        member do
          get 'map', to: 'operations#full_map', :as => 'operation_map'
          get 'full_map'
        end
      end
    end
  end

end
