KiTALL::Application.routes.draw do
	root :to => "users#index"
  resources :users
	get "activity" => "users#activity_wall"
end
