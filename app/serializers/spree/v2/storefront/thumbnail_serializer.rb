module Spree
  module V2
    module Storefront
      class ThumbnailSerializer < BaseSerializer
      	include ::Spree::Api::V2::ImageTransformationConcern
        set_type :thumbnail

        attributes :styles, :alt, :original_url
      end
    end
  end
end