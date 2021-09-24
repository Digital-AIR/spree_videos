module SpreeVideos::Spree::ProductDecorator
  def self.prepended(base)
    base.has_many :video_secondary_products, class_name: 'Spree::VideoSecondaryProduct'
    base.has_many :videos, through: :video_secondary_products, class_name: 'Spree::Video'

	base.has_many :video_primary_product, class_name: 'Spree::Video', foreign_key: 'primary_product_id'
     
  end
end

Spree::Product.prepend SpreeVideos::Spree::ProductDecorator