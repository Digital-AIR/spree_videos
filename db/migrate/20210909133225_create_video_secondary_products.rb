class CreateVideoSecondaryProducts < SpreeExtension::Migration[6.1]
  def change
    create_table :spree_video_secondary_products do |t|
<<<<<<< HEAD
      t.references :video
	  t.references :product
=======
    	t.references :video
	    t.references :product
>>>>>>> 5ebaaa3 (Video Extension)
	end
	add_index :spree_video_secondary_products, [:video_id, :product_id], unique: true

  end
end
