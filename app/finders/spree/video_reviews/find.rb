module Spree
  module VideoReviews
    class Find
      def initialize(scope:, params:)
        @scope = scope
        @videos  = params.dig(:filter, :video_ids)&.split(',')
        @approved  = params.dig(:filter, :approved)
        @order  = params.dig(:filter, :order_by)        
      end

      def execute
        video_reviews = by_video(scope)
        video_reviews = by_approved(video_reviews)
        video_reviews = by_order(video_reviews)

        video_reviews
      end

      private

      attr_reader :videos, :approved, :order, :scope

      def videos?
        videos.present?
      end

      def approved?
        approved.present?
      end

      def order?
        order.present?
      end

      def by_video(video_reviews)
        return video_reviews unless videos?
        video_reviews.where(video_id: videos)
      end

      def by_approved(video_reviews)
        return video_reviews unless approved?
        video_reviews.where(approved: approved)
      end

      def by_order(video_reviews)
        return video_reviews unless order?
        if order == 'latest'
          video_reviews.reorder("created_at ASC")
        elsif order == 'oldest'
          video_reviews.reorder("created_at DESC")
        elsif order == 'highest'
          video_reviews.reorder("rating ASC")
        elsif order == 'lowest'
          video_reviews.reorder("rating DESC")
        end

      end
    end
  end
end