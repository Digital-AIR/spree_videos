module SpreeVideos
  module ProductsFinderDecorator
    def initialize(scope:, params:, current_currency: nil)
      super

      @videos = params.dig(:filter, :video_ids)&.split(',')
    end

    def execute
      products = by_video(super)
      products.distinct
    end

    private

    attr_reader :videos

    def videos?
      videos.present?
    end

    def by_video(products)
      return products unless videos?
      a = products.joins(:video_primary_product).where(spree_videos: {id: videos})  
      b = products.joins(:videos).where(spree_video_secondary_products: {video_id: videos})
      ids = a.ids + b.ids
      products.where(id: ids)
    end

  end
end

::Spree::Products::Find.prepend(SpreeVideos::ProductsFinderDecorator)
