Kepler::Engine.routes.draw do
  root :to => 'models#index'

  match '/graph.json' => 'models#graph'
  match '/:name'      => 'models#show', :as => :model
end
