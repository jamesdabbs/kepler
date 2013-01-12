Kepler::Engine.routes.draw do
  root :to => 'models#index'

  match '/:name' => 'models#show', :as => :model
end
