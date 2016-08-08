Rails.application.routes.draw do

	root 'welcome#index'

	resources :events do
		resources :attendees, controller: 'event_attendees'
		resource :location, controller: 'event_locations'

    collection do
      get :latest
    end
	end

	get 'welcome', to: 'welcome#index'

	get 'welcome/say_hello' => 'welcome#say'

	# 外卡路由
	# 它會將/foo/bar這樣的網址自動對應到Controller foo的bar Action、如果是/foo這樣的網址，則預設對應到index action。
	# match ':controller( /:action( /:id( .:format ) ) )', :via => :all


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
