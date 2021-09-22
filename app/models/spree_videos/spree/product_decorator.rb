module SpreeVideos::Spree::ProductDecorator
  def self.prepended(base)
    base.has_many :video_secondary_products, class_name: 'Spree::VideoSecondaryProduct'
    base.has_many :videos, through: :video_secondary_products, class_name: 'Spree::Video'

	base.has_many :videos, foreign_key: 'primary_product_id', class_name: 'Spree::Video'
     
  end
end

Spree::Product.prepend SpreeVideos::Spree::ProductDecorator