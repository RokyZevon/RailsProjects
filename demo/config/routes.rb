Rails.application.routes.draw do

	resources :events

	root 'welcome#index'

	get 'welcome', to: 'welcome#index'

	get 'welcome/say_hello' => 'welcome#say'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
