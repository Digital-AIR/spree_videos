module Spree
  class VideoTaxon < Spree::Base
    belongs_to :video, class_name: 'Spree::Video'
    belongs_to :taxon, class_name: 'Spree::Taxon'
  end
end