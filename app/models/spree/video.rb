class Spree::Video < ActiveRecord::Base
	validates :name,
              presence: true,
              uniqueness: { case_sensitive: false }

    validates :slug, uniqueness: true
    has_many :video_secondary_products

	has_many :products, through: :video_secondary_products, class_name: 'Spree::Product'
end
