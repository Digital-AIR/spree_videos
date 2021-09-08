module Spree
  class VideoSecondaryProduct < Spree::Base
    belongs_to :video, class_name: 'Spree::Video'
    belongs_to :product, class_name: 'Spree::Product'
  end
end