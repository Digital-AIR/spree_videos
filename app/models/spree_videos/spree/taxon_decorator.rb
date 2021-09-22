module SpreeVideos::Spree::TaxonDecorator
  def self.prepended(base)
    base.has_many :video_taxons, class_name: 'Spree::VideoTaxon'
    base.has_many :videos, through: :video_taxons, class_name: 'Spree::Video'
    
  end
end

Spree::Taxon.prepend SpreeVideos::Spree::TaxonDecorator