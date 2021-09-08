Spree::Core::Engine.add_routes do
  # Add your extension routes here
<<<<<<< HEAD
  namespace :admin do
  	resources :videos
  end


  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
	  namespace :storefront do
	  	resources :videos
	  end
	end
  end						
=======
>>>>>>> 661b9d7 (second commit)
end
