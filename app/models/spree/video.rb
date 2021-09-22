class Spree::Video < ActiveRecord::Base
	validates :name,
              presence: true,
              uniqueness: { case_sensitive: false }

    validates :slug, uniqueness: true
    validates_associated :upload_video 
    
    has_one :vendor, class_name: 'Spree::Vendor'
    has_one :primary_product, class_name: 'Spree::Product'
    has_one :upload_video, as: :viewable, dependent: :destroy, class_name: 'Spree::VideoUploadVideo'

    validates :slug, uniqueness: true
    has_many :video_secondary_products, class_name: 'Spree::VideoSecondaryProduct'
    has_many :products, through: :video_secondary_products, class_name: 'Spree::Product'

    has_many :video_taxons, class_name: 'Spree::VideoTaxon'
    has_many :taxons, through: :video_taxons, class_name: 'Spree::Taxon'

end
