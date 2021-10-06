module Spree
  module VideoDecorator
    def self.prepended(base)
      base.has_many :video_reviews
    end

    def stars
      avg_rating.try(:round) || 0
    end

    def recalculate_rating
      self[:reviews_count] = video_reviews.reload.approved.count
      self[:avg_rating] = if reviews_count > 0
                            video_reviews.approved.sum(:rating).to_f / reviews_count
                          else
                            0
                          end
      save
    end

    ::Spree::Video.prepend self if ::Spree::Video.included_modules.exclude?(self)
  end
end