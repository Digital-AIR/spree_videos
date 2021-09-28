module Spree
  module Api
  	module V2
      module Storefront
	    class VideoReviewsController < ::Spree::Api::V2::BaseController
   	      include Spree::Api::V2::CollectionOptionsHelpers
   	      include Spree::BaseHelper

	      before_action :require_spree_current_user, only:[:create]

	      def index
            video_reviews = collection.all.page(params[:page]).per(params[:per_page])
            render_serialized_payload { serialize_collection(video_reviews) }
          end

 	      def create
            # params[:video_review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:video_review][:rating].blank?
            video_review = Spree::VideoReview.new(review_params)
		    video_review.user = spree_current_user 
		    video_review.ip_address = request.remote_ip
		    video_review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]
		    authorize! :create, Spree::VideoReview
		    video_review.save
		  
		    if video_review.persisted?
		      render_serialized_payload { serialize_resource(video_review) }
  		    else
		      render_error_payload(video_review.errors.full_messages.to_sentence)
     		end

	      end

	      private

	      def permitted_video_review_attributes
	        [:rating, :title, :review, :name, :video_id, :show_identifier]
	      end

	      def review_params
	        params.require(:video_review).permit(permitted_video_review_attributes)
	      end

	      def model_class
            ::Spree::VideoReview
          end

          def scope
            ::Spree::VideoReview
          end

          def collection
            @collection ||= collection_finder.new(scope: scope, params: params).execute
          end

          def collection_finder
            Spree::VideoReviews::Find
          end

          def resource_serializer
            Spree::V2::Storefront::VideoReviewSerializer
          end

          def collection_serializer
            Spree::V2::Storefront::VideoReviewSerializer
          end
        
        end
      end
    end
  end
end
