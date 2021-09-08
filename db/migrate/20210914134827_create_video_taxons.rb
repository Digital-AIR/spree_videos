class CreateVideoTaxons < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_video_taxons do |t|
      t.references :video
	  t.references :taxon

      t.timestamps
    end
    add_index :spree_video_taxons, [:video_id, :taxon_id], unique: true
  end
end
