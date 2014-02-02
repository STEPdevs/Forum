KiTALL::Application.routes.draw do
	root :to=>"home#index"
  resources :users
	get "activity" => "users#activity_wall"
  resources :session, :only => [:new,:create]
  delete "session"=>"session#destroy"
  get 'login' => 'session#new'
  post 'user/post' => 'question#post'
end