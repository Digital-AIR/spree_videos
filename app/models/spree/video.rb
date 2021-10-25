class Spree::Video < ActiveRecord::Base
	validates :name,
              presence: true,
              uniqueness: { case_sensitive: false }

    validates :slug, uniqueness: true
    validates_associated :upload_video 

    has_one :vendor, class_name: 'Spree::Vendor',primary_key: 'vendor_id',  foreign_key: 'id'

    has_one :primary_product, class_name: 'Spree::Product', primary_key: 'primary_product_id',  foreign_key: 'id'
    has_one :upload_video, as: :viewable, dependent: :destroy, class_name: 'Spree::VideoUploadVideo'

    has_many :video_secondary_products, class_name: 'Spree::VideoSecondaryProduct'
    has_many :products, through: :video_secondary_products, class_name: 'Spree::Product'

    has_many :video_taxons, class_name: 'Spree::VideoTaxon'
    has_many :taxons, through: :video_taxons, class_name: 'Spree::Taxon'

    has_many :video_reviews,class_name: 'Spree::VideoReview'

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
end
