module Spree
  module V2
    module Storefront
      class VideoReviewSerializer < BaseSerializer
        set_type :video_review

        attributes :rating, :title, :review, :name, :show_identifier,:approved, :created_at

        belongs_to  :video
        belongs_to :user

      end
    end
  end
end