module Spree
  module Videos
    class Find
      def initialize(scope:, params:)
        @scope = scope
        @taxons  = params.dig(:filter, :taxon_ids)&.split(',')
        @vendors  = params.dig(:filter, :vendor_ids)&.split(',')
        @avg_ratings  = params.dig(:filter, :avg_ratings)&.split(',')
        @name = params.dig(:filter, :name)
        @products = params.dig(:filter, :product_ids)&.split(',')

      end

      def execute
        videos = by_taxons(scope)
        videos = by_vendors(videos)
        videos = by_ratings(videos)
        videos = by_name(videos)
        videos = by_products(videos)

        videos
      end

      private

      attr_reader :name, :taxons, :vendors, :avg_ratings, :products, :scope

      def products?
        products.present?
      end

      def name?
        name.present?
      end

      def taxons?
        taxons.present?
      end

      def vendors?
        vendors.present?
      end

      def avg_ratings?
        avg_ratings.present?
      end

       def name_matcher
        Spree::Video.arel_table[:name].matches("%#{name}%")
      end

      def by_name(videos)
        return videos unless name?
        videos.where(name_matcher)
      end

      def by_taxons(videos)
        return videos unless taxons?
        videos.joins(:taxons).where(spree_video_taxons: {taxon_id: taxons})
      end

      def by_products(videos)
        return videos unless products?
        a = videos.joins(:primary_product).where(spree_products: {id: products})
        b = videos.joins(:products).where(spree_video_secondary_products: {product_id: products})
        ids = a.ids + b.ids
        videos.where(id: ids)
      end

      def by_vendors(videos)
        return videos unless vendors?
        videos.where(vendor_id: vendors)
      end

      def by_ratings(videos)
        return videos unless avg_ratings?
        videos.where(avg_rating: avg_ratings)
      end

    end
  end
end