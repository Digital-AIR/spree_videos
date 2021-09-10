module SpreeVideos::Spree::ProductDecorator
  def self.prepended(base)
    base.has_many :video_secondary_products, class_name: 'Spree::VideoSecondaryProduct'
    base.has_many :videos, through: :video_secondary_products, class_name: 'Spree::Video'
<<<<<<< HEAD
	base.has_many :videos, primary_key: 'primary_product_id'
     
=======
>>>>>>> 5ebaaa3 (Video Extension)
  end
end

Spree::Product.prepend SpreeVideos::Spree::ProductDecorator