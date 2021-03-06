class Spree::VideoFeedbackReview < ActiveRecord::Base
  belongs_to :user, class_name: Spree.user_class.to_s
  belongs_to :video_review, dependent: :destroy

  validates :review, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: Spree.t(:you_must_enter_value_for_rating)
  }

  default_scope { most_recent_first }
  scope :most_recent_first, -> { order('spree_video_feedback_reviews.created_at DESC') }
  scope :localized, ->(lc) { where('spree_video_feedback_reviews.locale = ?', lc) }
end