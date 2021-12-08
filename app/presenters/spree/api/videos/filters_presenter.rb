module Spree
  module Api
    module Videos
      class FiltersPresenter
        def initialize()
          @videos_for_filters = Spree::Video::all
        end

        def to_h
          video_vendors = Spree::Video.where.not(vendor_id: nil).all.select("vendor_id")
          vendors = Spree::Vendor.where(id: video_vendors).all.select("id, name")
          video_taxons = Spree::VideoTaxon.all.select("taxon_id")
          taxons = Spree::Taxon.where(id: video_taxons).all.select("id, name")

          video_primary_products = Spree::Video.where.not(primary_product_id: nil).all.pluck(:primary_product_id)
          video_secondary_products = Spree::VideoSecondaryProduct.all.pluck(:product_id)

          product_ids = video_primary_products + video_secondary_products
          products = Spree::Product.where(id: product_ids).all.select("id, name")
          {
            vendors: vendors,
            taxons: taxons,
            products: products
          }
        end

        private

        attr_reader :videos_for_filters
        
      end
    end
  end
end