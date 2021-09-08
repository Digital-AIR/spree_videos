class CreateVideoSecondaryProducts < SpreeExtension::Migration[6.1]
  def change
    create_table :spree_video_secondary_products do |t|
      t.references :video
  	  t.references :product

	end
	add_index :spree_video_secondary_products, [:video_id, :product_id], unique: true

  end
end
