require 'api_constraints'

ModusOperandi::Application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    scope :module => :v1, :constraints => ApiConstraints.new(:version => 1, :default => true) do
      resources :registrations do
        resources :sections do
          resources :tasks
        end
      end
    end
  end

end
