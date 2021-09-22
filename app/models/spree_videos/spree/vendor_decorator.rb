module SpreeVideos::Spree::VendorDecorator
  def self.prepended(base)
    base.has_many :videos, class_name: 'Spree::Video'     
  end
end

Spree::Vendor.prepend SpreeVideos::Spree::VendorDecorator