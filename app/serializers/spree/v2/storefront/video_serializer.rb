module Spree
  module V2
    module Storefront
      class VideoSerializer < BaseSerializer
        set_type :video

        attributes :name, :slug, :description, :seo_title, :seo_description, :available_on, :discontinue_on

        has_many :products, key: :secondary_products
        has_many :taxons
        has_one :upload_video, serializer: :upload_video
        has_one :primary_product , serializer: :product 

        has_one :vendor

      end
    end
  end
end