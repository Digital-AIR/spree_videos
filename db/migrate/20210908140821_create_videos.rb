class CreateVideos < SpreeExtension::Migration[6.1]
  def change
    create_table :spree_videos do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :seo_title
      t.text :seo_description
      t.date :available_on
      t.date :discontinue_on

      t.references :primary_product, foreign_key: { to_table: 'spree_products' }      
      t.timestamps
    end
  end
end
