KiTALL::Application.routes.draw do
  resources :users

	get "activity" => "users#activity_wall"
end
