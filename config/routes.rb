Spree::Core::Engine.add_routes do
  # Add your extension routes here
<<<<<<< HEAD
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
=======
  namespace :admin do
  	resources :videos
  end						
>>>>>>> 5ebaaa3 (Video Extension)
end
