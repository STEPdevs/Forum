KiTALL::Application.routes.draw do
	root :to => "users#index"
  resources :users
	get "activity" => "users#activity_wall"
  resources :session, :only => [:new,:create,:destroy]
  get 'login' => 'session#new'
  post 'user/post' => 'question#post'
end
