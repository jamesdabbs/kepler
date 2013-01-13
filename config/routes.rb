Kepler::Engine.routes.draw do
  root :to => 'models#index'

  match '/graph' => 'models#graph', :as => :graph
  match '/:name' => 'models#show',  :as => :model
end
