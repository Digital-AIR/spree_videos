module SpreeVideos
  module ProductSerializerDecorator
    def self.prepended(base)

      base.has_many :video_primary_product
      base.has_many :videos
    end
  end
end

Spree::V2::Storefront::ProductSerializer.prepend(SpreeVideos::ProductSerializerDecorator)