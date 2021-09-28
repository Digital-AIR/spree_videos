module Spree
  module Admin
    class VideoFeedbackReviewsController < ResourceController
      belongs_to 'spree/video_review'

      def index
        @collection = parent.video_feedback_reviews
      end
    end
  end
end