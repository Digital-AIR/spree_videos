module Spree
  module Videos
    class Find
      def initialize(scope:, params:)
        @scope = scope
        @taxons  = params.dig(:filter, :taxon_ids)&.split(',')
        @vendors  = params.dig(:filter, :vendor_ids)&.split(',')
        @avg_ratings  = params.dig(:filter, :avg_ratings)&.split(',')

      end

      def execute
        videos = by_taxons(scope)
        videos = by_vendors(videos)
        videos = by_ratings(videos)

        videos
      end

      private

      attr_reader :taxons, :vendors, :avg_ratings, :scope

      def taxons?
        taxons.present?
      end

      def vendors?
        vendors.present?
      end

      def avg_ratings?
        avg_ratings.present?
      end

      def by_taxons(videos)
        return videos unless taxons?
        videos.joins(:taxons).where(spree_video_taxons: {taxon_id: taxons})
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