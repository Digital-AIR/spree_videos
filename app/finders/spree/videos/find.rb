module Spree
  module Videos
    class Find
      def initialize(scope:, params:)
        @scope = scope
        @taxons  = params.dig(:filter, :taxon_ids)&.split(',')
        @vendors  = params.dig(:filter, :vendor_ids)&.split(',')

      end

      def execute
        p "edoweodij"
        videos = by_taxons(scope)
        videos = by_vendors(scope)

        videos
      end

      private

      attr_reader :taxons, :vendors, :scope

      def taxons?
        taxons.present?
      end

      def vendors?
        vendors.present?
      end

      def by_taxons(videos)
        return videos unless taxons?
        videos.joins(:taxons).where(spree_video_taxons: {taxon_id: taxons})
      end

      def by_vendors(videos)
        return videos unless vendors?
        videos.where(vendor_id: vendors)

      end

    end
  end
end