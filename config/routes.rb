Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
  	resources :videos
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
  	  namespace :storefront do
  	  	resources :videos, only: [:index, :show]
        resources :video_reviews, only: [:index, :create]
  	  end
  	end
  end						

  namespace :admin do
    resources :video_reviews, only: [:index, :destroy, :edit, :update] do
      member do
        get :approve
      end
      resources :video_feedback_reviews, only: [:index, :destroy]
    end
  end

  post '/video_reviews/:review_id/feedback(.:format)' => 'video_feedback_reviews#create', as: :video_feedback_reviews
end
