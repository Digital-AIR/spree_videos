module Spree
  module V2
    module Storefront
      class VideoSerializer < BaseSerializer
        set_type :video

        attributes :name, :slug, :description, :primary_product_id, :seo_title, :seo_description, :available_on, :discontinue_on

        has_many :products
        has_many :taxons
        has_one :upload_video, serializer: :upload_video
        has_one :primary_product, serializer: :product
      end
    end
  end
end