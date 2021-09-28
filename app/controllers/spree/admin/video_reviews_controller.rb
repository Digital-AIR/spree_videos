module Spree
  module Admin
    class VideoReviewsController < ResourceController
      helper Spree::ReviewsHelper
     
      def index
        @s = if params[:ids].present?
                       scope.where(id: params[:ids].split(','))
                     else
                       scope.load.ransack(
                         params[:q]
                       ).result
                     end
      end

      def approve
        video_review = Spree::VideoReview.find(params[:id])
        if video_review.update_attribute(:approved, true)
          flash[:notice] = Spree.t(:info_approve_review)
        else
          flash[:error] = Spree.t(:error_approve_review)
        end

        redirect_to admin_video_reviews_path
      end

      def edit
        return if @video_review.video
        flash[:error] = "The reviewed video doesn't exist anymore"

        redirect_to admin_reviews_path
      end

      private

      def collection
          params[:q] = {} if params[:q].blank?
          video_reviews = super.order(priority: :asc)
          @search = video_reviews.ransack(params[:q])

          @collection = @search.result.
              includes([:video, :user, :video_feedback_reviews]).
              page(params[:page]).
              per(params[:per_page])
          @collection
      end

      def scope
          Spree::VideoReview.accessible_by(current_ability)
      end

      # def collection
      #   params[:q] ||= {}
      #   @search = Spree::VideoReview.ransack(params[:q])
      #   @collection = @search.result.includes([:video, :user, :video_feedback_reviews]).page(params[:page]).per(params[:per_page])
      # end
    end
  end
end
