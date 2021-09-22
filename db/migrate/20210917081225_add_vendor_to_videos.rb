class AddVendorToVideos < ActiveRecord::Migration[6.1]
  def change
  	add_reference :spree_videos, :vendor, references: :spree_vendors, index: true
  end
end
