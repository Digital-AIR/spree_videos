class Spree::VideoReviewAbility
  include CanCan::Ability

  def initialize(user)
    video_review_ability_class = self.class
    can :create, Spree::VideoReview do
      video_review_ability_class.allow_anonymous_reviews? || !user.email.blank?
    end
    can :create, Spree::VideoFeedbackReview do
      video_review_ability_class.allow_anonymous_reviews? || !user.email.blank?
    end
  end

  def self.allow_anonymous_video_reviews?
    !Spree::Reviews::Config[:require_login]
  end
end