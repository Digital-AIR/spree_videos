module Spree
  module Api	
    module V2
      module Platform
        class ThumbnailSerializer < BaseSerializer
          include ::Spree::Api::V2::ImageTransformationConcern
          set_type :thumbnail

          attributes :styles, :alt, :original_url
        end
      end
	end
  end
end