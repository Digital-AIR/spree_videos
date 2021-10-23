module Spree
  module V2
    module Storefront
      class UploadVideoSerializer < BaseSerializer
        set_type :upload_video

        attributes :styles, :original_url

      end
    end
  end
end